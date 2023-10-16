<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/attendance/attendance.js"></script>
    <link href='css/attendance/attendance.css' rel='stylesheet' />
    <meta charset="UTF-8">
    <title>근태관리</title>
</head>
<body>
    <%@ include file="/WEB-INF/views/P_header.jsp" %>
    <input type="hidden" id="user_id" value="${sessionScope.userid}">
    <input type="hidden" id="user_name" value="${name}">

    <aside>
        <div class="sidebar">
            <section id="attendance_section">
                <h2><a href="/attendance">근태관리</a></h2>
                <p id="date_info"></p>
                <p id="time_info"><span id="current_time"></span></p>
                <button class="btn btn-success m-2" id="btnCheckIn">출근하기</button>
                <button class="btn btn-warning m-2" id="btnCheckOut" disabled >퇴근하기</button>
            </section>
            <hr>
            <p id="checkin_time">출근시간:<span id="start_time"></span></p>
            <p id="checkout_time">퇴근시간:<span id="end_time"></span></p>
        </div>
    </aside>

    <main class="main">
        <div class="header">
            <h1>근태 현황</h1>
        </div>

        <div class="month-navigation">
            <button id="prevMonthButton">&lt;</button>
            <span id="current_month"></span>
            <button id="nextMonthButton">&gt;</button>
        </div>

        <div class="attendance-summary">
            <div>
                <span id="accumulated_month"></span>
                <p id="accumulated_time"></p>
            </div>
            <div>
                <span id="remaining_month"></span>
                <p id="remaining_time"></p>
            </div>
        </div>

        <table>
            <thead>
                <tr>
                    <th class="name-col" onclick="sort('name', currentPage)">부서원</th>
                    <th class="department-col" onclick="sort('department', currentPage)">부서명</th>
                    <th class="date-col" onclick="sort('date', currentPage)">날짜</th>
                    <th>출 근</th>
                    <th>퇴 근</th>
                    <th>출결상태</th>
                </tr>
            </thead>
            <tbody id="attendanceListBody">
            
            </tbody>
        </table>
        <div id="pagination"></div>
    </main>

    <c:forEach items="${time}" var="item">
        <input type="hidden" id="start_time" value="${item.startTime}">
        <input type="hidden" id="end_time" value="${item.endTime}">
        <input type="hidden" id="date" value="${item.date}">
    </c:forEach>
</body>
</html>