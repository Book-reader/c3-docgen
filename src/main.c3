module docgen;
import std::io;

fn int main(String[] args)
{
	File out_file = file::open(args[1], "wb")!!;
	defer (void)out_file.close();
	foreach (str : args[2..])
	{
		String file_data = (String)file::load(tmem, str)!!;
		print_decls(file_data, &out_file)!!;
	}
	return 0;
}

fn void? print_decls(String data, OutStream out)
{
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
					String mod = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "### `%s`\n", mod["module".len..].trim())!;
					i += mod.len - 1;
				}
				else if (try idx = data[i..].index_of("struct") && idx == 0)
				{
					String struc = data[i:data[i..].index_of("{") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", struc.trim())!;
					i += struc.len - 1;
				}
				else if (try idx = data[i..].index_of("fn") && idx == 0)
				{
					String func = parse_function(&i, data, "fn");
					io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("macro") && idx == 0)
				{
					String func = parse_function(&i, data, "macro");
					io::fprintf(out, "```c3\n%s\n```\n", func.trim())!;
				}
				else if (try idx = data[i..].index_of("typedef") && idx == 0)
				{
					String type = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", type.trim())!;
					i += type.len - 1;
				}
				else if (try idx = data[i..].index_of("alias") && idx == 0)
				{
					String al = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", al.trim())!;
					i += al.len - 1;
				}
				else if (try idx = data[i..].index_of("enum") && idx == 0)
				{
					String en = data[i:data[i..].index_of("{") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", en.trim())!;
					i += en.len - 1;
				}
				else if (try idx = data[i..].index_of("faultdef") && idx == 0)
				{
					String faults = data[i:data[i..].index_of(";") ?? 0];
					io::fprintf(out, "```c3\n%s\n```\n", faults.trim())!;
					i += faults.len - 1;
				}
		}
	};
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
