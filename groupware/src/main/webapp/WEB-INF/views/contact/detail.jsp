<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>상세 페이지</h1>
    <form id="contactForm">
        <label for="name">이름:</label>
        <input type="text" id="name" value="">
        <br>
        <label for="position">직위:</label>
        <input type="text" id="position" value="">
        <br>
        <label for="phone">전화번호:</label>
        <input type="text" id="phone" value="">
        <br>
        <label for="email">이메일:</label>
        <input type="email" id="email" value="">
        <br>
        <label for="department">부서:</label>
        <input type="text" id="department" value="">
        <br>
        <label for="company">회사:</label>
        <input type="text" id="company" value="">
        <br>
        <label for="companyPhone">회사 전화번호:</label>
        <input type="text" id="companyPhone" value="">
        <br>
        <label for="companyAddress">회사 주소:</label>
        <input type="text" id="companyAddress" value="">
        <br>
        <label for="memo">메모:</label>
        <input type="text" id="memo" value="">
        <br>
        <label for="groupName">그룹:</label>
        <input type="text" id="groupName" value="">
        <br>
        <button type="button" id="editButton">수정</button>
    </form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // URL에서 가져온 값들을 각 입력 필드에 설정
        const currentUrl = new URL(window.location.href);
        $('#name').val(currentUrl.searchParams.get("name"));
        $('#position').val(currentUrl.searchParams.get("position"));
        $('#phone').val(currentUrl.searchParams.get("phone"));
        $('#email').val(currentUrl.searchParams.get("email"));
        $('#department').val(currentUrl.searchParams.get("department"));
        $('#company').val(currentUrl.searchParams.get("company"));
        $('#companyPhone').val(currentUrl.searchParams.get("companyPhone"));
        $('#companyAddress').val(currentUrl.searchParams.get("companyAddress"));
        $('#memo').val(currentUrl.searchParams.get("memo"));
        $('#groupName').val(currentUrl.searchParams.get("groupName"));

        // 수정 버튼 클릭 시 입력 필드를 활성화
        $('#editButton').click(function () {
            $('input[type="text"]').prop('disabled', false);
        });
    </script>
</body>
</html>
