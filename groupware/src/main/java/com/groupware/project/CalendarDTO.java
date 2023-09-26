package com.groupware.project;

public class CalendarDTO {
	int calendar_no;
	String calendar_title;
	String calendar_memo;
	String calendar_start;
	String calendar_end;
	int birthday;
	int reservation;
	String writer;
	public int getReservation() {
		return reservation;
	}
	public void setReservation(int reservation) {
		this.reservation = reservation;
	}
	
	public int getCalendar_no() {
		return calendar_no;
	}
	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}
	public String getCalendar_title() {
		return calendar_title;
	}
	public int getBirthday() {
		return birthday;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}
	public String getCalendar_memo() {
		return calendar_memo;
	}
	public void setCalendar_memo(String calendar_memo) {
		this.calendar_memo = calendar_memo;
	}
	public String getCalendar_start() {
		return calendar_start;
	}
	public void setCalendar_start(String calendar_start) {
		this.calendar_start = calendar_start;
	}
	public String getCalendar_end() {
		return calendar_end;
	}
	public void setCalendar_end(String calendar_end) {
		this.calendar_end = calendar_end;
	}
}
