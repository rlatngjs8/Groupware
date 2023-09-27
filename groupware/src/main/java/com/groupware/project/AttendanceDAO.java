package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	void insert_checkIn(String userid,String date  ,String startTime, String AttendanceStatus);
	void insert_checkOut(String userid, String date, String endTime);
	
	ArrayList<AttendanceDTO> month_time();
	ArrayList<AttendanceDTO> getListAll();
	ArrayList<AttendanceDTO> getList_sort_name();
	ArrayList<AttendanceDTO> getList_sort_department();
	ArrayList<AttendanceDTO> getList_sort_date();
 
}
