//JavaScript와 jQuery를 사용한 AJAX 요청
$(document)
.on('click', '#btnUpdate', function () {
	if(!confirm('수정 하시겠습니까?')){
		return false;
	}
    document.location="/announcement_view_update?seq="+$('#seq').val();
    return true;
})
.on('click', '#btnDelete', function () {
	if(!confirm('삭제 하시겠습니까?')){
		return false;
	}
    document.location="deleteapost?seq="+$('#seq').val();
    return true;
})

