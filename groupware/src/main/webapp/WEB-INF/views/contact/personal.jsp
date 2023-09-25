<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
  
</style>



<body>

<%@ include file="/WEB-INF/views/P_header.jsp" %>

<input type="hidden" id="user_id" value="${sessionScope.userid}">
    <div id="toast" class="hidden">토스트 메세지 넣어라</div>
    
   	<aside>
	     <!-- 사이드바 -->
		<div class="sidebar">
		    <a href="/contact/company">사내 주소록</a>
		    <a href="/contact/personal">개인 주소록</a>
		    <!-- 필요한 메뉴 항목을 추가할 수 있습니다. -->
		</div>
    </aside>
<main class="main">
       <div class="search-container">
        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <button class="search-button">검색</button>
    </div>

   <div class="container" style="margin-bottom: 20px;">
<!-- <a href="" title="Button border blue/green" class="button btnFloat btnBlueGreen btnFloatAdd">추가</a>
	<a href="" title="Button border lightblue" class="button btnFloat btnLightBlue btnFloatDelete">삭제</a>
	<a href="" title="Button border orange" class="button btnFloat btnOrange btnFloatEdit">뭐야</a>
	<a href="" title="Button border purple" class="button btnFloat btnPurple btnFloatOther">뭐임?</a> 
	<button class="btn btn-primary m-2" id="alertStart" style="width: 150px; height: 50px;">버튼</button>  -->
	<div class="btnLine">
		<button class="btn btn-primary m-2" id="promptStart">등 록</button>
		<button class="btn btn-danger m-2" id="confirmStart">삭 제</button>
		<button class="btn btn-danger m-2" id="toastStart">Toast 실행</button>
		<button class="btn btn-warning m-2" id="ajaxStart">Ajax 실행 (깃헙 아이디 검색)</button>
	</div>
  </div>

	
    <table class="styled-table">
        <thead>
        <tr>
            <th><input type="checkbox" id="selectAll"></th>
            <th onclick="sort('name')">이름</th>
            <th onclick="sort('position')">직위</th>
            <th onclick="sort('phone')">휴대폰</th>
            <th onclick="sort('email')">Email</th>
            <th onclick="sort('department')">부서</th>
            <th onclick="sort('company')">회사</th>
            <th onclick="sort('companyPhone')">회사전화</th>
            <th onclick="sort('companyAddress')">회사주소</th>
            <th onclick="sort('memo')">메모</th>
            <th onclick="sort('group')">그룹</th>
        </tr>
        </thead>
        <tbody id="contactListBody">

        </tbody>
    </table>
</main>  
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//jQuery를 사용하여 모달을 제어합니다.
$(document).ready(function() {
    sort('all');
});

//#per_name 열을 클릭했을 때 페이지 이동
$('#contactListBody').on('click', 'tr', function(event) {
    var nameColumn = $(this).find('#per_name'); // #per_name 열을 선택

    // 클릭한 열의 #per_name 열을 클릭한 경우에만 페이지 이동
    if ($(event.target).is(nameColumn)) {
        var name = nameColumn.text();
        var position = $(this).find('#per_position').text();
        var phone = $(this).find('#per_phone').text();
        var email = $(this).find('#per_email').text();
        var department = $(this).find('#per_department').text();
        var company = $(this).find('#per_company').text();
        var companyPhone = $(this).find('#per_company_phone').text();
        var companyAddress = $(this).find('#per_company_address').text();
        var memo = $(this).find('#per_memo').text();
        var groupName = $(this).find('#per_group_name').text();
        var addressBookId = $(this).find('.address-book-id').val();

        // 데이터를 Detail.jsp로 전달하고 페이지 이동
        window.location.href = 'detail?name=' + encodeURIComponent(name) + '&position=' + encodeURIComponent(position) + '&phone=' + encodeURIComponent(phone) + '&email=' + encodeURIComponent(email) + '&department=' + encodeURIComponent(department) + '&company=' + encodeURIComponent(company) + '&companyPhone=' + encodeURIComponent(companyPhone) + '&companyAddress=' + encodeURIComponent(companyAddress) + '&memo=' + encodeURIComponent(memo) + '&groupName=' + encodeURIComponent(groupName) + '&addressBookId=' + encodeURIComponent(addressBookId);
    }
});

function sort(name) {
    console.log('개인 주소록 불러옴');
    const userid = $('#user_id').val();
    console.log(userid);
    $.ajax({
        url: '/get_personal_addressBook',
        data: { userid: userid, name: name }, // 필터 값을 서버로 전송
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
                    newRow.append('<td><input type="checkbox" id="perCheckbox"></td>');
                    newRow.append('<td id="per_name" style="cursor: pointer;">' + data[i]['name'] + '</td>');
                    newRow.append('<td id="per_position">' + data[i]['position'] + '</td>'); // 부서 정보를 추가
                    newRow.append('<td id="per_phone">' + data[i]['phone'] + '</td>');
                    newRow.append('<td id="per_email"><a href="mailto:' + data[i]['email'] + '">' + data[i]['email'] + '</a></td>');
                    newRow.append('<td id="per_department">' + data[i]['department'] + '</td>');
                    newRow.append('<td id="per_company">' + data[i]['company'] + '</td>');
                    newRow.append('<td id="per_company_phone">' + data[i]['company_phone'] + '</td>');
                    newRow.append('<td id="per_company_address">' + data[i]['company_address'] + '</td>');
                    newRow.append('<td id="per_memo">' + data[i]['memo'] + '</td>');
                    newRow.append('<td id="per_group_name">' + data[i]['group_name'] + '</td>');
                    newRow.append('<input type="hidden" class="address-book-id" value="' + data[i]['address_book_id'] + '">');
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
//aa


//전체 선택 체크박스 클릭 이벤트 처리
$("#selectAll").click(function () {
  // 전체 선택 체크박스의 상태를 가져옵니다.
  var isChecked = $(this).prop("checked");

  // 모든 개별 체크박스의 상태를 전체 선택 체크박스와 동일하게 설정합니다.
  $("input[type='checkbox'][id='perCheckbox']").prop("checked", isChecked);
});


function deleteContact() {
    const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

    // 선택된 연락처가 없으면 아무 작업도 수행하지 않음
    if (selectedContacts.length === 0) {
    	showToast("삭제할 연락처를 선택해주세요.");
        return;
    }

    selectedContacts.each(function() {
        const addressBookId = $(this).closest('tr').find('.address-book-id').val();
        console.log("Deleting Address Book ID:", addressBookId); // 콘솔에 addressBookId 찍기

        // 서버로 개별적인 삭제 요청 보내기
        $.ajax({
            url: "/delete_addressBook",
            data: { addressBookId: addressBookId },
            type: 'post',
            success: function (data) {
                if (data === '0') {
                    console.error("삭제 실패:", data);
                } else {
                    console.log("삭제 성공");
                    window.location.reload();
                }
            },
            error: function (xhr, status, error) {
                console.error("삭제 실패:", error);
            }
        });
    });
}


$().ready(function () {
	  
/* 	  $("#alertStart").click(function () {
	    Swal.fire({
	      icon: 'success',
	      title: 'Alert가 실행되었습니다.',
	      text: '이곳은 내용이 나타나는 곳입니다.',
	    });
	  }); */
	  
	  
/* 	  $("#confirmStart").click(function () {
	    Swal.fire({
	      title: '연락처를 삭제하시겠습니까?',
	      text: "다시 되돌릴 수 없습니다. 신중하세요.",
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '승인',
	      cancelButtonText: '취소',
	      reverseButtons: false, // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire(
	          '삭제가 완료되었습니다.',
	          '화끈하시네요~!',
	          'success'
	        )
	      }
	    })
	  });
	   */
	   $("#confirmStart").click(function () {
		   const selectedContacts = $('#contactListBody input[type="checkbox"]:checked');

		   // 선택된 연락처가 없으면 경고 메시지를 표시하고 함수 종료
		   if (selectedContacts.length === 0) {
		     Swal.fire({
		       icon: 'warning',
		       title: '연락처를 선택해주세요.',
		       showConfirmButton: false,
		       timer: 2000, // 2초 동안 메시지 표시
		     });
		     return;
		   }

		   // 선택된 연락처가 있으면 삭제 확인 모달을 표시
		   Swal.fire({
		     title: '연락처를 삭제하시겠습니까?',
		     text: '다시 되돌릴 수 없습니다. 신중하세요.',
		     icon: 'warning',
		     showCancelButton: true,
		     confirmButtonColor: '#3085d6',
		     cancelButtonColor: '#d33',
		     confirmButtonText: '승인',
		     cancelButtonText: '취소',
		     reverseButtons: false, // 버튼 순서 거꾸로
		   }).then((result) => {
		     if (result.isConfirmed) {
		       // 삭제 로직을 진행
		       selectedContacts.each(function () {
		         const addressBookId = $(this).closest('tr').find('.address-book-id').val();
		         console.log("Deleting Address Book ID:", addressBookId); // 콘솔에 addressBookId 찍기

		         // 서버로 개별적인 삭제 요청 보내기
		         $.ajax({
		           url: "/delete_addressBook",
		           data: { addressBookId: addressBookId },
		           type: 'post',
		           success: function (data) {
		             if (data === '0') {
		               console.error("삭제 실패:", data);
		               Swal.fire({
		                 icon: 'error',
		                 title: '삭제 실패',
		                 text: '연락처 삭제 중 오류가 발생했습니다.',
		               });
		             } else {
		               console.log("삭제 성공");
		             }
		           },
		           error: function (xhr, status, error) {
		             console.error("삭제 실패:", error);
		             Swal.fire({
		               icon: 'error',
		               title: '삭제 실패',
		               text: '연락처 삭제 중 오류가 발생했습니다.',
		             });
		           }
		         });
		       });

		       Swal.fire({
		         icon: 'success',
		         title: '삭제가 완료되었습니다.',
		         showCancelButton: false, // 확인 버튼만 표시
		         confirmButtonText: '확인', // 확인 버튼 텍스트 설정
		       }).then((result) => {
		         if (result.isConfirmed) {
		           // 확인 버튼을 클릭하면 페이지 리로드
		           location.reload();
		         }
		       });
		     }
		   });
		 });

	   
	   $(document).on('click', '#promptStart', function () {
		   (async () => {
		     const { value: formValues, dismiss: dismissReason } = await Swal.fire({
		       position: 'top',
		       title: '새 연락처 등록',
		       html:
		         '<input id="swal-input1" class="swal2-input" placeholder="이름">' +
		         '<input id="swal-input2" class="swal2-input" placeholder="직위">' +
		         '<input id="swal-input3" class="swal2-input" placeholder="핸드폰(000-0000-000)">' +
		         '<input id="swal-input4" class="swal2-input" placeholder="이메일(xxx@naver.com)">' +
		         '<input id="swal-input5" class="swal2-input" placeholder="부서">' +
		         '<input id="swal-input6" class="swal2-input" placeholder="회사">' +
		         '<input id="swal-input7" class="swal2-input" placeholder="회사 전화">' +
		         '<input id="swal-input8" class="swal2-input" placeholder="회사 주소">' +
		         '<input id="swal-input9" class="swal2-input" placeholder="메모">' +
		         '<input id="swal-input10" class="swal2-input" placeholder="그룹">',
		       focusConfirm: false,
		       showCancelButton: true,
		       customClass: {
		         popup: 'swal2-custom',
		         confirmButton: 'swal2-confirm',
		         cancelButton: 'swal2-cancel',
		       },
		       cancelButtonText: '취소', // 취소 버튼 텍스트 설정
		       confirmButtonText: '등록', // 확인 버튼 텍스트 설정
		       onBeforeOpen: (popup) => {
		         popup.style.marginTop = '200px';
		         const confirmButton = popup.querySelector('.swal2-confirm');
		         const cancelButton = popup.querySelector('.swal2-cancel');
		       },

		       preConfirm: () => {
		         const values = [
		           $('#swal-input1').val(),
		           $('#swal-input2').val(),
		           formatPhoneNumber($('#swal-input3').val()), // 핸드폰 번호 포맷팅 함수 호출
		           $('#swal-input4').val(),
		           $('#swal-input5').val(),
		           $('#swal-input6').val(),
		           $('#swal-input7').val(),
		           $('#swal-input8').val(),
		           $('#swal-input9').val(),
		           $('#swal-input10').val()
		         ];

		         const isValid = values.every(value => value !== '' && value !== null);

		         if (!isValid) {
		           Swal.showValidationMessage('모든 필드를 입력하세요.');
		         }

		         return values;
		       }
		     });

		     if (dismissReason === Swal.DismissReason.cancel) {
		       Swal.fire('입력이 취소되었습니다.');
		     } else if (formValues) {
		       // 주소록 추가 ajax 요청
		       addAddressBook(formValues);
		     }
		   })();
		 });

	   
	// 핸드폰 번호 포맷팅 함수 정의
	   function formatPhoneNumber(phoneNumber) {
	     // 입력된 번호에서 숫자만 추출
	     const digits = phoneNumber.replace(/\D/g, '');
	     
	     // 11자리 번호인 경우에만 포맷팅
	     if (digits.length === 11) {
	       return digits.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
	     } else {
	       return phoneNumber; // 11자리가 아니면 원래 값을 반환
	     }
	   }

	   
	// 주소록 추가 함수
	   function addAddressBook(formValues) {
	     console.log("개인 주소록 insert 중이에요");
	     const addName = formValues[0];
	     const addPosition = formValues[1];
	     const addPhone = formValues[2];
	     const addEmail = formValues[3];
	     const addDepartment = formValues[4];
	     const addCompany = formValues[5];
	     const addCompanyPhone = formValues[6];
	     const addCompanyAddress = formValues[7];
	     const addMemo = formValues[8];
	     const addGroup = formValues[9];
	     const userid = $('#user_id').val();

	     const addressBookData = {
	       Name: addName,
	       Position: addPosition,
	       Phone: addPhone,
	       Email: addEmail,
	       Department: addDepartment,
	       Company: addCompany,
	       CompanyPhone: addCompanyPhone,
	       CompanyAddress: addCompanyAddress,
	       Memo: addMemo,
	       Group: addGroup,
	       userid: userid
	     };

	     console.log(addressBookData);

	     $.ajax({
	       url: '/insert_addressBook',
	       type: 'post',
	       data: addressBookData,
	       success: function (data) {
	         console.log('인서트 성공', data);
	         Swal.fire({
	           icon: 'success',
	           title: '성공',
	           text: '주소록이 추가되었습니다.',
	           confirmButtonText: '확인' // 확인 버튼 추가
	         }).then((result) => {
	           if (result.isConfirmed) {
	             // 확인 버튼을 누르면 페이지 리로드
	             location.reload();
	           }
	         });
	       },
	       error: function (error) {
	         console.error('인서트 실패:', error);
	         Swal.fire({
	           icon: 'warning',
	           title: '실패',
	           text: '주소록 추가에 실패하였습니다.',
	           confirmButtonText: '확인' // 확인 버튼 추가
	         });
	       }
	     });
	   }

		 
/* 
		 // 토스트 메시지 표시 함수
		 function showToast(message) {
		   toastr.options = {
		     closeButton: true,
		     progressBar: true,
		     showMethod: 'slideDown',
		     timeOut: 4000
		   };
		   toastr.error(message, '오류');
		 } */
	



		 /* 		   // 필수 필드가 비어 있는지 확인
		 		   if (addName === '' || addPhone === '' || addCompany === '' || addPosition === '' || addEmail === '') {
		 		     showToast("필수 작성란을 확인해주세요.");
		 		     return; // 필드가 비어 있으면 함수를 종료하고 추가 작업을 수행하지 않음
		 		   }
		 		   
		 		   // 핸드폰 번호 형식 확인 (숫자만 허용)
		 		   const phoneRegex = /^\d{3}-\d{4}-\d{4}$/; // 000-0000-0000 형식의 정규식

		 		   if (!phoneRegex.test(addPhone)) {
		 		     showToast("올바른 핸드폰 번호 형식이 아닙니다. (000-0000-0000 형식으로 입력하세요)");
		 		     return; // 업데이트 중지
		 		   }

		 		   // 이메일 주소 형식 검사
		 		   const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		 		   if (!emailRegex.test(addEmail)) {
		 		     showToast("올바른 이메일 주소 형식이 아닙니다.");
		 		     return;
		 		   } */


	  
	  
	  $("#toastStart").click(function () {
	    const Toast = Swal.mixin({
	      toast: true,
	      position: 'center-center',
	      showConfirmButton: false,
	      timer: 3000,
	      timerProgressBar: true,
	      didOpen: (toast) => {
	        toast.addEventListener('mouseenter', Swal.stopTimer)
	        toast.addEventListener('mouseleave', Swal.resumeTimer)
	      }
	    })

	    Toast.fire({
	      icon: 'success',
	      title: 'toast 알림이 정상적으로 실행 되었습니다.'
	    })
	  });
	  
	  
	  $("#ajaxStart").click(function () { 
	    Swal.fire({
	      title: 'Submit your Github username',
	      input: 'text',
	      inputAttributes: {
	        autocapitalize: 'off'
	      },
	      showCancelButton: true,
	      confirmButtonText: 'Look up',
	      showLoaderOnConfirm: true,
	      preConfirm: (login) => {
	        return fetch(`//api.github.com/users/${login}`)
	          .then(response => {
	            if (!response.ok) {
	              throw new Error(response.statusText)
	            }
	            return response.json()
	          })
	          .catch(error => {
	            Swal.showValidationMessage(
	              `Request failed: ${error}`
	            )
	          })
	      },
	      allowOutsideClick: () => !Swal.isLoading()
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire({
	          title: `${result.value.login}'s avatar`,
	          imageUrl: result.value.avatar_url
	        })
	      }
	    })
	  });
	  
	});

</script>
</html>