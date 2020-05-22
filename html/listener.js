window.addEventListener('message', (event) => {
    if (event.data.display === true) {
		$("*").show();
    } else {
		$("*").hide();
	}
});
