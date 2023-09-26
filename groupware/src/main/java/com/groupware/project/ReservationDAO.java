package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationDAO {
	ArrayList<MeetingroomsDTO> getMeetingrooms();
	void reservationMeetingrooms(String roomName, String start, String end, String content, String writer);
	void reservations(int roomID, int reserverEmpID, String reservationDate, String startTime, String endTime);
	ArrayList<ReservationDTO> getTime(int roomId, String startDate);
}
