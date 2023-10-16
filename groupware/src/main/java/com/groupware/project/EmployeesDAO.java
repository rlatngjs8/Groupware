package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface EmployeesDAO {

		int login(String userid, String password);
		ArrayList<EmployeesDTO> getListAll();
		ArrayList<EmployeesDTO> getList_sort_name();
		ArrayList<EmployeesDTO> getList_sort_department();
		ArrayList<EmployeesDTO> getList_sort_position();
		ArrayList<EmployeesDTO> getList_sort_birthdate();
		ArrayList<EmployeesDTO> getList_sort_phone();
		ArrayList<EmployeesDTO> getList_sort_email();
		ArrayList<EmployeesDTO> getMember();
		
		ArrayList<EmployeesDTO> getListOne(String userid);
		void insert_addressBook (String Name,String Position ,String Phone, String Email,String Department ,String Company,String CompanyPhone, String CompanyAddress , String Memo ,String Group,String userid );
		ArrayList<EmployeesDTO> getList(int start, int psize);
		EmployeesDTO getListSelect(String userid);
		
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

		
		
		
		int Delete_emp(int addressBookId);
		int delete_addressBook(int addressBookIds);
		int getTotal();
		int updateContact (String Name,String Position ,String Phone, String Email,String Department ,String Company,String CompanyPhone, String CompanyAddress , String Memo ,String Group,int addressBookId );
		void signup(String userid, String password, String name, String departmentID, String position,
														String bithdate, String phoneNumber, String address, String email, String salary, String profileImg, String hireDate);
		
		void deleteEMP(String userid);
//		void modify(String name, int departmentID, String position,
//						String phoneNumber, String address, String email, String salary, String filePath, String userid);
		void editEMP(String name, String departmentID, String position, String phoneNumber, String address,
				String email, String salary, String fileName, String userid);
		void selfEdit(String password, String phoneNumber, String address, String userid);
		
		EmployeesDTO senderDepart(String sender_id);
		EmployeesDTO receiverDepart(String receiver_id);
		
}
