<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="js/document/documentLibrary.js"></script>
<link href="css/document/individual.css" rel="stylesheet">
</head>
<body>
    <%@ include file="/WEB-INF/views/P_header.jsp" %>
    <input type="hidden" id="userid" name="userid" value="${sessionScope.userid}">
    <section class="all-documentLibrary">
        <aside>
            <div class="sidebar">
            <h4 style="font-size: 22px; cursor: pointer;"id="documentHome">자료실</h4>
                <div class="upload">
                  <button class="btn_upload" id="btn_upload">파일업로드</button>
                </div>
                <br><br><br>
                <div>
                    <a href="/documentLibrary" id="allDocu">전체 자료실</a><br><br><br>
                    <a href="/individual" id="individual">개인 자료실</a>
                </div>
            </div>
        </aside>
        <div class="document-container">
            <div id="indiDocument">
                <div class="indiSection">
									<h2>개인 자료실</h2>
									<div><span class="downloadGuide">※파일명 클릭시 다운로드 됩니다.</span></div>
                    <table class="table-style">
                      <thead class="thead-style">
                        <tr>
                        		<th>문서번호</th>
                            <th>이름</th>
                            <th>작성자</th>
                            <th>크기</th>
                            <th>확장자</th>
                            <th>등록날짜</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                            <c:forEach items="${indi}" var="indi">
                                <tr>
                                    <td>${indi.documentID}</td>
                                    <td><a href="/documentDownload?fileName=${indi.documentTitle}" download>${indi.documentTitle}</a></td>
                                    <td>${indi.name}</td>
                                    <td data-filesize="${indi.fileSize}">${indi.fileSize}</td>
                                    <td>${indi.fileType}</td>
                                    <td>${indi.createdTime}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination">
                        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                            <c:choose>
                                <c:when test="${pageNumber == currentPage}">
                                    <span class="active">${pageNumber}</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/individual?page=${pageNumber}">${pageNumber}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="modal" id="documentUpload">
        <%@ include file="documentUpload.jsp" %>
    </div>
</body>
</html>