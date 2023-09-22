<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주소록</title>
    <!-- 스타일 추가 -->
    <style>

        /* 공통 스타일 */
		.styled-table {
		    border: 1px #a39485 solid;
		    font-size: .9em;
		    box-shadow: 0 2px 5px rgba(0,0,0,.25);
		    width: 80%;
		    border-collapse: collapse;
		    border-radius: 5px;
		    overflow: hidden;
			margin-left: 280px; /* 수평 가운데 정렬을 위한 스타일 */
		}

		/* 테이블 제목 셀 스타일 */
		.styled-table th {
		    text-align: center; /* 텍스트 왼쪽 정렬 */
		    transition: background-color 0.3s; /* 호버 시 배경색 변경 애니메이션 */
		    cursor: pointer; /* 호버 시 포인터 커서로 변경 */
		}
		
		/* 호버 시 배경색 변경 */
		.styled-table th:hover {
		    background-color: #ccc; /* 호버 시 배경색 변경 (예: 회색) */
		}
		
		
        .styled-table thead {
            font-weight: bold;
            color: #fff;
            background: rgb(106, 176, 173);
        }

        .styled-table td, .styled-table th {
            padding: 1em .5em;
            vertical-align: middle;
        }

        .styled-table td {
            border-bottom: 1px solid rgba(0,0,0,.1);
            background: #fff;
        }

        .styled-table a {
            color: #73685d;
        }

        /* 미디어 쿼리 */
        @media all and (max-width: 768px) {
            .styled-table, .styled-table thead, .styled-table tbody, .styled-table th, .styled-table td, .styled-table tr {
                display: block;
            }

            .styled-table th {
                text-align: right;
            }

            .styled-table {
                position: relative;
                padding-bottom: 0;
                border: none;
                box-shadow: 0 0 10px rgba(0,0,0,.2);
            }

            .styled-table thead {
                float: left;
                white-space: nowrap;
            }

            .styled-table tbody {
                overflow-x: auto;
                overflow-y: hidden;
                position: relative;
                white-space: nowrap;
            }

            .styled-table tr {
                display: inline-block;
                vertical-align: top;
            }

            .styled-table th {
                border-bottom: 1px solid #a39485;
            }

            .styled-table td {
                border-bottom: 1px solid #e5e5e5;
            }
        }
        
       .search-container {
            position: absolute;
            top: 10px; /* 원하는 상단 여백 조정 */
            right: 10px; /* 원하는 오른쪽 여백 조정 */
            display: flex;
            align-items: center;
            background-color: #8bc34a; /* 연두색 배경색상 */
            border: 2px solid #4caf50; /* 연두색 테두리 */
            border-radius: 0; /* 모서리를 둥글게 만들지 않음 */
            overflow: hidden;
        }

        .search-input {
            flex: 1;
            border: none;
            padding: 10px;
            font-size: 16px;
            background-color: white; /* 연두색 배경색상 */
            color: black; /* 글자색을 흰색으로 지정 */
        }

        .search-button {
            background-color: #4caf50; /* 진한 연두색 버튼 배경색상 */
            color: #fff; /* 버튼 텍스트 색상 */
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }

        /* 검색 버튼에 호버 효과 추가 */
        .search-button:hover {
            background-color: #45a049; /* 호버 시 색상 변경 */
        }
        body {
		  line-height: 24px;
		  color: #333;
		  background: #ececec;
		  overflow-y: scroll;
		}

.clear {
  clear: both;
}

.articleTitle {
  font-size: 1.15em;
  font-weight: 700;
  line-height: 1em;
  color: #222;
}

.container {
  padding-top: 1em;
  margin-top: 1em;
  border-top: solid 1px #CCC;
}

a.button {
  display: block;
  position: relative;
  float: left;
  width: 120px;
  padding: 0;
  margin: 10px 20px 10px 0;
  font-weight: 600;
  text-align: center;
  line-height: 50px;
  color: #FFF;
  border-radius: 5px;
  transition: all 0.2s;
}

.btnBlueGreen {
  background: #00AE68;
}

.btnLightBlue {
  background: #5DC8CD;
}

.btnOrange {
  background: #FFAA40;
}

.btnPurple {
  background: #A74982;
}

/* FLOAT */
.btnFloat {
  background: none;
  box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.5);
}

.btnFloat:before {
  content: '추가';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 120px;
  height: 50px;
  border-radius: 5px;
  transition: all 0.2s;
}

.btnBlueGreen.btnFloat:before {
  background: #00AE68;
}

.btnLightBlue.btnFloat:before {
  background: #5DC8CD;
}

.btnOrange.btnFloat:before {
  background: #FFAA40;
}

.btnPurple.btnFloat:before {
  background: #8D336A;
}

.btnFloat:before {
  box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.4);
}

.btnFloat:hover:before {
  margin-top: -2px;
  margin-left: 0px;
  transform: scale(1.1, 1.1);
  -ms-transform: scale(1.1, 1.1);
  -webkit-transform: scale(1.1, 1.1);
  box-shadow: 0px 5px 5px -2px rgba(0, 0, 0, 0.25);
}

/* 추가 버튼 */
.btnFloatAdd:before {
  content: '추가';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 120px;
  height: 50px;
  border-radius: 5px;
  transition: all 0.2s;
  /* 나머지 스타일 속성들은 동일하게 유지 */
}

/* 삭제 버튼 */
.btnFloatDelete:before {
  content: '삭제';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 120px;
  height: 50px;
  border-radius: 5px;
  transition: all 0.2s;
  /* 나머지 스타일 속성들은 동일하게 유지 */
}

/* 수정 버튼 */
.btnFloatEdit:before {
  content: '뭐야';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 120px;
  height: 50px;
  border-radius: 5px;
  transition: all 0.2s;
  /* 나머지 스타일 속성들은 동일하게 유지 */
}

/* 다른 버튼 */
.btnFloatOther:before {
  content: '뭐임?';
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 120px;
  height: 50px;
  border-radius: 5px;
  transition: all 0.2s;
  /* 나머지 스타일 속성들은 동일하게 유지 */
}

  .swal2-input {
    margin-bottom: 5px; /* 각 입력 필드 아래의 마진 조절 */
  }
  /* Customize the label (the container) */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 22px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  margin-right: 165px;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}
hr {
  background-color: #fff;
  padding: 0;
  margin: 80px;
}

hr.hr-3 {
  border: 0;
  height: 0;
  border-top: 1px solid #8c8c8c;
}

#per_name {
    cursor: pointer; /* 커서 스타일 변경 */
}

#per_name:hover {
    background-color: lightgray; /* hover 효과 */
}

		
		        /* 사이드바 스타일 */
		.sidebar {
			margin-left: 210px;
		    height: 100%;
		    width: 250px;
		    position: fixed;
		    top: 0;
		    left: 0;
		    background-color: white;
		    padding-top: 20px;
		    border-right: 1px solid gray; /* 오른쪽 부분에만 테두리 적용 */
		}

        /* 사이드바 링크 스타일 */
        .sidebar a {
            padding: 15px;
            text-decoration: none; /* 링크 밑줄 제거 */
            color: black; /* 글자색 설정 */
            display: block; /* 블록 요소로 표시하여 세로로 배치 */
        }

        /* 사이드바 링크 호버 스타일 */
		.sidebar a:hover {
		    background-color: #ccc; /* 연한 회색 배경으로 변경 */
		}

        .main {
		    margin-left: 250px; /* 사이드바 너비만큼 왼쪽 여백 설정 */
		    padding: 20px; /* 콘텐츠 패딩 설정 */
		}
        /* 추가적인 스타일링을 원하는 대로 추가하세요 */
    </style>
</head>
<body>
<input type="hidden" id="user_id" value="${sessionScope.userid}">
<%@ include file="/WEB-INF/views/P_header.jsp" %>

	 <aside>
	     <!-- 사이드바 -->
		<div class="sidebar">
		    <a href="/contact/company">사내 주소록</a>
		    <a href="/contact/personal">개인 주소록</a>
		    <!-- 필요한 메뉴 항목을 추가할 수 있습니다. -->
		</div>
    </aside>
	<main class="main">
	    <h1>주소록</h1>		
	    <!-- 주소록 목록을 나타내는 테이블 예시 -->
    <table class="styled-table">
        <thead> 
        <tr>
            <th onclick="sort('name')">이름</th>
            <th onclick="sort('department')">부서</th>
            <th onclick="sort('position')">직위</th>
            <th onclick="sort('phone')">휴대폰</th>
            <th onclick="sort('email')">Email</th>
            <th onclick="sort('birthdate')">생일</th>
            <th onclick="sort('group')">그룹</th>
        </tr>
        </thead>
        <tbody id="contactListBody">

        </tbody>
    </table>
	</main>    
    <!-- 필요한 JavaScript 파일 또는 스크립트 태그를 추가하세요 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>

		 $(document).ready(function () {
			 sort('all');
		    // "selectAll" 체크박스의 변경 이벤트를 감지
		    $('#selectAll').change(function() {
		        // "selectAll" 체크박스의 상태를 가져옴
		        const selectAllChecked = $(this).prop('checked');
		        
		        // "perCheckbox" 체크박스들의 상태를 변경
		        $('#contactListBody').find('input[type="checkbox"]').prop('checked', selectAllChecked);
		    });
        }); 
		 
		 function sort(name) {
			    console.log('개인 주소록 불러옴');
			    console.log(userid);
			    $.ajax({
			        url: '/get_addressBook',
			        data: { name: name }, // 필터 값을 서버로 전송
			        type: 'get',
			        dataType: 'json',
			        success: function(data) {
			            console.log('주소록 데이터 불러오기', data);
			            const tableBody = $('#contactListBody');
			            tableBody.empty(); // 기존 데이터를 지웁니다.
			            if (data.length === 0) {
			                // 데이터가 없는 경우 빈 테이블 행을 추가
			                const newRow = $('<tr>');
			                newRow.append('<td colspan="11" style="text-align: center;">' +
			                    '<p>데이터가 없습니다.</p>' +
			                    '<div style="text-align: center;">' +
			                    '<button id="openModalButton" class="btn btn-primary">빠른 등록</button>' +
			                    '</div>' +
			                    '</td>');
			                $('#no_contactListBody').append(newRow);
			            } else {
			                // 데이터가 있는 경우 연락처를 추가
			                for (let i = 0; i < data.length; i++) {
			                    const newRow = $('<tr>');
			                    newRow.append('<td id="per_name" style="cursor: pointer;">' + data[i]['name'] + '</td>');
			                    newRow.append('<td id="per_department">' + data[i]['department'] + '</td>');
			                    newRow.append('<td id="per_position">' + data[i]['position'] + '</td>'); // 부서 정보를 추가
			                    newRow.append('<td id="per_phone">' + data[i]['phone'] + '</td>');
			                    newRow.append('<td id="per_email"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
			                    newRow.append('<td id="per_group_name">' + data[i]['group_name'] + '</td>');
			                    $('#contactListBody').append(newRow);
			                }
			            }
			        },
			        error: function(xhr, status, error) {
			            console.error('주소록 데이터 불러오기 에러:', status, error);
			            // 에러 처리를 수행할 수 있습니다. 예를 들어, 사용자에게 오류 메시지를 표시하는 등의 작업을 수행할 수 있습니다.
			        }
			    });
			}
		 

        // 주소록 추가 기능
        $('#addContact').click(function () {
            insert_personal_address_book();
        });

        //토스트 메세지
		 function showToast(message) {
			  const toast = document.getElementById('toast');
			  toast.textContent = message;
			  toast.style.display = 'block';

			  setTimeout(function() {
			    toast.style.display = 'none';
			  }, 3000); // 3초 후에 숨김
			}
        

    </script>
</body>
</html>
