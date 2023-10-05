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
import jakarta.servlet.http.HttpSession;


@Controller
public class HwanController {
	
	@Autowired
	private EmployeesDAO empdao;
	
	@Autowired
	private AttendanceDAO Attdao;
	
	@GetMapping("/contact/company")
	public String company() {
		return "contact/company";
	}
	
	@GetMapping("/contact/personal")
	public String personal() {
		return "contact/personal";
	}
	
	@GetMapping("/contact/detail")
	public String detail() {
		return "contact/detail";
	}
	
	@GetMapping("/attendance_management/attendance")
	public String attendance() {
		return "attendance_management/attendance";
	}
	

	@PostMapping("/insert_checkOut")
	@ResponseBody
	public String insert_checkOut(HttpServletRequest req, Model model, HttpSession session) {
		
	    String userid = req.getParameter("userid");
	    String date = req.getParameter("date");
	    String endTime = req.getParameter("endTime");

	    // 로그 메시지 출력
	    System.out.println("userid: " + userid);
	    System.out.println("date: " + date);
	    System.out.println("endTime: " + endTime);

	    Attdao.insert_checkOut(userid, date, endTime);

	    return "";
	}
	
	@PostMapping("/insert_checkIn")
	@ResponseBody
	public String insert_checkIn(HttpServletRequest req, Model model) {
	    String userid = req.getParameter("userid");
	    String date = req.getParameter("date");
	    String startTime = req.getParameter("startTime");
	    String AttendanceStatus = req.getParameter("AttendanceStatus");
	    // 메소드 호출 시 매개변수를 그대로 전달 (매개변수 이름에 데이터 타입 제거)
	    Attdao.insert_checkIn(userid, date, startTime, AttendanceStatus);
	    //redirect:/attendance_management/attendance"
	    return "";
	}
	

	@GetMapping("/get_addressBook")
	@ResponseBody
	public String get_addressBook(HttpServletRequest req, Model model) {
		String name = req.getParameter("name");
		ArrayList<EmployeesDTO> addressBook = null;
		
		if ("all".equals(name)) {
	        addressBook = empdao.getListAll();
	    } else if ("name".equals(name)){
	    	addressBook = empdao.getList_sort_name();
	    } else if ("department".equals(name)){
	    	addressBook = empdao.getList_sort_department();
	    } else if ("position".equals(name)){
	    	addressBook = empdao.getList_sort_position();
	    } else if ("phone".equals(name)){
	    	addressBook = empdao.getList_sort_phone();
	    } else if ("email".equals(name)){ 
	    	addressBook = empdao.getList_sort_email();
	    }
		
		JSONArray ja = new JSONArray();
	    for (int i = 0; i < addressBook.size(); i++) {
	        JSONObject jo = new JSONObject();
	        jo.put("name", addressBook.get(i).getName());
	        jo.put("department", addressBook.get(i).getDepartmentName()); // 직책 필드 추가
	        jo.put("position", addressBook.get(i).getPosition()); // 전화번호 필드 추가
	        jo.put("phone", addressBook.get(i).getPhoneNumber()); // 이메일 필드 추가
	        jo.put("email", addressBook.get(i).getEmail()); // 부서 필드 추가
	        ja.add(jo);
	    }
	    return ja.toJSONString();
	}
	

	@SuppressWarnings("unchecked")
	@GetMapping("/get_personal_addressBook")
	@ResponseBody
	public String get_personal_addressBook(HttpServletRequest req, Model model) {
	    String userid = req.getParameter("userid");
	    String name = req.getParameter("name");
	    ArrayList<AddressbookDTO> addressBook = null;
	    
	    // 필터에 따라 다른 SQL 쿼리를 실행하도록 설정합니다.
	    if ("all".equals(name)) {
	        addressBook = empdao.getListPaAll(userid);
	    } else if ("name".equals(name)){
	    	addressBook = empdao.getListPa_sort_name(userid);
	    } else if ("position".equals(name)){
	    	addressBook = empdao.getListPa_sort_position(userid);
	    } else if ("phone".equals(name)){
	    	addressBook = empdao.getListPa_sort_phone(userid);
	    } else if ("email".equals(name)){
	    	addressBook = empdao.getListPa_sort_email(userid);
	    }else if ("department".equals(name)){ 
	    	addressBook = empdao.getListPa_sort_department(userid);
	    } else if ("company".equals(name)){
	    	addressBook = empdao.getListPa_sort_company(userid);
	    } else if ("companyPhone".equals(name)){
	    	addressBook = empdao.getListPa_sort_companyPhone(userid);
	    } else if ("companyAddress".equals(name)){
	    	addressBook = empdao.getListPa_sort_companyAddress(userid);
	    } else if ("memo".equals(name)){
	    	addressBook = empdao.getListPa_sort_memo(userid);
	    } else if ("group".equals(name)){
	    	addressBook = empdao.getListPa_sort_group(userid);
	    }
		
	    
	    JSONArray ja = new JSONArray();
	    for (int i = 0; i < addressBook.size(); i++) {
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
	
	@PostMapping("/delete_addressBook")
	@ResponseBody
	public String delete_addressBook(HttpServletRequest req) {
		int addressBookId = Integer.parseInt(req.getParameter("addressBookId"));
		empdao.delete_addressBook(addressBookId);		
		return "";
	}
	
	@PostMapping("/updateContact")
	@ResponseBody
	public String updateContact(HttpServletRequest req, Model model) {
	    String Name = req.getParameter("name");
	    String Position = req.getParameter("position");
	    String Phone = req.getParameter("phone");
	    String Email = req.getParameter("email");
	    String Department = req.getParameter("department");
	    String Company = req.getParameter("company");
	    String CompanyPhone = req.getParameter("companyPhone");
	    String CompanyAddress = req.getParameter("companyAddress");
	    String Memo = req.getParameter("memo");
	    String Group = req.getParameter("groupName");
	    int addressBookId = Integer.parseInt(req.getParameter("addressBookId"));

	    // 디버깅을 위한 값 출력
	    System.out.println("Name: " + Name);
	    System.out.println("Position: " + Position);
	    System.out.println("Phone: " + Phone);
	    System.out.println("Email: " + Email);
	    System.out.println("Department: " + Department);
	    System.out.println("Company: " + Company);
	    System.out.println("CompanyPhone: " + CompanyPhone);
	    System.out.println("CompanyAddress: " + CompanyAddress);
	    System.out.println("Memo: " + Memo);
	    System.out.println("Group: " + Group);
	    System.out.println("addressBookId: " + addressBookId);

	    empdao.updateContact(Name, Position, Phone, Email, Department, Company, CompanyPhone, CompanyAddress, Memo, Group, addressBookId);

	    return "";
	}
	
	@GetMapping("/contact/test")
	public String test() {
		return "contact/test";
	}
	
	@PostMapping("/Delete_emp")
	@ResponseBody
	public String Delete_emp(HttpServletRequest req, Model model) {
	    int addressBookId = Integer.parseInt(req.getParameter("addressBookId"));

	    System.out.println("addressBookId: " + addressBookId);

	    empdao.Delete_emp(addressBookId);

	    return "";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/get_attendance")
	@ResponseBody
	public String get_attendance(HttpServletRequest req, Model model) {
	    String userid = req.getParameter("userid");
	    String name = req.getParameter("name");
	    ArrayList<AttendanceDTO> attendance = null;
	    
	    // 필터에 따라 다른 SQL 쿼리를 실행하도록 설정합니다.
	    if ("all".equals(name)) {
	    	attendance = Attdao.getListAll();
	    } else if ("name".equals(name)){
	    	attendance = Attdao.getList_sort_name();
	    } else if ("department".equals(name)){
	    	attendance = Attdao.getList_sort_department();
	    } else if ("date".equals(name)){
	    	attendance = Attdao.getList_sort_date();
	    } 
	    
	    JSONArray ja = new JSONArray();
	    for (int i = 0; i < attendance.size(); i++) {
	        JSONObject jo = new JSONObject();
	        jo.put("Userid", attendance.get(i).getUserid());
	        jo.put("name", attendance.get(i).getName());
	        jo.put("departmentname", attendance.get(i).getDepartmentName()); // 직책 필드 추가
	        jo.put("date", attendance.get(i).getDate()); // 전화번호 필드 추가
	        jo.put("attendancestatus", attendance.get(i).getAttendanceStatus()); // 이메일 필드 추가
	        jo.put("vacationtype", attendance.get(i).getVacationType()); // 부서 필드 추가
	        jo.put("remarks", attendance.get(i).getRemarks()); // 회사 필드 추가
	        jo.put("overtimehours", attendance.get(i).getOvertimeHours()); // 회사 전화번호 필드 추가
	        jo.put("starttime", attendance.get(i).getStartTime()); // 회사 주소 필드 추가
	        jo.put("endtime", attendance.get(i).getEndTime()); // 메모 필드 추가
	        jo.put("attendanceid", attendance.get(i).getAttendanceID()); // 그룹 이름 필드 추가
	        jo.put("employeeid", attendance.get(i).getEmployeeID()); // 작성자 ID 필드 추가
	        ja.add(jo);
	    }
	    return ja.toJSONString();
	}
	
	@GetMapping("/month_time")
	public String month_time(HttpServletRequest req, Model model) {
	    ArrayList<AttendanceDTO> month_time = Attdao.month_time();
	    model.addAttribute("time", month_time);

	    // 원하는 뷰 이름을 반환
	    return "attendance_management/attendance"; // 뷰 이름은 실제 프로젝트에서 사용하는 뷰의 이름으로 변경해야 합니다.
	}

	



}
