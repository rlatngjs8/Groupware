package com.groupware.project;

public class ReservationDTO {
	int reservationID;
	int roomID;
	int reserverEmployeeID;
	String reservationDate;
	String starttime;
	String endtime;
	public int getReservationID() {
		return reservationID;
	}
	public void setReservationID(int reservationID) {
		this.reservationID = reservationID;
	}
	public int getRoomID() {
		return roomID;
	}
	public void setRoomID(int roomID) {
		this.roomID = roomID;
	}
	public int getReserverEmployeeID() {
		return reserverEmployeeID;
	}
	public void setReserverEmployeeID(int reserverEmployeeID) {
		this.reserverEmployeeID = reserverEmployeeID;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
}
