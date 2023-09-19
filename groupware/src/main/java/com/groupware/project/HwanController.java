package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class HwanController {
	
	@Autowired
	private EmployeesDAO empdao;
	
	@GetMapping("/contact/company")
	public String company() {
		return "contact/company";
	}
	
	@GetMapping("/contact/personal")
	public String personal() {
		return "contact/personal";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/get_addressBook")
	@ResponseBody
	public String get_addressBook(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
	    String filter = req.getParameter("filter"); // 필터 값을 받아옵니다.
		System.out.println(userid);
		ArrayList<EmployeesDTO> addressBook = null;
	    // 필터에 따라 다른 SQL 쿼리를 실행하도록 설정합니다.
	    if ("all".equals(filter)) {
	        addressBook = empdao.getListAll(userid);
	    } else if ("ㄱ".equals(filter)){
	    	addressBook = empdao.getListGa(userid);
	    } else if ("ㄴ".equals(filter)){
	    	addressBook = empdao.getListNa(userid);
	    } else if ("ㄷ".equals(filter)){
	    	addressBook = empdao.getListDa(userid);
	    }else if ("ㄹ".equals(filter)){ 
	    	addressBook = empdao.getListRa(userid);
	    } else if ("ㅁ".equals(filter)){
	    	addressBook = empdao.getListMa(userid);
	    } else if ("ㅂ".equals(filter)){
	    	addressBook = empdao.getListBa(userid);
	    } else if ("ㅅ".equals(filter)){
	    	addressBook = empdao.getListSa(userid);
	    } else if ("ㅇ".equals(filter)){
	    	addressBook = empdao.getListAa(userid);
	    } else if ("ㅈ".equals(filter)){
	    	addressBook = empdao.getListJa(userid);
	    } else if ("ㅊ".equals(filter)){
	    	addressBook = empdao.getListCha(userid);
	    } else if ("ㅌ".equals(filter)){
	    	addressBook = empdao.getListTa(userid);
	    } else if ("ㅍ".equals(filter)){
	    	addressBook = empdao.getListPa(userid);
	    } else if ("ㅎ".equals(filter)){
	    	addressBook = empdao.getListHa(userid);
	    } else if ("AZ".equals(filter)){
	    	addressBook = empdao.getListAZ(userid);
	    }

	    JSONArray ja = new JSONArray();
	    for (int i = 0; i < addressBook.size(); i++) {
	    	System.out.println(addressBook.size());
	        JSONObject jo = new JSONObject();
	        jo.put("employeeID", addressBook.get(i).getEmployeeID());
	        jo.put("userid", addressBook.get(i).getUserid());
	        jo.put("password", addressBook.get(i).getPassword());
	        jo.put("name", addressBook.get(i).getName());
	        jo.put("departmentID", addressBook.get(i).getDepartmentID());
	        jo.put("position", addressBook.get(i).getPosition());
	        jo.put("birthday", addressBook.get(i).getBirthday());
	        jo.put("phoneNumber", addressBook.get(i).getPhoneNumber());
	        jo.put("address", addressBook.get(i).getAddress());
	        jo.put("email", addressBook.get(i).getEmail());
	        jo.put("salary", addressBook.get(i).getSalary());
	        jo.put("profilePicture", addressBook.get(i).getProfilePicture());
	        jo.put("hireDate", addressBook.get(i).getHireDate());
	        jo.put("managerEmployeeID", addressBook.get(i).getManagerEmployeeID());
	        ja.add(jo);
	    }
	    return ja.toJSONString();
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/get_personal_addressBook")
	@ResponseBody
	public String get_personal_addressBook(HttpServletRequest req, Model model) {
	    String userid = req.getParameter("userid");
	    String filter = req.getParameter("filter");
	    System.out.println(userid);
	    ArrayList<AddressbookDTO> addressBook = null;
	    
	    // 필터에 따라 다른 SQL 쿼리를 실행하도록 설정합니다.
	    if ("all".equals(filter)) {
	        addressBook = empdao.getListPaAll(userid);
	    } else if ("ㄱ".equals(filter)){
	    	addressBook = empdao.getListPaGa(userid);
	    } else if ("ㄴ".equals(filter)){
	    	addressBook = empdao.getListPaNa(userid);
	    } else if ("ㄷ".equals(filter)){
	    	addressBook = empdao.getListPaDa(userid);
	    }else if ("ㄹ".equals(filter)){ 
	    	addressBook = empdao.getListPaRa(userid);
	    } else if ("ㅁ".equals(filter)){
	    	addressBook = empdao.getListPaMa(userid);
	    } else if ("ㅂ".equals(filter)){
	    	addressBook = empdao.getListPaBa(userid);
	    } else if ("ㅅ".equals(filter)){
	    	addressBook = empdao.getListPaSa(userid);
	    } else if ("ㅇ".equals(filter)){
	    	addressBook = empdao.getListPaAa(userid);
	    } else if ("ㅈ".equals(filter)){
	    	addressBook = empdao.getListPaJa(userid);
	    } else if ("ㅊ".equals(filter)){
	    	addressBook = empdao.getListPaCha(userid);
	    } else if ("ㅌ".equals(filter)){
	    	addressBook = empdao.getListPaTa(userid);
	    } else if ("ㅍ".equals(filter)){
	    	addressBook = empdao.getListPaPa(userid);
	    } else if ("ㅎ".equals(filter)){
	    	addressBook = empdao.getListPaHa(userid);
	    } else if ("AZ".equals(filter)){
	    	addressBook = empdao.getListPaAZ(userid);
	    }
		
	    
	    JSONArray ja = new JSONArray();
	    for (int i = 0; i < addressBook.size(); i++) {
	        System.out.println(addressBook.size());
	        JSONObject jo = new JSONObject();
	        jo.put("address_book_id", addressBook.get(i).getAddress_book_id());
	        jo.put("name", addressBook.get(i).getName());
	        jo.put("position", addressBook.get(i).getPosition()); // 직책 필드 추가
	        jo.put("phone", addressBook.get(i).getPhone()); // 전화번호 필드 추가
	        jo.put("email", addressBook.get(i).getEmail()); // 이메일 필드 추가
	        jo.put("department", addressBook.get(i).getDepartment()); // 부서 필드 추가
	        jo.put("company", addressBook.get(i).getCompany()); // 회사 필드 추가
	        jo.put("company_phone", addressBook.get(i).getCompany_phone()); // 회사 전화번호 필드 추가
	        jo.put("company_address", addressBook.get(i).getCompany_address()); // 회사 주소 필드 추가
	        jo.put("memo", addressBook.get(i).getMemo()); // 메모 필드 추가
	        jo.put("group_name", addressBook.get(i).getGroup_name()); // 그룹 이름 필드 추가
	        jo.put("writer_id", addressBook.get(i).getWriter_id()); // 작성자 ID 필드 추가
	        ja.add(jo);
	    }
	    return ja.toJSONString();
	}

	
	@PostMapping("/insert_addressBook")
	@ResponseBody
	public String insert_addressBook(HttpServletRequest req, Model model) {
	    String Name = req.getParameter("Name");
	    String Position = req.getParameter("Position");
	    String Phone = req.getParameter("Phone");
	    String Email = req.getParameter("Email");
	    String Department = req.getParameter("Department");
	    String Company = req.getParameter("Company");
	    String CompanyPhone = req.getParameter("CompanyPhone");
	    String CompanyAddress = req.getParameter("CompanyAddress");
	    String Memo = req.getParameter("Memo");
	    String Group = req.getParameter("Group");
	    String userid = req.getParameter("userid");

	    // 메소드 호출 시 매개변수를 그대로 전달 (매개변수 이름에 데이터 타입 제거)
	    empdao.insert_addressBook(Name, Position, Phone, Email, Department, Company, CompanyPhone, CompanyAddress, Memo, Group, userid);

	    return "redirect:/contact/personal";
	}

	
	



}
