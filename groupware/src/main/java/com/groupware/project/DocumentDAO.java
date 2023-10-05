package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DocumentDAO {
	void insert(String documentTitle,String writer, String filetype, long filesize,String storageType);
	ArrayList<DocumentDTO> getList();
	ArrayList<DocumentDTO> getListUser(String userid);
	
	  int getCount();
	  int getCountUser(String userid);

	    // getListUserForPage 메서드 추가
	    ArrayList<DocumentDTO> getListUserForPage(String userid, int startRow, int itemsPerPage);

	    // getListForPage 메서드 추가
	    ArrayList<DocumentDTO> getListForPage(int startRow, int itemsPerPage);
		DocumentDTO getDocumentById(Long documentId);

}
