<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
</head>
<style>
.sidebar {
    margin-left: 220px;
    height: 100%;
    width: 225px;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #f1f1f1;
    padding-top: 20px;
    border-right: 1px solid #c0c0c0;
    
}
.btn_upload {
    overflow: hidden;
    transition: all 0.3s ease;
    padding: 13px 64px;
    font-size: 15px;
    cursor: pointer;
    outline: none;
    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.05); /* 그림자 효과를 조정합니다. */
    width: 200px; /* 버튼의 너비를 고정합니다. */
    height: 50px;
    border-radius: 4px;
    border:1px solid #c0c0c0;
}
.btn_upload:hover{
		background: rgb(106, 176, 173);
		border:1px solid #c0c0c0;
		color: #fff;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
 .modal {
  display: none;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.7);
  z-index: 1;
}

.modal-content {
  background-color: #fff;
  margin: 3% auto;
  padding: 20px;
  border-radius: 5px;
  width: 40%;
}

.close {
    position: absolute;
    top: 8.5%;
    right: 30%;
    font-size: 27px;
    cursor: pointer;
    color: #6d6d6d;
    font-weight: bold;
}
#all, #individual {
	cursor:pointer;
}
#allDocument, #indiDocument {
            float: right;
				    width: calc(80%);
				    padding: 0px;
/* 				    margin-top: 5%; */
        }

        .document-container {
            margin-left: 225px;
        }
</style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>
<input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
<section class="all-documentLibrary">
	<!-- 사이드바 -->
	<aside>
		<div class="sidebar">
			<div class="upload">
				<label>
					<h4>자료실</h4>
					<button class="btn_upload" id="btn_upload">파일업로드</button>
				</label>
			</div>
			<br><br><br>
			<div>
		    <a id="all">전사 자료실</a><br><br><br>
		    <a id="individual">개인 자료실</a>
		  </div>
		</div>
   </aside>
   <div class="document-container">
	    <div id="allDocument">
	      <h3>전사 자료실</h3>
	      <div class ="allSection">
	      	<table>
	      		<thead>
	      			<th><input type="checkbox" id="selectAll" onclick="toggleCheckboxes()"></th>
	      			<th>이름</th>
	      			<th>작성자</th>
	      			<th>크기</th>
	      			<th>확장자</th>
	      			<th>등록날짜</th>
	      		</thead>
	      		<tbody id="tbody">
	      		<c:forEach items="${dlist}" var="docu">
	      			<tr>
	      				<td></td>
	      				<td>${docu.documentTitle}</td>
	      				<td>${docu.writer}</td>
	      				<td>${docu.filesize}</td>
	      				<td>${docu.filetype}</td>
	      				<td>${docu.createdTime}</td>
	      			</tr>
	      		</c:forEach>
	      		</tbody>
	      	</table>
	      </div>
	    </div>
	    <div id="indiDocument" style="display: none;">
	        여기에 내용을 추가하세요2
	    </div>
		</div>
</section>
<!-- 업로드 모달 -->
<div class="modal" id="documentUpload">
			<!-- 인클루드 자리 -->
	<%@ include file="documentUpload.jsp" %>
</div>
</body>
<script src='https://code.jquery.com/jquery-Latest.js'></script>
<script>
$(document).ready(function () {
    $('#btn_upload').click(function () {
        $('#documentUpload').show();
    });

    $(document).on('click', '#closeModal', function () {
        $('#documentUpload').hide();
    });

    $('#individual').click(function () {
        $('#indiDocument').show();
        $('#allDocument').hide();
    });
    
    $('#all').click(function () {
        $('#indiDocument').hide();
        $('#allDocument').show();
    });
});
</script>
</html>