package com.groupware.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	void insert_checkIn(String userid,String date  ,String startTime);

 
}
