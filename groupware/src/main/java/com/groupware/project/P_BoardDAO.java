package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface P_BoardDAO {
	ArrayList<P_BoardDTO> getlist(int start, int psize);
	int getTotal();
	int savepost(String title, String content, int empId);
}
