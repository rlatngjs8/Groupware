package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CalendarDAO {
	ArrayList<CalendarDTO> getPlan();
}
