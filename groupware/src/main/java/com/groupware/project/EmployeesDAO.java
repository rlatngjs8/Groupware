package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface EmployeesDAO {

		int login(String userid, String password);
		ArrayList<EmployeesDTO> getListAll(String userid);
		
		ArrayList<EmployeesDTO> getListOne(String userid);
		
		ArrayList<EmployeesDTO> getList(int start, int psize);
	
		int getTotal();
		
		void signup(String userid, String password, String name, String departmentID, String position,
														String bithdate, String phoneNumber, String address, String email, String salary, String profileImg, String hireDate);
}
