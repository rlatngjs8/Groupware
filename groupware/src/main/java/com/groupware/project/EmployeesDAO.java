package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface EmployeesDAO {

		int login(String userid, String password);
		ArrayList<EmployeesDTO> getListAll(String userid);
		ArrayList<EmployeesDTO> getListOne(String userid);
		void insert_addressBook (String Name,String Position ,String Phone, String Email,String Department ,String Company,String CompanyPhone, String CompanyAddress , String Memo ,String Group,String userid );
		ArrayList<EmployeesDTO> getList(int start, int psize);
		ArrayList<EmployeesDTO> getListSelect(String userid);
		
		ArrayList<AddressbookDTO> getListPaAll(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_name(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_position(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_phone(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_email(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_department(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_company(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_companyPhone(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_companyAddress(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_memo(String userid);
		ArrayList<AddressbookDTO> getListPa_sort_group(String userid);

		
		
		

		int delete_addressBook(int addressBookIds);
		int getTotal();
		void updateContact (String Name,String Position ,String Phone, String Email,String Department ,String Company,String CompanyPhone, String CompanyAddress , String Memo ,String Group,int addressBookId );
		void signup(String userid, String password, String name, String departmentID, String position,
														String bithdate, String phoneNumber, String address, String email, String salary, String profileImg, String hireDate);
		
		void deleteEMP(String userid);
		void modify(String editedName, int editedDepartment, String editedPosition,
						String editedPhoneNumber, String editedAddress, String editedEmail, String editedSalary, String filePath, String userid);
}
