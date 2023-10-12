package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TodoDAO {
	ArrayList<TodoDTO> selectTodomain(int employeeid);
	TodoDTO selectTodoDmain(int todoid);
	ArrayList<TodoDTO> selectTodomember(int tid);
	ArrayList<TodoDTO> selectTodoEmp1();
	ArrayList<TodoDTO> selectTodoEmp2();
	ArrayList<TodoDTO> selectTodoEmp3();
	int selectMaxtodoid1();
	int selectMaxtodoid2(int employeeid);
	void insertAddtodos(int eid, String title);
	void insertTodomember(int tid, int eid);
	void deleteTodomember(int tid, int eid);
	void deleteTodoBoard(int todoid);
	void insertTodoTitle0(int tid, int eid, String todotitle);
	void insertTodoTitle1(int tid, int eid);
	void insertTodoTitle2(int tid, int eid);
	void insertTodoContent(int ttid, int eid, String content);
	
	void deleteTodoTitle(int todotitleid);
	void deleteTodoContent1(int ttid);
	void deleteTodoContent2(int todocontentid);
	int selectTodoMaxCid();
	void updateTodoContent(int ttid, int tcid, int todocontentid);
	
	ArrayList<TodoDTO> selectTodoTitle(int todoid);
	ArrayList<TodoDTO> selectTodoTitleid(int todoid);
	ArrayList<TodoDTO> selectTodoContent(int ttid);
}
