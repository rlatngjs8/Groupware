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
	int selectMaxtodoid(int employeeid);
	void insertAddtodos(int eid, String title);
	void insertTodomember1(int tid, int eid);
	void insertTodomember2(int tid, int eid);
	void deleteTodoBoard(int todoid);
}
