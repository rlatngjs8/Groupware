package com.groupware.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class TodoController {
	
	@Autowired
	private TodoDAO tdao;
	
	@GetMapping("/todo")
	public String todo(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		ArrayList<TodoDTO> tlist = tdao.selectTodomain(eid);
		model.addAttribute("tlist",tlist);
		return "todo/todo";
	}
	@PostMapping("/newboardTitleAdd")
	@ResponseBody
	public String newboardTitleAdd(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		String subject = req.getParameter("subject");
		tdao.insertAddtodos(eid,subject);
		int max = tdao.selectMaxtodoid(eid);
		tdao.insertTodomember1(max,eid);
		return "todo/todo";
	}
	
	@GetMapping("/todoDetail")
	public String todoDetail(HttpServletRequest req, Model model) {
		int tid = Integer.parseInt(req.getParameter("tid"));
		TodoDTO tpost = tdao.selectTodoDmain(tid);
		model.addAttribute("tpost",tpost);
		return "todo/todoDetail";
	}
}
