package com.groupware.project;

public class MailDTO {
	    int emailid;
	    String subject;
	    String content;
	    int senderemployeeid; //employeeid
	    int receiveremployeeid; //employeeid
	    String sendtime;
	    String attachment1;
	    String attachment2;
	    String attachment3;
	    
	    
	    //employees
	    int employeeid;
	    String name;
	    int departmentid;
	    String position;
	    String email;
		public int getEmailid() {
			return emailid;
		}
		public void setEmailid(int emailid) {
			this.emailid = emailid;
		}
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getSenderemployeeid() {
			return senderemployeeid;
		}
		public void setSenderemployeeid(int senderemployeeid) {
			this.senderemployeeid = senderemployeeid;
		}
		public int getReceiveremployeeid() {
			return receiveremployeeid;
		}
		public void setReceiveremployeeid(int receiveremployeeid) {
			this.receiveremployeeid = receiveremployeeid;
		}
		public String getSendtime() {
			return sendtime;
		}
		public void setSendtime(String sendtime) {
			this.sendtime = sendtime;
		}
		public String getAttachment1() {
			return attachment1;
		}
		public void setAttachment1(String attachment1) {
			this.attachment1 = attachment1;
		}
		public String getAttachment2() {
			return attachment2;
		}
		public void setAttachment2(String attachment2) {
			this.attachment2 = attachment2;
		}
		public String getAttachment3() {
			return attachment3;
		}
		public void setAttachment3(String attachment3) {
			this.attachment3 = attachment3;
		}
		public int getEmployeeid() {
			return employeeid;
		}
		public void setEmployeeid(int employeeid) {
			this.employeeid = employeeid;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getDepartmentid() {
			return departmentid;
		}
		public void setDepartmentid(int departmentid) {
			this.departmentid = departmentid;
		}
		public String getPosition() {
			return position;
		}
		public void setPosition(String position) {
			this.position = position;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
    
}