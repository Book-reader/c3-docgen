module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
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
					res = 1;
					break;
				}
				else if (c < b[i])
				{
					res = -1;
					break;
				}
			}
			if (res == 0) res = a.len > b.len ? 1 : a.len < b.len ? -1 : 0;
			// io::printfn("a: '%s', b: '%s'", a, b);
			// io::printfn("result: %s", res);
			// return a1.len == b1.len ? 0 : 1;
			return res;
		});
	foreach (mod : module_list)
	{
		if (!mod.contains("@private") && !mod.contains("@local") && !mod.contains("@test"))
		{
			io::printfn("%s", mod);
			io::fprintf(&out_file, "### `%s`\n", mod)!!;
			foreach (decl : modules.get(mod)!!)
			{
				if (decl.doc_comment.comment.len() > 0)
				{
					io::fprintf(&out_file, "\n")!!;
					foreach (str : decl.doc_comment.comment)
					{
						io::fprintf(&out_file, "%s%s", str, str.len > 0 && str[^1] == '\n' ? "" : "\n")!!;
						// io::printfn("sefwfewfwe: [%s]%s", str.len, str);
					}
				}
				if (decl.doc_comment.contracts.len() > 0)
				{
					if (decl.doc_comment.comment.len() == 0) io::fprintf(&out_file, "\n")!!;
					io::fprintf(&out_file, "```c3\n<*\n")!!;
					foreach (str : decl.doc_comment.contracts)
					{
						io::fprintf(&out_file, " %s%s", str, str.len > 0 && str[^1] == '\n' ? "" : "\n")!!;
					}
					io::fprintf(&out_file, "*>\n")!!;
					io::fprintf(&out_file, "%s\n```\n", decl.item)!!;
				}
				else
				{
					io::fprintf(&out_file, "```c3\n%s\n```\n", decl.item)!!;
				}
			}
		}
	}

	return 0;
}

struct Item
{
	String item;
	DocComment doc_comment;
}

struct DocComment
{
	List {String} comment;
	List {String} contracts;
}

fn void? collect_decls(Allocator alloc, Modules* modules, String data, String filename)
{
	String module_name = filename;
	List {Item} curr_mod;// = allocator::new(alloc, List {String});
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
				// io::printfn("comment is: %s", comment.comment);
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
					// io::fprintf(out, "### `%s`\n", mod["module".len..].trim())!;
					i += mod.len - 1;
					module_name = mod["module".len..].trim();
					// if (modules.has_key(module_name))
					// {
					// curr_mod = modules.get_ref(module_name) ?? (List {String}){}.init(alloc);
					/*if (modules.has_key(module_name))
					{
						curr_mod = modules.get(module_name)!!;
					}
					else
					{
						curr_mod.init(alloc);
						// modules.set()
					}*/
					// }
					curr_mod = modules.@get_or_set(module_name, *(List {Item}){}.init(alloc));
					comment = {};
					// if ()
					// modules.set(module_name)
				}
				else if (try idx = data[i..].index_of("struct") && idx == 0)
				{
					String struc = data[i:data[i..].index_of("{") ?? 0];
					if (!struc.contains("@private") && !struc.contains("@local")) curr_mod.push({struc.trim().copy(alloc), comment});
					// io::fprintf(out, "```c3\n%s\n```\n", struc.trim())!;
					comment = {};
					i += struc.len - 1;
				}
				else if (try idx = data[i..].index_of("fn") && idx == 0)
				{
					String func = parse_function(&i, data, "fn");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push({func.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("extern fn") && idx == 0)
				{
					String func = parse_function(&i, data, "extern fn");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push({func.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("macro") && idx == 0)
				{
					String func = parse_function(&i, data, "macro");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push({func.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("typedef") && idx == 0)
				{
					String type = data[i:data[i..].index_of(";") ?? 0];
					if (!type.contains("@private") && !type.contains("@local")) curr_mod.push({type.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", type.trim())!;
					i += type.len - 1;
				}
				else if (try idx = data[i..].index_of("alias") && idx == 0)
				{
					String al = data[i:data[i..].index_of(";") ?? 0];
					if (!al.contains("@private") && !al.contains("@local")) curr_mod.push({al.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", al.trim())!;
					i += al.len - 1;
				}
				else if (try idx = data[i..].index_of("enum") && idx == 0)
				{
					String en = data[i:data[i..].index_of("{") ?? 0];
					if (!en.contains("@private") && !en.contains("@local")) curr_mod.push({en.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", en.trim())!;
					i += en.len - 1;
				}
				else if (try idx = data[i..].index_of("faultdef") && idx == 0)
				{
					String faults = data[i:data[i..].index_of(";") ?? 0];
					if (!faults.contains("@private") && !faults.contains("@local")) curr_mod.push({faults.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", faults.trim())!;
					i += faults.len - 1;
				}
				else if (try idx = data[i..].index_of("bitstruct") && idx == 0)
				{
					String bitstruc = data[i:data[i..].index_of("{") ?? 0];
					if (!bitstruc.contains("@private") && !bitstruc.contains("@local")) curr_mod.push({bitstruc.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", bitstruc.trim())!;
					i += bitstruc.len - 1;
				}
				else if (try idx = data[i..].index_of("const") && idx == 0)
				{
					String cons = data[i:data[i..].index_of("=") ?? 0];
					if (!cons.contains("@private") && !cons.contains("@local")) curr_mod.push({cons.trim().copy(alloc), comment});
					comment = {};
					// io::fprintf(out, "```c3\n%s\n```\n", cons.trim())!;
					i += cons.len - 1;
				}

/*				else
				{
					io::printf("%c", data[i]);
				}*/
		}
	};
	if (curr_mod.len() != 0)
	{
		modules.set(module_name, curr_mod);
	}
}
fn String parse_function(usz* i, String data, String function_str)
{
	usz start_idx = *i;
	while (*i < data.len && data[*i] != '(') *i += 1;
	skip_block(i, data, '(', ')');
	while (*i < data.len)
	{
		// io::printfn("a: %s", data[*i:30]);
		if (*i < data.len && data[*i] == '@')
		{
			*i += 1;
			while (*i < data.len && (data[*i].is_alpha() || data[*i] == '_')) *i += 1;
			if (*i < data.len && data[*i] == '(') skip_block(i, data, '(', ')');
			// io::printfn("a");
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
	return data[start_idx..*i];
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
	// io::printfn("%s", trimmed);
	trimmed = trimmed[trimmed.index_of("<*") + 2 ?? 0..trimmed.rindex_of("*>") - 2 ?? trimmed.len - 1].trim();

	bool comment = true;

	String starting_chars;
	foreach (line : trimmed.tsplit("\n"))
	{
		// io::printfn("%s", line.trim());
		if (starting_chars.ptr == null && line.trim() != "" && line.len != line.trim_left().len)
		{
			starting_chars = line[:line.len - line.trim_left().len];
			// io::printfn("'%s'", starting_chars);
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
