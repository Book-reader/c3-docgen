module html;

macro String @html(Allocator alloc, String title, String css_file, String...; @body(HtmlBuilder* b)) => @pool()
{
	HtmlBuilder b;
	b.init(tmem);
	b.@html($vasplat)
	{
		b.@head()
		{
			b.text(string::tformat(`<link rel="stylesheet" href="%s">`, css_file));
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

macro HtmlBuilder.@elem(&self, String elem_name, String...; @body())
{
	self.appendf("<%s", elem_name);
	$for var $i = 0; $i < $vacount; $i++:
		self.appendf(" %s", $vaarg[$i]);
	$endfor
	self.appendf(">");
	defer self.appendf("</%s>", elem_name);
	@body();
}


macro HtmlBuilder.@h(&self, usz header_level, String...; @body()) => @pool()
{
	self.@elem(string::tformat("h%s", header_level), $vasplat)
	{
		@body();
	};
}

macro HtmlBuilder.@url(&self, String href, String...; @body()) => @pool()
{
	self.@elem("a", string::tformat(`href="%s"`, href), $vasplat)
	{
		@body();
	};
}

macro HtmlBuilder.@code(&self, String...; @body()) => self.@elem("code", $vasplat)
{
	@body();
}

macro HtmlBuilder.@div(&self, String...; @body()) => self.@elem("div", $vasplat)
{
	@body();
}

macro HtmlBuilder.@span(&self, String...; @body()) => self.@elem("span", $vasplat)
{
	@body();
}

macro HtmlBuilder.@html(&self, String...; @body()) => self.@elem("html", $vasplat)
{
	@body();
}

macro HtmlBuilder.@head(&self, String...; @body()) => self.@elem("head", $vasplat)
{
	@body();
}

macro HtmlBuilder.@body(&self, String...; @body()) => self.@elem("body", $vasplat)
{
	@body();
}

macro HtmlBuilder.@table(&self, String[] header, String...; @body()) => self.@elem("table", $vasplat)
{
	if (header.len > 0) self.@tr()
	{
		foreach (h : header) self.elem("th", h);
	};
	@body();
}

macro HtmlBuilder.@tr(&self, String...; @body()) => self.@elem("tr", $vasplat)
{
	@body();
}

macro HtmlBuilder.@td(&self, String...; @body()) => self.@elem("td", $vasplat)
{
	@body();
}

macro HtmlBuilder.@pre(&self, String...; @body()) => self.@elem("pre", $vasplat)
{
	@body();
}

macro HtmlBuilder.@precode(&self, String...; @body()) => self.@pre($vasplat)
{
	self.@code()
	{
		@body();
	};
}

macro HtmlBuilder.text(&self, String s, ...) => (void)self.appendf(s, $vasplat);

macro HtmlBuilder.spc(&self) => self.text("&nbsp");

macro HtmlBuilder.br(&self) => self.text("<br/>");

macro HtmlBuilder.elem(&self, String elem, String val, String...) => self.@elem(elem, $vasplat) { self.text(val); }

macro HtmlBuilder.url(&self, String name, String href, String...) => self.@url(href, $vasplat) { self.text(name); }

macro HtmlBuilder.code(&self, String code, String...) => self.@code($vasplat) { self.text(code); }

macro HtmlBuilder.h(&self, usz header_level, String text, String...) => self.@h(header_level, $vasplat) { self.text(text); }

macro HtmlBuilder.td(&self, String val, String...) => self.@td($vasplat) { self.text(val); }
