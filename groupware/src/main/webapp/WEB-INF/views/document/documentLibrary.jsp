<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자료실</title>
    <style>
        .sidebar {
            margin-left: 220px;
            height: 100%;
            width: 225px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #fff;
            padding-top: 20px;
            border-right: 1px solid #c0c0c0;
        }
        
        .btn_upload {
        		overflow: hidden;
				    transition: all 0.3s ease;
				    padding: 0px 33px;
				    font-size: 17px;
				    /* font-weight: bold; */
				    cursor: pointer;
				    outline: none;
				    box-shadow: 0 2px 3px rgba(0, 0, 0, 0.05);
				    width: 200px;
				    height: 50px;
				    border-radius: 4px;
				    border: 1px solid #c0c0c0;
				    background: #fff;
        }
        
        .btn_upload:hover {
            background: rgb(106, 176, 173);
            border: 1px solid #c0c0c0;
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
        
        #all,
        #individual {
            cursor: pointer;
        }
        
        #allDocument,
        #indiDocument {
            float: right;
            width: calc(80%);
            padding: 0px;
        }
        
        #allDocument,
        #indiDocument {
            position: fixed;
            top: 130px;
            left: 520px;
            width: calc(85% - 20%);
            padding: 0;
            margin: 0;
            overflow: auto;
        }
        
        .document-container {
            margin-left: 200px;
            margin-top: 2%;
        }
        
        .table-style {
            width: 99%;
            border-collapse: collapse;
        }
        
        .table-style th,
        .table-style td {
            border: none;
            padding: 8px;
            text-align: center;
        }
        
        .table-style th {
            background-color: rgb(106, 176, 173);
            color: #fff;
        }
        
        .table-style th:nth-child(1),
        .table-style th:nth-child(3),
        .table-style th:nth-child(4),
        .table-style th:nth-child(5) {
            width: 70px;
        }
        
        .table-style th:nth-child(2) {
            width: 300px;
        }
        
        .table-style th:nth-child(6) {
            width: 160px;
        }
        
        .table-style tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        .table-style tbody tr:hover {
            background-color: #ccc;
        }
        
        .pagination {
            text-align: center;
            margin-top: 10px;
        }
        
        .pagination a,
        .pagination .active {
            display: inline-block;
            padding: 5px 10px;
            border: 1px solid #ccc;
            background-color: #fff;
            margin-right: 5px;
            text-decoration: none;
            color: #333;
        }
        
        .pagination a:hover {
            background-color: #ddd;
        }
        
        .pagination .active {
            background-color: #10665b;
            color: #fff;
            border: 1px solid #10665b;
        }
		.downloadGuide{
			position: relative;
	    left: 1020px;
	    font-size: 14px;
	    color: red;
		}
</style>
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
                    <a href="/documentLibaray" id="allDocu">전체 자료실</a><br><br><br>
                    <a href="/individual" id="individual">개인 자료실</a>
                </div>
            </div>
        </aside>
        <div class="document-container">
            <div id="allDocument">
                <div class="allSection">
                	<h3>전체	자료실</h3>
                	<div><span class="downloadGuide">※파일명 클릭시 다운로드 됩니다.</span></div>
                    <table class="table-style">
                        <thead class="thead-style">
                        <tr>
                            <th><input type="checkbox" class="selectAll" data-table="allDocument"></th>
                            <th>이름</th>
                            <th>작성자</th>
                            <th>크기</th>
                            <th>확장자</th>
                            <th>등록날짜</th>
                        </tr>
                        </thead>
                        <tbody id="tbody">
                            <c:forEach items="${dlist}" var="docu">
                                <tr>
                                    <td><input type="checkbox"></td>
                                    <td><a href="/documentDownload?fileName=${docu.documentTitle}" download>${docu.documentTitle}</a></td>
                                    <td>${docu.name}</td>
                                    <td data-filesize="${docu.fileSize}">${docu.fileSize}</td>
                                    <td>${docu.fileType}</td>
                                    <td>${docu.createdTime}</td>
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
                                    <a href="/documentLibrary?page=${pageNumber}">${pageNumber}</a>
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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    function convertFileSize(fileSizeInBytes) {
        if (fileSizeInBytes < 1024) {
            return fileSizeInBytes + ' B';
        } else if (fileSizeInBytes < 1024 * 1024) {
            return (fileSizeInBytes / 1024).toFixed(2) + ' KB';
        } else {
            return (fileSizeInBytes / (1024 * 1024)).toFixed(2) + ' MB';
        }
    }
    $(document).ready(function () {
        $('td[data-filesize]').each(function () {
            var fileSizeInBytes = parseInt($(this).attr('data-filesize'));
            var convertedSize = convertFileSize(fileSizeInBytes);
            $(this).text(convertedSize);
        });
        $('.selectAll').click(function () {
            var tableId = $(this).data('table');
            $('#' + tableId + ' tbody input[type="checkbox"]').prop('checked', $(this).prop('checked'));
        });
        $('#btn_upload').click(function () {
            $('#documentUpload').show();
        });
        $(document).on('click', '#closeModal', function () {
            $('#documentUpload').hide();
        });
//       $(document).on('click', '#individual', function(){
// 	    $('#indiDocument').show();
// 	    $('#allDocument').hide();
// 	    document.location="/documentLibrary?documentType=individual";
// 	    return false;
// 		});
	
// 	$(document).on('click', '#allDocu', function(){
// 	    $('#allDocument').show();
// 	    $('#indiDocument').hide();
// 	    document.location="/documentLibrary?documentType=all";
// 	    return false;
// 		});
 });
    $('#documentHome').click(function(){
   	 window.location.href="/documentLibrary";
    })
    
    // 페이지 번호 클릭 시 해당 documentType으로 이동
// 	$('.pagination a').click(function (event) {
// 	    event.preventDefault(); // 기본 링크 동작 방지
	
// 	    // 현재 URL에서 쿼리 문자열을 가져옵니다.
// 	    var queryString = window.location.search;
	
// 	    // 쿼리 문자열에서 documentType 매개변수를 찾습니다.
// 	    var documentType = getParameterValueFromQueryString(queryString, 'documentType');
	
// 	    // 클릭한 페이지 번호를 가져옵니다.
// 	    var pageNumber = $(this).text();
	
// 	    // 새로운 URL을 생성합니다.
// 	    var newURL = '/documentLibrary?page=' + pageNumber + '&documentType=' + documentType;
// 			console.log("타입",documentType);
// 	    // 새로운 URL로 이동합니다.
// 	    window.location.href = newURL;
// 	});

// 		// 쿼리 문자열에서 매개변수 값을 가져오는 함수
// 		function getParameterValueFromQueryString(queryString, parameterName) {
// 		    var params = new URLSearchParams(queryString);
// 		    return params.get(parameterName);
// 		}
</script>
</html>
