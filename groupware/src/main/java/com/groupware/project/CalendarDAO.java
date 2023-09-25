package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	ArrayList<CalendarDTO> getPlan();
	void planInsert(String title, String start, String end, String content);
	CalendarDTO getPlanDetails(int c_num);
	void planUpdate(int c_num, String title, String start, String end, String content);
	void planDelete(int c_num);
	void birthdayToC(String birthday, String birthdate);
}
