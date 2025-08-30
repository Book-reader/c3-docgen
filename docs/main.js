
// only needed in the view page.
function linkAction(event, newHref)
{
	event.preventDefault();
	let main_frame = window.top.document.getElementById('main-frame');
	main_frame.contentWindow.location.replace(newHref);
	window.top.history.pushState(newHref, event.target.href, event.target.href);
}

window.onload = () =>
{
	if (window === window.top)
	{
		const MAIN_FRAME = document.getElementById('main-frame');
		const ORIG_SRC = MAIN_FRAME.src;
		window.onpopstate = (e) =>
		{
			if (e.state != null)
			{
				MAIN_FRAME.contentWindow.location.replace(e.state);
			}
			else
			{
				MAIN_FRAME.contentWindow.location.replace(ORIG_SRC);
			}
		};
	}
};
