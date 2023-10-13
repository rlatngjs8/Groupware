<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/contact/personal.js"></script>
    <link href='css/contact/personal.css' rel='stylesheet' />
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <input type="hidden" id="user_id" value="${sessionScope.userid}">
    <%@ include file="/WEB-INF/views/P_header.jsp" %>

    <aside>
        <div class="sidebar">
            <section id="attendance_section">
                <h2 style="font-weight: bold; font-size: 28px; margin-top: 35px;">
                    <img src="/img/contact-book.png" alt="로고 이미지" class="contact-img">연락처
                </h2>
                <p id="date_info"></p>
                <p id="time_info"><span id="current_time"></span></p>
                <a href="/company">사내 주소록</a>
                <a href="/personal">개인 주소록</a>
            </section>
        </div>
    </aside>

    <main class="main">
        <div class="header">
            <h1>개인 주소록</h1>
        </div>

        <div class="btnLine" style="margin-left: 275px; margin-bottom: 30px;">
            <button class="btn btn-success m-2" id="promptStart" style="width: 100px; height: 50px;">등 록</button>
            <button class="btn btn-warning m-2" id="confirmStart" style="width: 100px; height: 50px;">삭 제</button>
        </div>

        <table class="styled-table">
            <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll"></th>
                    <th class="name-col" onclick="sort('name', currentPage)">이름</th>
                    <th class="position-col" onclick="sort('position', currentPage)">직위</th>
                    <th class="phone-col" onclick="sort('phone', currentPage)">휴대폰</th>
                    <th class="email-col" onclick="sort('email', currentPage)">Email</th>
                    <th class="department-col" onclick="sort('department', currentPage)">부서</th>
                    <th class="company-col" onclick="sort('company', currentPage)">회사</th>
                    <th class="company-phone-col" onclick="sort('companyPhone', currentPage)">회사전화</th>
                    <th class="company-address-col" onclick="sort('companyAddress', currentPage)">회사주소</th>
                    <th class="memo-col" onclick="sort('memo', currentPage)">메모</th>
                    <th class="group-col" onclick="sort('group', currentPage)">그룹</th>
                </tr>
            </thead>
            <tbody id="contactListBody">

            </tbody>
        </table>
    </main>
</body>
</html>
