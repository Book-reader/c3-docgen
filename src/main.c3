module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
import std::collections::pair;
import std::sort;
import std::math;

alias Modules = HashMap {String, List {Item}};
fn int main(String[] args)
{
	File out_file = file::open(args[1], "wb")!!;
	defer (void)out_file.close();

	Modules modules;
	modules.init(tmem);
	Allocator alloc = tmem;
	foreach (str : args[2..]) @pool()
	{
		String file_data = (String)file::load(tmem, str)!!;
		Path str_path = path::new(alloc, str)!!;
		collect_decls(alloc, &modules, file_data, str_path.basename()[:^str_path.extension().len + 1])!!;
	};

	String[] module_list = modules.tkeys();
	sort::insertionsort(module_list, fn int (String a, String b)
		{
			int res;
			foreach (i, c : a[:math::min(a.len, b.len)])
			{
				if (c > b[i])
				{
					return 1;
				}
				else if (c < b[i])
				{
					return -1;
				}
			}
			return compare_to(a.len, b.len);
		});
	foreach (mod : module_list)
	{
		if (!is_hidden(mod) && !mod.contains("@test"))
		{
			io::printfn("%s", mod);
			io::fprintf(&out_file, "### `%s`\n", mod)!!;
			foreach (decl : modules.get(mod)!!)
			{
				io::fprintf(&out_file, "\n---\n\n")!!;
				io::fprintf(&out_file, "#### `%s`\n\n", decl.name)!!;
				/*if (decl.doc_comment.comment.len() > 0)
				{
					foreach (str : decl.doc_comment.comment)
					{
						io::fprintf(&out_file, "%s%s", str, str.len > 0 && str[^1] == '\n' ? "" : "\n")!!;
					}
					io::fprintf(&out_file, "\n")!!;
				}*/
				foreach (i, comment : decl.doc_comments)
				{
					if (comment.contracts.len() > 0)
					{
						io::fprintf(&out_file, "```c3\n<*\n")!!;
						foreach (str : comment.contracts)
						{
							io::fprintf(&out_file, " %s%s", str, str.len > 0 && str[^1] == '\n' ? "" : "\n")!!;
						}
						io::fprintf(&out_file, "*>\n")!!;
						io::fprintf(&out_file, "%s\n```\n", decl.contents[i])!!;
					}
					else
					{
						io::fprintf(&out_file, "```c3\n%s\n```\n", decl.contents[i])!!;
					}
					if (comment.comment.len() > 0)
					{
						io::fprintf(&out_file, "\n")!!;
						foreach (str : comment.comment)
						{
							io::fprintf(&out_file, "%s%s", str, str.len > 0 && str[^1] == '\n' ? "" : "\n")!!;
						}
						io::fprintf(&out_file, "\n")!!;
					}
				}
			}
		}
	}

	return 0;
}

struct Item
{
	String name;
	List {String} contents;
	List {DocComment} doc_comments;
}

struct DocComment
{
	List {String} comment;
	List {String} contracts;
}

fn void? collect_decls(Allocator alloc, Modules* modules, String data, String filename)
{
	String module_name = filename;
	List {Item} curr_mod;
	DocComment comment;
	curr_mod.init(alloc);
	for (usz i = 0; i < data.len; i++) @pool()
	{
		switch
		{
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '/':
				skip_line_comment(&i, data);
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '*':
				skip_comment(&i, data);
			case i + 3 < data.len && data[i] == '<' && data[i + 1] == '*' && data[i + 2] != '>':
				comment = handle_doc_comment(alloc, &i, data);
			case data[i] == '`':
				skip_string(&i, data, '`');
			case data[i] == '\'':
				skip_string(&i, data, '\'');
			case data[i] == '"':
				skip_string(&i, data, '"');
			case data[i] == '{':
				skip_block(&i, data, '{', '}');
			default:
				if (try idx = data[i..].index_of("module") && idx == 0)
				{
					if (curr_mod.len() != 0)
					{
						modules.set(module_name, curr_mod);
					}
					String mod = data[i:data[i..].index_of(";") ?? 0];
					i += mod.len - 1;
					module_name = mod["module".len..].trim();
					curr_mod = modules.@get_or_set(module_name, *(List {Item}){}.init(alloc));
					comment = {};
				}
				else if (try idx = data[i..].index_of("fn") && idx == 0)
				{
					String[2] func = parse_function(&i, data, "fn");
					// if (!is_hidden(func[1])) curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					bool dupe = false;
					foreach (&item : curr_mod) if (item.name == func[0])
					{
						item.contents.push(func[1].trim().copy(alloc));
						item.doc_comments.push(comment);
						dupe = true;
						break;
					}
					if (!dupe)
					{
						curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					}
					comment = {};
				}
				else if (try idx = data[i..].index_of("extern fn") && idx == 0)
				{
					String[2] func = parse_function(&i, data, "extern fn");
					// if (!is_hidden(func[1])) curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					bool dupe = false;
					foreach (&item : curr_mod) if (item.name == func[0])
					{
						item.contents.push(func[1].trim().copy(alloc));
						item.doc_comments.push(comment);
						dupe = true;
						break;
					}
					if (!dupe)
					{
						curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					}
					comment = {};
				}
				else if (try idx = data[i..].index_of("macro") && idx == 0)
				{
					String[2] func = parse_function(&i, data, "macro");
					// if (!is_hidden(func[1])) curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					bool dupe = false;
					foreach (&item : curr_mod) if (item.name == func[0])
					{
						item.contents.push(func[1].trim().copy(alloc));
						item.doc_comments.push(comment);
						dupe = true;
						break;
					}
					if (!dupe)
					{
						curr_mod.push({func[0].copy(alloc), list_of_with(String, alloc, func[1].trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
					}
					comment = {};
				}
				else
				{
					const Pair {String[2], GetNameFn}[*] MATCHES = {
						{{"typedef", ";"}, default_getname_fn("typedef")},
						{{"struct", "{"}, default_getname_fn("struct")},
						{{"alias", ";"}, default_getname_fn("alias")},
						{{"enum", "{"}, default_getname_fn("enum")},
						{{"faultdef", ";"}, fn String(String val) => val["faultdef".len..].trim().treplace("\n", "").treplace("\t", " ").treplace("  ", " ")},
						{{"bitstruct", "{"}, default_getname_fn("bitstruct")},
						{{"const", ";"}, fn String(String val) { String s = val[..val.index_of("=") - 1 ?? 0].trim(); return s[s.rindex_of(" ") ?? s.rindex_of("\t") ?? s.rindex_of("\n") ?? 0..].trim();}},
					};
					foreach (check : MATCHES)
					{
						if (try idx = data[i..].index_of(check.first[0]) && idx == 0)
						{
							String val = data[i:data[i..].index_of(check.first[1]) ?? 0];
							io::printfn("checking '%s'", val.trim());
							String name = check.second(val.trim());
							io::printfn("name was '%s'", name.trim());
							if (!is_hidden(val))
							{
								bool dupe = false;
								foreach (&item : curr_mod) if (item.name == name)
								{
									item.contents.push(val.trim().copy(alloc));
									item.doc_comments.push(comment);
									dupe = true;
									break;
								}
								if (!dupe)
								{
									curr_mod.push({name.copy(alloc), list_of_with(String, alloc, val.trim().copy(alloc)), list_of_with(DocComment, alloc, comment)});
								}
							}
							comment = {};
							i += val.len - 1;
							break;
						}
					}
				}
		}
	};
	if (curr_mod.len() != 0)
	{
		modules.set(module_name, curr_mod);
	}
}
fn String[2] parse_function(usz* i, String data, String function_str)
{
	String[2] ret;
	usz start_idx = *i;
	while (*i < data.len && data[*i] != '(') *i += 1;
	ret[0] = data[start_idx..*i - 1];
	ret[0] = ret[0][ret[0].rindex_of(" ") ?? ret[0].rindex_of("\t") ?? ret[0].rindex_of("\n") ?? 0..^1].trim();
	skip_block(i, data, '(', ')');
	while (*i < data.len)
	{
		if (*i < data.len && data[*i] == '@')
		{
			*i += 1;
			while (*i < data.len && (data[*i].is_alpha() || data[*i] == '_')) *i += 1;
			if (*i < data.len && data[*i] == '(') skip_block(i, data, '(', ')');
		}
		else if (*i < data.len && data[*i].is_space())
		{
			*i += 1;
		}
		else
		{
			break;
		}
	}
	*i -= 1;
	defer
	{
		if (try idx = data[*i..].trim().index_of("=>") && idx == 0)
		{
			skip_line_comment(i, data); // this is not what skip_line_comment is meant to be used for
		}
		else
		{
			while (*i < data.len && data[*i] != '{') *i += 1;
			skip_block(i, data, '{', '}');
		}
	}
	ret[1] = data[start_idx..*i];
	return ret;
}

fn void skip_line_comment(usz* i, String data)
{
	*i += 1;
	while (*i < data.len && data[*i] != '\n') *i += 1;
}
fn void skip_comment(usz* i, String data)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		if (data[*i] == '/' && *i + 2 < data.len && data[*i + 1] == '*')
		{
			count ++;
			*i += 1;
		}
		if (data[*i] == '*' && *i + 2 < data.len && data[*i + 1] == '/')
		{
			count --;
			*i += 1;
		}
	}
}
fn DocComment handle_doc_comment(Allocator alloc, usz* i, String data) => @pool()
{
	usz start_idx = *i;
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		if (data[*i] == '<' && *i + 2 < data.len && data[*i + 1] == '*')
		{
			count ++;
			*i += 1;
		}
		else if (data[*i] == '*' && *i + 2 < data.len && data[*i + 1] == '>')
		{
			count --;
			*i += 1;
		}
	}
	DocComment doc;
	doc.comment.init(alloc);
	doc.contracts.init(alloc);

	String trimmed = data[start_idx..*i];
	trimmed = trimmed[trimmed.index_of("<*") + 2 ?? 0..trimmed.rindex_of("*>") - 2 ?? trimmed.len - 1].trim();

	bool comment = true;

	String starting_chars;
	foreach (line : trimmed.tsplit("\n"))
	{
		if (starting_chars.ptr == null && line.trim() != "" && line.len != line.trim_left().len)
		{
			starting_chars = line[:line.len - line.trim_left().len];
		}
		String line_trim = starting_chars.ptr == null || line.len < starting_chars.len || line[:starting_chars.len] != starting_chars ? line : line[starting_chars.len..];
		if (line_trim.len > 0 && line_trim[0] == '@') comment = false;
		if (comment)
		{
			doc.comment.push(line_trim.copy(alloc));
		}
		else if (line_trim.trim().len > 0) // skip empty lines between contracts
		{
			doc.contracts.push(line_trim.copy(alloc));
		}
	}
	// Remove trailing newline caused by space between comment and contracts
	if (doc.comment.len() > 0 && doc.comment[^1].len == 0) doc.comment.remove_last();
	
	return doc;
}
fn void skip_string(usz* i, String data, char string_char)
{
	for (*i += 1; *i < data.len && data[*i] != string_char; *i += 1)
	{
		if (data[*i] == '\\')
		{
			*i += 1;
			continue;
		}
	}
}
fn void skip_block(usz* i, String data, char block_start, char block_end)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1) @pool()
	{
		switch
		{
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '/':
				skip_line_comment(i, data);
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '*':
				skip_comment(i, data);
			case *i + 3 < data.len && data[*i] == '<' && data[*i + 1] == '*' && data[*i + 2] != '>':
				handle_doc_comment(tmem, i, data);
			case data[*i] == '`':
				skip_string(i, data, '`');
			case data[*i] == '\'':
				skip_string(i, data, '\'');
			case data[*i] == '"':
				skip_string(i, data, '"');
			case data[*i] == block_start:
				count ++;
			case data[*i] == block_end:
				count --;
		}
	};
}
fn bool is_hidden(String s) => s.contains("@private") || s.contains("@local");

macro slice_while(array, func)
{
	foreach (i, c : array)
	{
		if (!func(c)) return array[..i - 1];
	}
	return array[..];
}

macro list_of_with($Type, Allocator alloc, val) => *(List {$Type}){}.init_with_array(alloc, {val});

alias GetNameFn = fn String(String);
macro GetNameFn default_getname_fn(String $name) => fn String(String val) => slice_while(val[$name.len..].trim(), fn bool(char c) => c.is_alpha() || c == '_');
