package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface P_BoardDAO {
	ArrayList<P_BoardDTO> getlist(int start, int psize);
	int getTotal();
	int savepost(String title, String content, int empId);
	P_BoardDTO view(int seqno);
	void hitup(int seqno);
	void addComment(int seqno, String cmt, int empID);
	ArrayList<P_BoardDTO> getComment(int seqno);
	void updateBoard(int seq, String title, String content);
	void deleteBoard(int seqno);
	void deleteBoardcmt(int seqno);

	
	void updateComment(int cmtID, String cmt);
//	void deleteComment(int cmtID);		
}
