package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class HwanController {
	
	@Autowired
	private EmployeesDAO empdao;
	
	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/get_addressBook")
	@ResponseBody
	public String get_addressBook(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		System.out.println(userid);
		ArrayList<EmployeesDTO> addressBook = empdao.getListAll(userid);
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
	


}
