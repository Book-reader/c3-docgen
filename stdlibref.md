### `std::core::string`
```c3
typedef String @if(!$defined(String)) = inline char[]
```

ZString is a pointer to a zero terminated array of chars.

Use ZString when you need to interop with C zero terminated strings.
```c3
typedef ZString = inline char*
```

WString is a pointer to a zero terminated array of Char16.

Depending on the platform, this may or may not correspond to wchar_t.
For Windows, wchar_t is generally 16 bits, on MacOS it is 32 bits.
However, for both MacOS and Linux, regular C strings (ZString)
will be UTF-8 encoded, so there is no need to use the wchar_t versions
of functions outside of encoding functions.
```c3
typedef WString = inline Char16*
```

Char32 is a UTF32 codepoint
```c3
alias Char32 = uint
```

Char16 is a UTF16 "character"
```c3
alias Char16 = ushort
```

Common faults used with strings
```c3
faultdef INVALID_UTF8, INVALID_UTF16, CONVERSION_FAILED,
         EMPTY_STRING, NEGATIVE_VALUE, MALFORMED_INTEGER,
         INTEGER_OVERFLOW, MALFORMED_FLOAT, FLOAT_OUT_OF_RANGE
```

Create a pointer to an UTF32 encoded string at compile time.
```c3
macro Char32* @wstring32(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.
```c3
macro Char32[] @char32(String $string) @builtin
```

Create a WString (an UTF16 encoded string) at compile time.
```c3
macro WString @wstring(String $string) @builtin
```

Create a slice of an UTF32 encoded string at compile time.
```c3
macro Char16[] @char16(String $string) @builtin
```
```c3
macro String @sprintf(String $format, ...) @builtin @const
```

Return a temporary ZString created using the formatting function.
```c3
fn ZString tformat_zstr(String fmt, args...) @format(0)
```

Return a new String created using the formatting function.
```c3
fn String format(Allocator allocator, String fmt, args...) @format(1)
```

Return a new String created using the formatting function.
```c3
fn String bformat(char[] buffer, String fmt, args...) @format(1)
```

Return a temporary String created using the formatting function.
```c3
fn String tformat(String fmt, args...) @format(0)
```

Check if a character is in a set.
```c3
macro bool char_in_set(char c, String set)
```
```c3
fn String join(Allocator allocator, String[] s, String joiner)
```

Replace all instances of one substring with a different string.
```c3
fn String String.replace(self, Allocator allocator, String needle, String new_str) @nodiscard
```

Replace all instances of one substring with a different string, allocating the new string on the temp allocator.
```c3
fn String String.treplace(self, String needle, String new_str)
```

Remove characters from the front and end of a string.
```c3
fn String String.trim(self, String to_trim = "\t\n\r ")
```

Remove characters from the front of a string.
```c3
fn String String.trim_left(self, String to_trim = "\t\n\r ")
```

Remove characters from the end of a string.
```c3
fn String String.trim_right(self, String to_trim = "\t\n\r ")
```

Check if the String starts with the prefix.
```c3
fn bool String.starts_with(self, String prefix)
```

Check if the String ends with the suffix.
```c3
fn bool String.ends_with(self, String suffix)
```

Strip the front of the string if the prefix exists.
```c3
fn String String.strip(self, String prefix)
```

Strip the end of the string if the suffix exists.
```c3
fn String String.strip_end(self, String suffix)
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }
```c3
fn String[] String.split(self, Allocator allocator, String delimiter, usz max = 0, bool skip_empty = false)
```

This function is identical to String.split, but implicitly uses the
temporary allocator.
```c3
fn String[] String.tsplit(s, String delimiter, usz max = 0, bool skip_empty = false)
```
```c3
faultdef BUFFER_EXCEEDED
```

Split a string into parts, e.g "a|b|c" split with "|" yields { "a", "b", "c" }
```c3
fn String[]? String.split_to_buffer(s, String delimiter, String[] buffer, usz max = 0, bool skip_empty = false)
```

Check if a substring is found in the string.
```c3
fn bool String.contains(s, String substr)
```

Check how many non-overlapping instances of a substring there is.

If the substring has zero length, the number of matches is zero.
```c3
fn usz String.count(self, String substr)
```

Find the index of the first incidence of a string.
```c3
fn usz? String.index_of_char(self, char character)
```

Find the index of the first incidence of a one of the chars.
```c3
fn usz? String.index_of_chars(String self, char[] characters)
```

Find the index of the first incidence of a character.
```c3
fn usz? String.index_of_char_from(self, char character, usz start_index)
```

Find the index of the first incidence of a character starting from the end.
```c3
fn usz? String.rindex_of_char(self, char character)
```

Find the index of the first incidence of a string.
```c3
fn usz? String.index_of(self, String substr)
```

Find the index of the last incidence of a string.
```c3
fn usz? String.rindex_of(self, String substr)
```
```c3
fn bool ZString.eq(self, ZString other) @operator(==)
```
```c3
fn String ZString.str_view(self)
```
```c3
fn usz ZString.char_len(str)
```
```c3
fn usz ZString.len(self)
```
```c3
fn usz WString.len(self)
```
```c3
fn ZString String.zstr_copy(self, Allocator allocator)
```
```c3
fn String String.concat(self, Allocator allocator, String s2)
```
```c3
fn String String.tconcat(self, String s2)
```
```c3
fn ZString String.zstr_tcopy(self)
```

Copy this string, by duplicating the string, always adding a zero byte
sentinel, so that it safely can be converted to a ZString by a
cast.
```c3
fn String String.copy(self, Allocator allocator)
```
```c3
fn void String.free(&self, Allocator allocator)
```
```c3
fn String String.tcopy(self)
```
```c3
fn String ZString.copy(self, Allocator allocator)
```
```c3
fn String ZString.tcopy(self)
```

Convert an UTF-8 string to UTF-16
```c3
fn Char16[]? String.to_utf16(self, Allocator allocator)
```
```c3
fn Char16[]? String.to_temp_utf16(self)
```
```c3
fn WString? String.to_wstring(self, Allocator allocator)
```
```c3
fn WString? String.to_temp_wstring(self)
```
```c3
fn Char32[]? String.to_utf32(self, Allocator allocator)
```
```c3
fn Char32[]? String.to_temp_utf32(self)
```

Convert a string to ASCII lower case in place.
```c3
fn void String.convert_to_lower(self)
```
```c3
fn String String.to_lower_copy(self, Allocator allocator)
```
```c3
fn String String.to_lower_tcopy(self)
```

Convert a string to ASCII upper case.
```c3
fn void String.convert_to_upper(self)
```

Returns a string converted to ASCII upper case.
```c3
fn String String.to_upper_copy(self, Allocator allocator)
```
```c3
fn String String.capitalize_copy(self, Allocator allocator)
```

Convert a string from `snake_case` to PascalCase.
```c3
fn String String.snake_to_pascal_copy(self, Allocator allocator)
```

Movifies the current string from `snake_case` to PascalCase.
```c3
fn void String.convert_snake_to_pascal(&self)
```

Convert a string from `PascalCase` to `snake_case`.
```c3
fn String String.pascal_to_snake_copy(self, Allocator allocator)
```
```c3
fn StringIterator String.iterator(self)
```
```c3
fn String String.to_upper_tcopy(self)
```
```c3
fn String? from_utf32(Allocator allocator, Char32[] utf32)
```
```c3
fn String? from_utf16(Allocator allocator, Char16[] utf16)
```
```c3
fn String? from_wstring(Allocator allocator, WString wstring)
```
```c3
fn String? tfrom_wstring(WString wstring)
```
```c3
fn String? tfrom_utf16(Char16[] utf16)
```
```c3
fn usz String.utf8_codepoints(s)
```

Determine whether the current string actually points to a ZString-like string.

This is done by looking at the byte one step after the end of the string. If this
is zero, it is considered zero terminated.

This function can safely be used with data pointing to null. However, it will not
work correctly if the pointer is invalid, for example it is already freed.
```c3
fn bool String.is_zstr(self) @deprecated("Unsafe, use copy instead")
```

Return a pointer to the string *iff* it is a pointer
to a zero terminated string, otherwise return a temp allocated zstring copy.

This function is suitable if you are converting strings to ZString on the temp
allocator, but suspect that the String might actually already point to zero
terminated data.

The function looks one step beyond the end of the slice to determine this,
which means that if that data is then modified after this call, this function
might behave incorrectly.

For this reason, try to ensure that the resulting ZString is immediately used.
```c3
fn ZString String.quick_zstr(self) @deprecated("Unsafe, use zstr_tcopy instead")
```

Convert a number to a given base. If the base is not given, then
it will be inferred from the number if the string starts with 0x 0o or 0b and the
base is given as 10.

Furthermore it will skip any spaces before and after the number.
```c3
macro String.to_integer(self, $Type, int base = 10)
```
```c3
fn int128? String.to_int128(self, int base = 10)
```
```c3
fn long? String.to_long(self, int base = 10)
```
```c3
fn int? String.to_int(self, int base = 10)
```
```c3
fn short? String.to_short(self, int base = 10)
```
```c3
fn ichar? String.to_ichar(self, int base = 10)
```
```c3
fn uint128? String.to_uint128(self, int base = 10)
```
```c3
fn ulong? String.to_ulong(self, int base = 10)
```
```c3
fn uint? String.to_uint(self, int base = 10)
```
```c3
fn ushort? String.to_ushort(self, int base = 10)
```
```c3
fn char? String.to_uchar(self, int base = 10)
```
```c3
fn double? String.to_double(self)
```
```c3
fn float? String.to_float(self)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.
```c3
fn Splitter String.tokenize(self, String split)
```

Create a Splitter to track tokenizing of a string. Tokenize will turn "foo:bar::baz" into
"foo", "bar" and "baz", if you want the empty string to be present, use `tokenize_all`
instead.
```c3
fn Splitter String.tokenize_all(self, String split, bool skip_last = false)
```
```c3
fn Splitter String.splitter(self, String split) @deprecated("Use tokenize_all instead")
```

This macro will create a string description of a struct.
```c3
macro String from_struct(Allocator allocator, x)
```

This macro will create a temporary string description of a struct.
```c3
macro String tfrom_struct(x)
```
```c3
enum SplitterType
```

Splitter is handles tokenizing strings.
```c3
struct Splitter
```
```c3
fn void Splitter.reset(&self)
```
```c3
fn String? Splitter.next(&self)
```
