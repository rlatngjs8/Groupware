$(document).ready(function() {
	$("#btnBack").click(function() {
		window.location.href = "/showEmployee";
	})
	$("#btnEdit").click(function() {
		var userid = $('#userid').val();
		window.location.href = "/editAccount?userid=" + userid;
	})
})