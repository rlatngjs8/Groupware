package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface EmployeesDAO {

		int login(String userid, String password);
		ArrayList<EmployeesDTO> getListAll(String userid);
		ArrayList<EmployeesDTO> getListOne(String userid);
		ArrayList<EmployeesDTO> getListGa(String userid);
		ArrayList<EmployeesDTO> getListNa(String userid);
		ArrayList<EmployeesDTO> getListDa(String userid);
		ArrayList<EmployeesDTO> getListRa(String userid);
		ArrayList<EmployeesDTO> getListMa(String userid);
		ArrayList<EmployeesDTO> getListBa(String userid);
		ArrayList<EmployeesDTO> getListSa(String userid);
		ArrayList<EmployeesDTO> getListAa(String userid);
		ArrayList<EmployeesDTO> getListJa(String userid);
		ArrayList<EmployeesDTO> getListCha(String userid);
		ArrayList<EmployeesDTO> getListCa(String userid);
		ArrayList<EmployeesDTO> getListTa(String userid);
		ArrayList<EmployeesDTO> getListPa(String userid);
		ArrayList<EmployeesDTO> getListHa(String userid);
		ArrayList<EmployeesDTO> getListAZ(String userid);
		void insert_addressBook (String Name,String Position ,String Phone, String Email,String Department ,String Company,String CompanyPhone, String CompanyAddress , String Memo ,String Group,String userid );
		ArrayList<EmployeesDTO> getList(int start, int psize);
		ArrayList<EmployeesDTO> getListSelect(String userid);
		
		ArrayList<AddressbookDTO> getListPaAll(String userid);
		ArrayList<AddressbookDTO> getListPaGa(String userid);
		ArrayList<AddressbookDTO> getListPaNa(String userid);
		ArrayList<AddressbookDTO> getListPaDa(String userid);
		ArrayList<AddressbookDTO> getListPaRa(String userid);
		ArrayList<AddressbookDTO> getListPaMa(String userid);
		ArrayList<AddressbookDTO> getListPaBa(String userid);
		ArrayList<AddressbookDTO> getListPaSa(String userid);
		ArrayList<AddressbookDTO> getListPaAa(String userid);
		ArrayList<AddressbookDTO> getListPaJa(String userid);
		ArrayList<AddressbookDTO> getListPaCha(String userid);
		ArrayList<AddressbookDTO> getListPaCa(String userid);
		ArrayList<AddressbookDTO> getListPaTa(String userid);
		ArrayList<AddressbookDTO> getListPaPa(String userid);
		ArrayList<AddressbookDTO> getListPaHa(String userid);
		ArrayList<AddressbookDTO> getListPaAZ(String userid);
		int delete_addressBook(int addressBookIds);
		int getTotal();
		
		void signup(String userid, String password, String name, String departmentID, String position,
														String bithdate, String phoneNumber, String address, String email, String salary, String profileImg, String hireDate);
		
		void deleteEMP(String userid);
		void modify(String editedName, int editedDepartment, String editedPosition,
						String editedPhoneNumber, String editedAddress, String editedEmail, String editedSalary, String filePath, String userid);
}
