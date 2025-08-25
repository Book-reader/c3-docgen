
function linkAction(event, /*origHref, */newHref)
{
	event.preventDefault();
	let main_frame = window.parent.document.getElementById('main-frame');
	main_frame.src = newHref;
	window.parent.history.pushState(null, '', event.target.href);
}
