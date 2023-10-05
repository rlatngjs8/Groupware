<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/emailCSS.css" rel="stylesheet" type="text/css"/>
<title>받은메일함</title>
<%@ include file="../P_header.jsp" %>
</head>
<style>
#trashcanFolder {color:black; font-weight:bold;}
input[type=checkbox] {width: 16px; height: 16px; vertical-align:middle; margin: 0 auto; cursor: pointer;}
</style>
<body style="font-size:14px; background-color:white;">
<div style="display:flex; height: 100%;">
<!-- 	<div style="width:210px; background-color: rgb(106, 176, 173);"></div> -->
	<jsp:include page="mailLeftDiv.jsp"></jsp:include>
	<div id="mDivMain">
		<div id="mailNow" class="divHidden">trash</div>
		<p id="mailSideTitle">휴지통</p>
		<c:if test='${rlist==""}'><p class="mline"></p><br><br><br><br><br><h2 style="text-align:center;">메일이 없습니다.</h2><br><br><br><br><br><br><br><br><br></c:if>
		<c:if test='${rlist!=""}'>
		<div style="height:28px; padding:10px 0 10px 40px;">
			<input type="checkbox" name="mChkAll" id="mCheckAll">
			&nbsp;&nbsp;&nbsp;<input type=button id="mRead" class="mFolderBtn" value="읽음">
			&nbsp;&nbsp;&nbsp;<input type=button id="mDelete" class="mFolderBtn" value="삭제">
		</div>
		<p class="mline"></p>
<%-- 		<div id="eid">${eid}</div> --%>
		<table id="rmailTable">
			<c:forEach items="${rlist}" var="r">
			<tr>
				<td class="rMailChk"><input type="checkbox" class="mChk" name="mChk"><div id="rEmailid" class="divHidden">${r.emailid}</div></td>
				<td class="rMailMark">
					<c:if test='${eid==r.senderemployeeid && eid!=r.receiveremployeeid}'>
						<div id="emailRmark" class="divHidden emailRmark e_erm">${r.sendmark}</div>
						<div id="emailMark" class="e_erm">
							<c:if test='${r.sendmark=="0"}'><img src='mailpageImg/star0.png' id="mStar" class="e_erm"></c:if>
							<c:if test='${r.sendmark!="0"}'><img src='mailpageImg/star1.png' id="mStar" class="e_erm"></c:if>
						</div>
					</c:if>
					<c:if test='${eid!=r.senderemployeeid && eid==r.receiveremployeeid}'>
						<div id="emailRmark" class="divHidden emailRmark e_erm">${r.receivemark}</div>
						<div id="emailMark" class="e_erm">
							<c:if test='${r.receivemark=="0"}'><img src='mailpageImg/star0.png' id="mStar" class="e_erm"></c:if>
							<c:if test='${r.receivemark!="0"}'><img src='mailpageImg/star1.png' id="mStar" class="e_erm"></c:if>
						</div>
					</c:if>
					<c:if test='${eid==r.senderemployeeid && eid==r.receiveremployeeid}'>
						<div id="emailRmark" class="divHidden emailRmark e_erm">${r.sendmark}</div>
						<div id="emailMark" class="e_erm">
							<c:if test='${r.sendmark=="0"}'><img src='mailpageImg/star0.png' id="mStar" class="e_erm"></c:if>
							<c:if test='${r.sendmark!="0"}'><img src='mailpageImg/star1.png' id="mStar" class="e_erm"></c:if>
						</div>
					</c:if>
				</td>
				<td class="rMailReadOrNot">
					<c:if test='${eid==r.senderemployeeid && eid!=r.receiveremployeeid}'>
						<div class="divHidden emailRS">${r.emailsend}</div>
						<div id="emailReadImg">
							<c:if test='${r.emailsend=="0"}'><img src='mailpageImg/mailIcon0.png'></c:if>
							<c:if test='${r.emailsend!="0"}'><img src='mailpageImg/mailIcon1.png'></c:if>
						</div>
						<div id="mailNow2" class="divHidden">tS</div>
					</c:if>
					<c:if test='${eid==r.receiveremployeeid && eid!=r.senderemployeeid}'>
						<div class="divHidden emailRS">${r.emailreceive}</div>
						<div id="emailReadImg">
							<c:if test='${r.emailreceive=="0"}'><img src='mailpageImg/mailIcon0.png'></c:if>
							<c:if test='${r.emailreceive!="0"}'><img src='mailpageImg/mailIcon1.png'></c:if>
						</div>
						<div id="mailNow2" class="divHidden">tR</div>
					</c:if>
					<c:if test='${eid==r.senderemployeeid && eid==r.receiveremployeeid}'>
						<div class="divHidden emailRS">${r.emailsend}</div>
						<div id="emailReadImg">
							<c:if test='${r.emailsend=="0"}'><img src='mailpageImg/mailIcon0.png'></c:if>
							<c:if test='${r.emailsend!="0"}'><img src='mailpageImg/mailIcon1.png'></c:if>
						</div>
						<div id="mailNow2" class="divHidden">tS</div>
					</c:if>
				</td>
				<td id="rMailName"><div>${r.name}&#60;${r.email}&#62;</div></td>
				<td id="rMailTitle">${r.subject}</td>
				<td class="erSendtime">${r.sendtime}/</td>
			</tr>
			</c:forEach>
		</table>
		</c:if>
		<br>
		<c:if test='${rlist!=""}'>
		<div id="mailPageDiv">
			<div id="mailPno" class="divHidden">${pageno}</div>
			<div id="mailPcnt" class="divHidden">${pagecnt}</div>
			<input type=button id="mPrev" class="mFolderBtn2" value="이전">
			&nbsp;${pagestr}&nbsp;
			<input type=button id="mNext" class="mFolderBtn2" value="다음">
		</div>
		</c:if>
		<br><br>
	</div>
</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/email.js"></script>
<script>
// $(document)
// .ready(function(){
// });
</script>
</html>