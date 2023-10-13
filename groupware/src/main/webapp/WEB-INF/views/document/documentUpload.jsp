<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료업로드</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/document/documentUpload.js"></script>
<link href="css/document/documentUpload.css" rel="stylesheet">
</head>
<body>
<div class="modal-content">
    <span class="close" id="closeModal">&times;</span>
    <h2>파일 업로드</h2>
    <div class="file-upload">
      <form id="frmSubmit" action="/fileUpload" method="post" enctype="multipart/form-data">
        <div>
          <p>대상 폴더 선택</p>
          <select name="storageType">
            <option value="all">전체 자료실</option>
            <option value="${userid}">개인 자료실</option>
          </select>
        </div>
        <hr/>
        <div>
          <p>파일첨부</p>
          <input multiple type="file" id="documentFile" name="documentFile" accept=".pdf, .doc, .docx, .hwp, .hwpx, .jpg, .jpeg, .png, .xls, .xlsx, .zip" style="display:none;"onchange="handleFileSelect(this)">
          <input type="button" onclick="document.getElementById('documentFile').click()" value="파일선택"	class="btn-upload">
          <input type="button" id="delFile" value="삭제" class="btn-delete">
        </div>
        <br>
        <!-- 파일 목록 표시 테이블 -->
        <table id="fileTable">
          <thead>
            <tr>
              <th><input type="checkbox" id="selectAll" onclick="toggleCheckboxes()"></th>
              <th>파일명</th>
              <th>확장자</th>
              <th>파일크기</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody id="fileTableBody">
            <!-- 여기에 업로드된 파일 정보가 추가됩니다 -->
          </tbody>
        </table>
        <br>
        <div style="text-align:right">
        <input type="submit" id="btnSubmit" class="btnSubmit" value="업로드">
        <input type="button" id="closeModal" class="btnCancel" value="취소">
        </div>
      </form>
      
    </div>
  </div>
</body>
</html>