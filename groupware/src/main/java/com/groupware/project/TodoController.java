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
		ArrayList<TodoDTO> memberlist = tdao.selectTodomember(tid);
		model.addAttribute("member",memberlist);
		ArrayList<TodoDTO> emp1 = tdao.selectTodoEmp1();
		model.addAttribute("emp1",emp1);
		ArrayList<TodoDTO> emp2 = tdao.selectTodoEmp2();
		model.addAttribute("emp2",emp2);
		ArrayList<TodoDTO> emp3 = tdao.selectTodoEmp3();
		model.addAttribute("emp3",emp3);
		
		ArrayList<TodoDTO> selectTC = tdao.selectTodoContent(tid);
		model.addAttribute("selectTC", selectTC);
		return "todo/todoDetail";
	}
	@PostMapping("/todoEmp")
	@ResponseBody
	public String todoEmp(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tid = Integer.parseInt(req.getParameter("todoid"));
		int eid = Integer.parseInt(req.getParameter("employeeid"));
		tdao.insertTodomember2(tid,eid);
		return "todo/todo";
	}
	@PostMapping("/todoDel")
	@ResponseBody
	public void todoDel(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tid = Integer.parseInt(req.getParameter("todoid"));
		tdao.deleteTodoBoard(tid);
	}
	
	@PostMapping("/newboardContentTitleAdd")
	@ResponseBody
	public void newboardContentTitleAdd(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		int tid = Integer.parseInt(req.getParameter("todoid"));
		String title = req.getParameter("title");
		tdao.insertTodoContentTitle(tid,eid,title);
	}
}
