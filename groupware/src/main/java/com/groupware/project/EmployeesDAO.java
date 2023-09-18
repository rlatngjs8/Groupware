package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmployeesDAO {

		int login(String userid, String password);
		ArrayList<EmployeesDTO> getListAll(String userid);
		
		ArrayList<EmployeesDTO> getListOne(String userid);
		
		
}
