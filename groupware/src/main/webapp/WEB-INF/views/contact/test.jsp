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
</style>



<body>

<%@ include file="/WEB-INF/views/P_header.jsp" %>

<input type="hidden" id="user_id" value="${sessionScope.userid}">
    <div id="toast" class="hidden">토스트 메세지 넣어라</div>

       <div class="search-container">
        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
        <button class="search-button">검색</button>
    </div>

   <div class="container" style="margin-left: 280px; margin-bottom: 20px;">
<!-- 	<a href="" title="Button border blue/green" class="button btnFloat btnBlueGreen btnFloatAdd">추가</a>
	<a href="" title="Button border lightblue" class="button btnFloat btnLightBlue btnFloatDelete">삭제</a>
	<a href="" title="Button border orange" class="button btnFloat btnOrange btnFloatEdit">뭐야</a>
	<a href="" title="Button border purple" class="button btnFloat btnPurple btnFloatOther">뭐임?</a> -->
	<button class="btn btn-primary m-2" id="alertStart" style="width: 150px; height: 50px;">버튼</button>
	<button class="btn btn-secondary m-2" id="confirmStart">Confirm 실행</button>
	<button class="btn btn-success m-2" id="promptStart">Prompt 실행</button>
	<button class="btn btn-danger m-2" id="toastStart">Toast 실행</button>
	<button class="btn btn-warning m-2" id="ajaxStart">Ajax 실행 (깃헙 아이디 검색)</button>
	
	
    <div class="clear"></div>
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
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//jQuery를 사용하여 모달을 제어합니다.
$(document).ready(function() {
    sort('all');
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
                    newRow.append('<td id="per_name">' + data[i]['name'] + '</td>');
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


$().ready(function () {
	  
	  $("#alertStart").click(function () {
	    Swal.fire({
	      icon: 'success',
	      title: 'Alert가 실행되었습니다.',
	      text: '이곳은 내용이 나타나는 곳입니다.',
	    });
	  });
	  
	  
	  $("#confirmStart").click(function () {
	    Swal.fire({
	      title: '정말로 그렇게 하시겠습니까?',
	      text: "다시 되돌릴 수 없습니다. 신중하세요.",
	      icon: 'warning',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '승인',
	      cancelButtonText: '취소',
	      reverseButtons: true, // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	      if (result.isConfirmed) {
	        Swal.fire(
	          '승인이 완료되었습니다.',
	          '화끈하시네요~!',
	          'success'
	        )
	      }
	    })
	  });
	  
	  
	  

	  
	  $(document).on('click', '#promptStart', function () {
		  (async () => {
		    const { value: formValues, dismiss: dismissReason } = await Swal.fire({
		      title: '정보 입력',
		      html:
		        '<input id="swal-input1" class="swal2-input" placeholder="이름">' +
		        '<input id="swal-input2" class="swal2-input" placeholder="직위">' +
		        '<input id="swal-input3" class="swal2-input" placeholder="핸드폰">' +
		        '<input id="swal-input4" class="swal2-input" placeholder="이메일">' +
		        '<input id="swal-input5" class="swal2-input" placeholder="부서">' +
		        '<input id="swal-input6" class="swal2-input" placeholder="회사">' +
		        '<input id="swal-input7" class="swal2-input" placeholder="회사 전화">' +
		        '<input id="swal-input8" class="swal2-input" placeholder="회사 주소">' +
		        '<input id="swal-input9" class="swal2-input" placeholder="메모">' +
		        '<input id="swal-input10" class="swal2-input" placeholder="그룹">',

		      focusConfirm: false,
		      showCancelButton: true,
		      position: 'top',
		      customClass: {
		        popup: 'swal2-custom',
		        confirmButton: 'swal2-confirm',
		        cancelButton: 'swal2-cancel'
		      },
		      onBeforeOpen: (popup) => {
		        popup.style.marginTop = '200px';
		        const confirmButton = popup.querySelector('.swal2-confirm');
		        const cancelButton = popup.querySelector('.swal2-cancel');
		      },
		      preConfirm: () => {
		        const values = [
		          $('#swal-input1').val(),
		          $('#swal-input2').val(),
		          $('#swal-input3').val(),
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
		      const message =
		        '입력된 내용:\n' +
		        '이름: ' + formValues[0] + '\n' +
		        '직위: ' + formValues[1] + '\n' +
		        '핸드폰: ' + formValues[2] + '\n' +
		        '이메일: ' + formValues[3] + '\n' +
		        '부서: ' + formValues[4] + '\n' +
		        '회사: ' + formValues[5] + '\n' +
		        '회사 전화: ' + formValues[6] + '\n' +
		        '회사 주소: ' + formValues[7] + '\n' +
		        '메모: ' + formValues[8] + '\n' +
		        '그룹: ' + formValues[9];

		      Swal.fire({
		        icon: 'success',
		        title: '성공',
		        text: message
		      });
		    }
		  })();
		});



	  
	  
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