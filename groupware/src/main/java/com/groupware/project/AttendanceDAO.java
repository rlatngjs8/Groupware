package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	void insert_checkIn(String userid,String date  ,String startTime, String AttendanceStatus);
	void insert_checkOut(String userid, String date, String endTime);
	
	ArrayList<AttendanceDTO> month_time();
	ArrayList<AttendanceDTO> getListAll(String month, String year, String userid);
	ArrayList<AttendanceDTO> getList_sort_name(String month, String year, String userid);
	ArrayList<AttendanceDTO> getList_sort_department(String month, String year, String userid);
	ArrayList<AttendanceDTO> getList_sort_date(String month, String year, String userid);
	
	ArrayList<AttendanceDTO> getManageListAll(String month, String year );
	ArrayList<AttendanceDTO> getManageList_sort_name(String month, String year );
	ArrayList<AttendanceDTO> getManageList_sort_department(String month, String year );
	ArrayList<AttendanceDTO> getManageList_sort_date(String month, String year );
 
}
