module docgen;
import std::io;
import std::collections::map;
import std::collections::list;
import std::sort;
import std::math;

alias Modules = HashMap {String, List {String}};
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
				io::fprintf(&out_file, "```c3\n%s\n```\n", decl)!!;
			}
		}
	}

	return 0;
}

fn void? collect_decls(Allocator alloc, Modules* modules, String data, String filename)
{
	String module_name = filename;
	List {String} curr_mod;// = allocator::new(alloc, List {String});
	curr_mod.init(alloc);
	for (usz i = 0; i < data.len; i++) @pool()
	{
		switch
		{
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '/':
				skip_line_comment(&i, data);
			case i + 2 < data.len && data[i] == '/' && data[i + 1] == '*':
				skip_comment(&i, data);
			case i + 2 < data.len && data[i] == '<' && data[i + 1] == '*':
				skip_doc_comment(&i, data);
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
					curr_mod = modules.@get_or_set(module_name, *(List {String}){}.init(alloc));
					// if ()
					// modules.set(module_name)
				}
				else if (try idx = data[i..].index_of("struct") && idx == 0)
				{
					String struc = data[i:data[i..].index_of("{") ?? 0];
					if (!struc.contains("@private") && !struc.contains("@local")) curr_mod.push(struc.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", struc.trim())!;
					i += struc.len - 1;
				}
				else if (try idx = data[i..].index_of("fn") && idx == 0)
				{
					String func = parse_function(&i, data, "fn");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push(func.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("extern fn") && idx == 0)
				{
					String func = parse_function(&i, data, "extern fn");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push(func.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("macro") && idx == 0)
				{
					String func = parse_function(&i, data, "macro");
					if (!func.contains("@private") && !func.contains("@local")) curr_mod.push(func.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("typedef") && idx == 0)
				{
					String type = data[i:data[i..].index_of(";") ?? 0];
					if (!type.contains("@private") && !type.contains("@local")) curr_mod.push(type.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", type.trim())!;
					i += type.len - 1;
				}
				else if (try idx = data[i..].index_of("alias") && idx == 0)
				{
					String al = data[i:data[i..].index_of(";") ?? 0];
					if (!al.contains("@private") && !al.contains("@local")) curr_mod.push(al.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", al.trim())!;
					i += al.len - 1;
				}
				else if (try idx = data[i..].index_of("enum") && idx == 0)
				{
					String en = data[i:data[i..].index_of("{") ?? 0];
					if (!en.contains("@private") && !en.contains("@local")) curr_mod.push(en.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", en.trim())!;
					i += en.len - 1;
				}
				else if (try idx = data[i..].index_of("faultdef") && idx == 0)
				{
					String faults = data[i:data[i..].index_of(";") ?? 0];
					if (!faults.contains("@private") && !faults.contains("@local")) curr_mod.push(faults.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", faults.trim())!;
					i += faults.len - 1;
				}
				else if (try idx = data[i..].index_of("bitstruct") && idx == 0)
				{
					String bitstruc = data[i:data[i..].index_of("{") ?? 0];
					if (!bitstruc.contains("@private") && !bitstruc.contains("@local")) curr_mod.push(bitstruc.trim().copy(alloc));
					// io::fprintf(out, "```c3\n%s\n```\n", bitstruc.trim())!;
					i += bitstruc.len - 1;
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
fn void skip_doc_comment(usz* i, String data)
{
	*i += 1;
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		if (data[*i] == '<' && *i + 2 < data.len && data[*i + 1] == '*')
		{
			count ++;
			*i += 1;
		}
		if (data[*i] == '*' && *i + 2 < data.len && data[*i + 1] == '>')
		{
			count --;
			*i += 1;
		}
	}

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
	for (usz count = 1; count != 0 && *i < data.len; *i += 1)
	{
		switch
		{
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '/':
				skip_line_comment(i, data);
			case *i + 2 < data.len && data[*i] == '/' && data[*i + 1] == '*':
				skip_comment(i, data);
			case *i + 2 < data.len && data[*i] == '<' && data[*i + 1] == '*':
				skip_doc_comment(i, data);
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
	}
}
