package com.groupware.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	int getNewNotice();
}
