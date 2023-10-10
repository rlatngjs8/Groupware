<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>상세 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }

    h3 {
        width: 20%;
        margin-left: 9%;
        text-align: left;
        background-color: #007bff;
        color: #fff;
        padding: 10px 0;
    }

    #container {
        background-color: #fff;
        border-radius: 5px;
        margin: 20px auto;
        padding: 20px;
        width: 80%;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    #image {
        text-align: left;
        margin-bottom: 20px;
    }

    #exProfileIMG {
        max-width: 200px;
        max-height: 200px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    .tdclass {
        font-weight: bold;
        width: 12%;
    }

    td {
        padding: 10px;
        text-align: left;
    }

    .modify {
        width: 13px;
        height: 13px;
        margin-left: 2%;
        cursor: pointer;
    }

    #toast {
        position: fixed;
        bottom: 50%;
        left: 50%;
        transform: translateX(-50%);
        background-color: #333;
        color: white;
        padding: 10px 20px;
        border-radius: 5px;
        display: none;
        z-index: 2;
    }
    body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            margin: 20px auto;
            padding: 20px;
            width: 80%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .header {
            background-color: #75bddc;
            color: #fff;
            padding: 10px 0;
            text-align: center;
            border-radius: 8px 8px 0 0;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .table-container {
            margin-top: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th,
        table td {
            padding: 12px;
            text-align: left;
        }

        table th {
            background-color: #75bddc;
            color: #fff;
        }

        table td {
            border-bottom: 1px solid #ddd;
        }

        .edit-icon {
            color: #75bddc;
            cursor: pointer;
        }

        .edit-input {
            width: 100%;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-top: 4px;
        }

        .update-button {
            display: none;
            margin-top: 20px;
            background-color: #75bddc;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
        }

        .update-button:hover {
            background-color: #5397b9;
        }
        .btnLine {
        margin-top : 20px;
        }
    
</style>
<body>
<%@ include file="/WEB-INF/views/P_header.jsp" %>


<div id="toast" class="hidden">토스트 메세지 넣어라</div>
<div class="container">
<h1>연락처 수정</h1>
<table>
    <tr>
        <td class="tdclass">이름<span class="required">*</span></td>
        <td>
            <span id="editNameSpan"></span>
            <img src="/img/수정.png" id="modifyName" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">직급<span class="required">*</span></td>
        <td>
            <span id="editPositionSpan"></span>
            <img src="/img/수정.png" id="modifyPosition" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">전화번호<span class="required">*</span></td>
        <td>
            <span id="editPhoneSpan"></span>
            <img src="/img/수정.png" id="modifyPhone" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">이메일<span class="required">*</span></td>
        <td>
            <span id="editEmailSpan"></span>
            <img src="/img/수정.png" id="modifyEmail" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">부서</td>
        <td>
            <span id="editDepartmentSpan"></span>
            <img src="/img/수정.png" id="modifyDepartment" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사<span class="required">*</span></td>
        <td>
            <span id="editCompanySpan"></span>
            <img src="/img/수정.png" id="modifyCompany" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사 전화</td>
        <td>
            <span id="editCompanyPhoneSpan"></span>
            <img src="/img/수정.png" id="modifyCompanyPhone" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">회사 주소</td>
        <td>
            <span id="editCompanyAddressSpan"></span>
            <img src="/img/수정.png" id="modifyCompanyAddress" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">메모</td>
        <td>
            <span id="editMemoSpan"></span>
            <img src="/img/수정.png" id="modifyMemo" class="modify">
        </td>
    </tr>
    <tr>
        <td class="tdclass">그룹 이름</td>
        <td>
            <span id="editGroupNameSpan"></span>
            <img src="/img/수정.png" id="modifyGroupName" class="modify">
        </td>
    </tr>
</table>
<div class="btnLine">
<button class="btn btn-success m-2" id="confirmStart">수 정 완 료</button>
<button class="btn btn-danger m-2" id="confirmDelete">삭 제</button>
</div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // URL에서 가져온 값들을 각 입력 필드에 설정
    const currentUrl = new URL(window.location.href);
    $('#editNameSpan').text(currentUrl.searchParams.get("name"));
    $('#editPositionSpan').text(currentUrl.searchParams.get("position"));
    $('#editPhoneSpan').text(currentUrl.searchParams.get("phone"));
    $('#editEmailSpan').text(currentUrl.searchParams.get("email"));
    $('#editDepartmentSpan').text(currentUrl.searchParams.get("department"));
    $('#editCompanySpan').text(currentUrl.searchParams.get("company"));
    $('#editCompanyPhoneSpan').text(currentUrl.searchParams.get("companyPhone"));
    $('#editCompanyAddressSpan').text(currentUrl.searchParams.get("companyAddress"));
    $('#editMemoSpan').text(currentUrl.searchParams.get("memo"));
    $('#editGroupNameSpan').text(currentUrl.searchParams.get("groupName"));
    

    $(document).ready(function() {
        // 이미지를 클릭하면 해당 필드를 수정 가능하게 변경
        $(".modify").click(function() {
            const fieldId = $(this).attr("id").replace("modify", "edit");
            const editSpan = $("#" + fieldId + "Span");
            const editInput = $("<input>")
                .attr("id", fieldId + "Input")
                .addClass("editInput")
                .val(editSpan.text());

            editSpan.replaceWith(editInput);
            $("#updateButton").show();
        });
        
        // 전화번호 입력란의 ID를 가져옵니다. 이 예제에서는 phoneNumber입니다.
        var phoneNumberInput = $('#editPhoneInput');

        // 입력 필드의 값을 변경할 때 이벤트 핸들러를 추가합니다.
        phoneNumberInput.on('input', function() {
          // 입력된 전화번호에서 숫자만 추출합니다.
          var phoneNumber = phoneNumberInput.val().replace(/\D/g, '');

          // 전화번호가 11자리를 초과하지 않도록 제한합니다.
          if (phoneNumber.length > 11) {
            phoneNumber = phoneNumber.slice(0, 11);
          }

          // 전화번호 형식을 적용하여 하이픈을 추가합니다.
          if (phoneNumber.length >= 4 && phoneNumber.length <= 7) {
            phoneNumber = phoneNumber.replace(/(\d{3})(\d{1,4})/, '$1-$2');
          } else if (phoneNumber.length >= 8) {
            phoneNumber = phoneNumber.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
          }

          // 입력 필드에 변경된 전화번호를 설정합니다.
          phoneNumberInput.val(phoneNumber);
        });
        
    });
    
    $("#confirmStart").click(function () {
        Swal.fire({
            title: '연락처를 수정하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '취소',
            reverseButtons: false, // 버튼 순서 거꾸로
        }).then((result) => {
            if (result.isConfirmed) {
                // 수정 로직을 진행
                $(".modify").click(); // .modify 클래스를 가진 요소를 클릭
                $(".modify + input").css("display", "none"); // 클릭한 후에 해당 input 태그를 숨김

                var newName = $("#editNameInput").val();
                var newPosition = $("#editPositionInput").val();
                var newPhone = $("#editPhoneInput").val();
                var newEmail = $("#editEmailInput").val();
                var newDepartment = $("#editDepartmentInput").val();
                var newCompany = $("#editCompanyInput").val();
                var newCompanyPhone = $("#editCompanyPhoneInput").val();
                var newCompanyAddress = $("#editCompanyAddressInput").val();
                var newMemo = $("#editMemoInput").val();
                var newGroupName = $("#editGroupNameInput").val();
                var addressBookId = currentUrl.searchParams.get("addressBookId"); // addressBookId 가져오기

                console.log("newName:", newName);
                console.log("newPosition:", newPosition);
                console.log("newPhone:", newPhone);
                console.log("newEmail:", newEmail);
                console.log("newDepartment:", newDepartment);
                console.log("newCompany:", newCompany);
                console.log("newCompanyPhone:", newCompanyPhone);
                console.log("newCompanyAddress:", newCompanyAddress);
                console.log("newMemo:", newMemo);
                console.log("newGroupName:", newGroupName);
                console.log("addressBookId:", addressBookId);

                // 모든 필드가 빈 값인지 확인합니다.
                if (
                    !newName ||
                    !newPosition ||
                    !newPhone ||
                    !newEmail ||
                    !newCompany
                ) {
                    showToast("모든 필수 항목을 채워주세요.");
                    return; // 업데이트 중지
                }

                // 핸드폰 번호 형식 확인 (숫자만 허용)
                var phoneRegex = /^\d{3}-\d{4}-\d{4}$/; // 000-0000-0000 형식의 정규식

                if (!phoneRegex.test(newPhone)) {
                    showToast("올바른 핸드폰 번호 형식이 아닙니다. (000-0000-0000 형식으로 입력하세요)");
                    return; // 업데이트 중지
                }

                // 이메일 주소 형식 확인 (간단한 형식 검증, 더 엄격한 형식을 사용할 수도 있음)
                var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                if (!emailRegex.test(newEmail)) {
                    showToast("올바른 이메일 주소 형식이 아닙니다.");
                    return; // 업데이트 중지
                }

                const updateContactData = {
                    name: newName,
                    position: newPosition,
                    phone: newPhone,
                    email: newEmail,
                    department: newDepartment,
                    company: newCompany,
                    companyPhone: newCompanyPhone,
                    companyAddress: newCompanyAddress,
                    memo: newMemo,
                    groupName: newGroupName,
                    addressBookId: addressBookId
                };

                $.ajax({
                    url: '/updateContact',
                    type: 'post',
                    data: updateContactData,
                    success: function(data) {
                        console.log('업데이트 성공', data);
                        Swal.fire({
                            icon: 'success',
                            title: '수정이 완료되었습니다.',
                            showCancelButton: false, // 확인 버튼만 표시
                            confirmButtonText: '확인', // 확인 버튼 텍스트 설정
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // 확인 버튼을 클릭하면 페이지 리로드
                            	window.location.href = '/contact/personal';

                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('업데이트 실패:', error);
                        Swal.fire({
                            icon: 'error',
                            title: '업데이트 실패',
                            text: '연락처 수정 중 오류가 발생했습니다.',
                        });
                    }
                });
            }
        });
    });

    $("#confirmDelete").click(function () {
        Swal.fire({
            title: '이 연락처를 삭제하실껀가요?',
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
                // 승인 버튼을 클릭한 경우 Delete_emp 함수 호출
                Delete_emp();
            }
        })
    });


    
    function Delete_emp() {
        var addressBookId = currentUrl.searchParams.get("addressBookId"); // addressBookId 가져오기

        $.ajax({
            url: '/Delete_emp',
            type: 'post',
            data: { addressBookId: addressBookId }, // 수정된 부분: 객체 형태로 속성과 값을 지정
            success: function(data) {
                console.log('업데이트 성공', data);
                Swal.fire({
                    icon: 'success',
                    title: '삭제가 완료되었습니다.',
                    showCancelButton: false, // 확인 버튼만 표시
                    confirmButtonText: '확인', // 확인 버튼 텍스트 설정
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 확인 버튼을 클릭하면 페이지 리로드
                        window.location.href = '/contact/personal';
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error('업데이트 실패:', error);
                Swal.fire({
                    icon: 'error',
                    title: '업데이트 실패',
                    text: '연락처 수정 중 오류가 발생했습니다.',
                });
            }
        });
    }

</script>
</body>
</html>
