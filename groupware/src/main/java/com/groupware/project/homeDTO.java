package com.groupware.project;

public class homeDTO {
	String CommunityTitle;
	String Name;
	String FormattedDate;
	String Position;
	String CommunityID;

	public String getCommunityID() {
		return CommunityID;
	}
	public void setCommunityID(String communityID) {
		CommunityID = communityID;
	}
	public String getCommunityTitle() {
		return CommunityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		CommunityTitle = communityTitle;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
	public String getFormattedDate() {
		return FormattedDate;
	}
	public void setFormattedDate(String formattedDate) {
		FormattedDate = formattedDate;
	}
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	
	
	String emailid;
	String name;
	String email;
	String subject;
	String senderemployeeid;
	String receiveremployeeid;
	String sendtime;

	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getSenderemployeeid() {
		return senderemployeeid;
	}
	public void setSenderemployeeid(String senderemployeeid) {
		this.senderemployeeid = senderemployeeid;
	}
	public String getReceiveremployeeid() {
		return receiveremployeeid;
	}
	public void setReceiveremployeeid(String receiveremployeeid) {
		this.receiveremployeeid = receiveremployeeid;
	}
	public String getSendtime() {
		return sendtime;
	}
	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}
	
}
