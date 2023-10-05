package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DocumentDAO {
	void insert(String documentTitle,String writer, String filetype, long filesize,String storageType);
	ArrayList<DocumentDTO> getList();
}
