package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	ArrayList<NoticeDTO> getNewNotice(int empID);
	int countRequest(int empID);
}
