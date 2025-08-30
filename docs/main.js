
let orig_view = undefined;
function linkAction(event, newHref)
{
	event.preventDefault();
	let main_frame = window.top.document.getElementById('main-frame');
	window.top.history.pushState(newHref, event.target.href, event.target.href);
	main_frame.contentWindow.location.replace(newHref);
	// main_frame.src = newHref;
	// main_frame.contentWindow.history.replaceState(null, newHref, newHref);
	// main_frame.contentWindow.location.replace(newHref);
	console.error("pushed new state");
}

if (window === window.top)
{
	window.onpopstate = (e) =>
	{
		console.warn("ewfefijewfoiwofewij");
		console.warn(e);
		if (e.state != null)
		{
			console.info("test");
			document.getElementById('main-frame').src = e.state;
			document.getElementById('main-frame').contentWindow.history.replaceState(null, '', e.state);
		}
		else
		{
			console.info("test1");
			document.getElementById('main-frame').contentWindow.location.reload();
		}

	};
}
/*//if (window == window.top)
//{
	console.log("no parent");
	window.onpopstate = (e) => setTimeout(() => {
		console.log("afewfewfewfw");
		console.log("got popstate");
		console.warn(e);
		if (e.state === "linkAction")
		{
			console.warn("it was a linkAction");
			location.reload();
		}
	}, 0);

	window.onpushstate = (e) => setTimeout(() => console.error("got push state"), 0);

Object.keys(window).forEach(key => {
    if (/^on/.test(key)) {
        window.addEventListener(key.slice(2), event => {
            console.log(event.type);
        });
    }
});
//}*/
