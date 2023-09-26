package com.groupware.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	void insert_checkIn(String userid,String date  ,String startTime, String AttendanceStatus);
	void insert_checkOut(String userid, String date, String endTime);
 
}
