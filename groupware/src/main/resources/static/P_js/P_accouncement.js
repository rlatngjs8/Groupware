$(document)	 
.on('click','#search-board-button',function(){
	let search = $('#board-search-bar').val();
	console.log(search);
	document.location="doaboardsearch?search="+search;
	return false;
})
.on('click','#search-board-button2',function(){
	let search = $('#board-search-bar2').val();
	console.log(search);
	document.location="doaboardsearch?search="+search;
	return false;
})
function boardenterkey() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
		document.getElementById("search-board-button").click();
    }
}
function boardenterkey2() {
	if (window.event.keyCode == 13) {
    	// 엔터키가 눌렸을 때
		document.getElementById("search-board-button2").click();
    }
}
