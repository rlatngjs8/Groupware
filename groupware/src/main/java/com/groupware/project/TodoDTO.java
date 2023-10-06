package com.groupware.project;

public class TodoDTO {
	int todoid;
	int employeeid;
	String subject;
	String registrationdate;
	int status;
	
	int tid;
	int eid;
	
	int TodocontentID;
	int TodoID;
	int EmpID;
    String TodoTitle;
    String TodoContent;
    String time;
    
	public int getTodoid() {
		return todoid;
	}
	public void setTodoid(int todoid) {
		this.todoid = todoid;
	}
	public int getEmployeeid() {
		return employeeid;
	}
	public void setEmployeeid(int employeeid) {
		this.employeeid = employeeid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegistrationdate() {
		return registrationdate;
	}
	public void setRegistrationdate(String registrationdate) {
		this.registrationdate = registrationdate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getTodocontentID() {
		return TodocontentID;
	}
	public void setTodocontentID(int todocontentID) {
		TodocontentID = todocontentID;
	}
	public int getTodoID() {
		return TodoID;
	}
	public void setTodoID(int todoID) {
		TodoID = todoID;
	}
	public int getEmpID() {
		return EmpID;
	}
	public void setEmpID(int empID) {
		EmpID = empID;
	}
	public String getTodoTitle() {
		return TodoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		TodoTitle = todoTitle;
	}
	public String getTodoContent() {
		return TodoContent;
	}
	public void setTodoContent(String todoContent) {
		TodoContent = todoContent;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
