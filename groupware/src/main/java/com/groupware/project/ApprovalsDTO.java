package com.groupware.project;

public class ApprovalsDTO {
	
	int ApprovalID; // 전자결재 문서의 고유 식별자(ID)
	String ApprovalTitle; // 전자결재 문서의 제목
	String Sender_id; // 전자결재 문서를 작성한 사용자의 ID
	String Receiver_id; // 전자결재 문서를 받는 사용자의 ID
	String Content; // 전자결재 문서의 내용
	String approval_type; // 전자결재 문서의 종류 또는 유형 (예: 휴가, 경비 등)
	String Approval_status; // 전자결재 문서의 상태 (진행 중, 보류, 완료 등)
	String Approval_completed_at; // 전자결재 문서가 완료된 날짜와 시간
	String CreatedTime; // 전자결재 문서가 생성된 날짜와 시간
	String Comment; // 전자결재 문서에 대한 코멘트 또는 메모
	 
	String SenderName;
	String ReceiverName;
	
	public int getApprovalID() {
		return ApprovalID;
	}
	public void setApprovalID(int approvalID) {
		ApprovalID = approvalID;
	}
	public String getApprovalTitle() {
		return ApprovalTitle;
	}
	public void setApprovalTitle(String approvalTitle) {
		ApprovalTitle = approvalTitle;
	}
	public String getSender_id() {
		return Sender_id;
	}
	public void setSender_id(String sender_id) {
		Sender_id = sender_id;
	}
	public String getReceiver_id() {
		return Receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		Receiver_id = receiver_id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getApproval_type() {
		return approval_type;
	}
	public void setApproval_type(String approval_type) {
		this.approval_type = approval_type;
	}
	public String getApproval_status() {
		return Approval_status;
	}
	public void setApproval_status(String approval_status) {
		Approval_status = approval_status;
	}
	public String getApproval_completed_at() {
		return Approval_completed_at;
	}
	public void setApproval_completed_at(String approval_completed_at) {
		Approval_completed_at = approval_completed_at;
	}
	public String getCreatedTime() {
		return CreatedTime;
	}
	public void setCreatedTime(String createdTime) {
		CreatedTime = createdTime;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public String getSenderName() {
		return SenderName;
	}
	public void setSenderName(String senderName) {
		SenderName = senderName;
	}
	public String getReceiverName() {
		return ReceiverName;
	}
	public void setReceiverName(String receiverName) {
		ReceiverName = receiverName;
	}
	
}
