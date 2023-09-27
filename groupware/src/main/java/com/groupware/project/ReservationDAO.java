package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationDAO {
	ArrayList<MeetingroomsDTO> getMeetingrooms();
	void reservationMeetingrooms(String roomName, String start, String end, String content, String writer, String connectionID);
	void reservations(int roomID, int reserverEmpID, String reservationDate, String startTime, String endTime, String connectionID);
	ArrayList<ReservationDTO> getTime(int roomId, String startDate);
	ReservationDTO getReservationDetailsR(String connectionID);
	ArrayList<ReservationDTO> getTimeDetails(int roomId, String startDate, String connectionID);
}
