module html;

// TODO: instead of printing directly, consider making the macros generate a tree of structs that all get formatted at once something like this:
/*
struct HtmlElement (Printable)
{
	bool is_text;
	union
	{
		struct
		{
			String name;
			String[] classes;
			String id;
			struct attrs
			{
				String name;
				String value;
			}
			HtmlElement[] children;
		}
		String text;
	}
}

return html::@html(
	id: name.key,
	children: {
		html::@head({
			html::@link(attrs: {{"rel", "stylesheet"}, {"href", css_file}})
		})
	}
)
*/
macro String @html(Allocator alloc, String title, String css_file, String js_file, String... attrs; @body(HtmlBuilder* b)) => @pool()
{
	HtmlBuilder b;
	b.init(tmem);
	b.@html(...attrs)
	{
		b.@head()
		{
			b.text(`<meta name="viewport" content="width=device-width, initial-scale=1.0">`);
			b.text(string::tformat(`<link rel="stylesheet" href="%s">`, css_file));
			b.text(string::tformat(`<script src="%s"></script>`, js_file));
		};
		b.@body()
		{
			@body(&b);
		};
	};
	return b.copy_str(alloc);
}

typedef HtmlBuilder = inline DString;

macro HtmlBuilder.tinit(&self) => self.init(tmem);
macro HtmlBuilder.init(&self, Allocator alloc)
{
	((DString*)self).init(alloc);
	self.text("<!DOCTYPE html>");
}

macro HtmlBuilder.@elem(&self, String elem_name, String... attrs; @body())
{
	self.appendf("<%s", elem_name);
	/*$for var $i = 0; $i < $vacount; $i++:
		self.appendf(" %s", $vaarg[$i]);
	$endfor*/
	foreach (attr : attrs)
	{
		self.appendf(" %s", attr);
	}
	self.appendf(">");
	defer self.appendf("</%s>", elem_name);
	@body();
}


macro HtmlBuilder.@h(&self, usz header_level, String... attrs; @body()) => @pool()
{
	self.@elem(string::tformat("h%s", header_level), ...attrs)
	{
		@body();
	};
}

macro HtmlBuilder.@url(&self, String href, String... attrs; @body()) => @pool()
{
	self.@elem("a", string::tformat(`href="%s"`, href), ...attrs)
	{
		@body();
	};
}

macro HtmlBuilder.@code(&self, String... attrs; @body()) => self.@elem("code", ...attrs)
{
	@body();
}

macro HtmlBuilder.@div(&self, String... attrs; @body()) => self.@elem("div", ...attrs)
{
	@body();
}

macro HtmlBuilder.@span(&self, String... attrs; @body()) => self.@elem("span", ...attrs)
{
	@body();
}

macro HtmlBuilder.@html(&self, String... attrs; @body()) => self.@elem("html", ...attrs)
{
	@body();
}

macro HtmlBuilder.@head(&self, String... attrs; @body()) => self.@elem("head", ...attrs)
{
	@body();
}

macro HtmlBuilder.@body(&self, String... attrs; @body()) => self.@elem("body", ...attrs)
{
	@body();
}

macro HtmlBuilder.@table(&self, String[] header, String... attrs; @body()) => self.@elem("table", ...attrs)
{
	if (header.len > 0) self.@tr()
	{
		foreach (h : header) self.elem("th", h);
	};
	@body();
}

macro HtmlBuilder.@tr(&self, String... attrs; @body()) => self.@elem("tr", ...attrs)
{
	@body();
}

macro HtmlBuilder.@td(&self, String... attrs; @body()) => self.@elem("td", ...attrs)
{
	@body();
}

macro HtmlBuilder.@pre(&self, String... attrs; @body()) => self.@elem("pre", ...attrs)
{
	@body();
}

macro HtmlBuilder.@precode(&self, String... attrs; @body()) => self.@pre(...attrs)
{
	self.@code()
	{
		@body();
	};
}

macro HtmlBuilder.text(&self, String s, ...) => (void)self.appendf(s, $vasplat);

macro HtmlBuilder.spc(&self) => self.text("&nbsp");

macro HtmlBuilder.br(&self) => self.text("<br/>");

macro HtmlBuilder.elem(&self, String elem, String val, String... attrs) => self.@elem(elem, ...attrs) { self.text(val); }

macro HtmlBuilder.url(&self, String name, String href, String... attrs) => self.@url(href, ...attrs) { self.text(name); }

macro HtmlBuilder.code(&self, String code, String... attrs) => self.@code(...attrs) { self.text(code); }

macro HtmlBuilder.h(&self, usz header_level, String text, String... attrs) => self.@h(header_level, ...attrs) { self.text(text); }

macro HtmlBuilder.td(&self, String val, String... attrs) => self.@td(...attrs) { self.text(val); }

macro HtmlBuilder.iframe(&self, ...) => self.elem("iframe", "", $vasplat);
