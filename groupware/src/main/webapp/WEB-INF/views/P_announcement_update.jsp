<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>공지사항 수정</title>
<style>
    body {
        background-color: #f2f2f2;
    }

    #editorContainer {
        background-color: white;
        margin: 100px auto;
        width: 950px;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
    }

    #smarteditor {
        margin-bottom: 20px;
    }

    #community_title {
        width: 95%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    textarea {
        width:100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        resize: vertical;
    }

    #submitButton {
        background-color: #4CAF50;
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 4px;
        cursor: pointer;
    }

    #submitButton:hover {
        background-color: #45a049;
    }
</style>
</head>
<%@ include file="P_header.jsp" %>
<link href="/P_css/Main_Content.css" rel="stylesheet" type="text/css">
<body>
<input type="hidden" value="${bpost.communityID}" id="seq">
<div id="editorContainer">
    <div id="smarteditor">
        <span>제목</span><input type="text" id="community_title" name="community_title" value="${bpost.communityTitle}">
        <textarea name="editorTxt" id="editorTxt" rows="20" cols="10">
        ${bpost.content}
        </textarea>
    </div>
    <input type="button" value="완료" id="submitButton" />
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
    let oEditors = []

    smartEditor = function() {
        console.log("Naver SmartEditor")
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "editorTxt",
            sSkinURI: "/smarteditor/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        })
    }

    $(document).ready(function() {
        smartEditor()
        $("#submitButton").click(function() {
            submitPost();
        });
    });
    
    submitPost = function() {
        oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", [])
        let content = document.getElementById("editorTxt").value

        if(content == '') {
            alert("내용을 입력해주세요.")
            oEditors.getById["editorTxt"].exec("FOCUS")
            return
        } else {
            let post = {
            	seq: $("#seq").val(),
                title: $("#community_title").val(),
                content: content
            }

            $.ajax({
                type: "POST",
                url: "/updateapost",
                data: post,
                success: function(data) {
                    console.log('success')
                    alert('저장하였습니다.')
                    document.location = data
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(jqXHR)
                    alert('오류가 발생하였습니다.')
                }
            })
        }
    }
</script>