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
		int max = tdao.selectMaxtodoid2(eid);
		tdao.insertTodomember(max,eid);
		int tid = tdao.selectMaxtodoid1();
		tdao.insertTodoTitle1(tid,eid);
		tdao.insertTodoTitle2(tid,eid);
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
		
		ArrayList<TodoDTO> selectTitle = tdao.selectTodoTitle(tid);
		model.addAttribute("selectTitle", selectTitle);
		
//		ArrayList<TodoDTO> selectTitleid = tdao.selectTodoTitleid(tid);
//		for(int i=0; i<selectTitleid.size();i++) {
////			System.out.println(selectTitleid.get(i).getTodotitleid());
//			int titleid = selectTitleid.get(i).getTodotitleid();
//			ArrayList<TodoDTO> selectContent = tdao.selectTodoContent(titleid);
//			model.addAttribute("selectContent", selectContent);
//		}
		return "todo/todoDetail";
	}
	@PostMapping("/todoContent")
	@ResponseBody
	public String todoContent(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		
		int tid = Integer.parseInt(req.getParameter("tid"));
		ArrayList<TodoDTO> selectTitleid = tdao.selectTodoTitleid(tid);
		JSONArray ja = new JSONArray();
		for(int i=0; i<selectTitleid.size(); i++) {
			int titleid = selectTitleid.get(i).getTodotitleid();
			ArrayList<TodoDTO> selectContent = tdao.selectTodoContent(titleid);
			for(int j=0; j<selectContent.size(); j++) {
				JSONObject jo = new JSONObject();
//				jo.put("todotitleid",selectContent.get(j).getTodotitleid());
//				jo.put("todoid",selectContent.get(j).getTodoid());
//				jo.put("empid",selectContent.get(j).getEmpid());
//				jo.put("todotitle",selectContent.get(j).getTodotitle());
				
//				selectContent.get(j).getEmpid();
				jo.put("todotitle",selectContent.get(j).getTodotitle());
				jo.put("todocontentid",selectContent.get(j).getTodocontentid());
				jo.put("name",selectContent.get(j).getName());
				jo.put("position",selectContent.get(j).getPosition());
				jo.put("ttid",selectContent.get(j).getTtid());
				jo.put("todocontent",selectContent.get(j).getTodocontent());
				System.out.println(selectContent.get(j).getTtid()+","+selectContent.get(j).getTodocontent());
				ja.add(jo);
			}
		}
		return ja.toJSONString();
	}
	@PostMapping("/updateTodoContent")
	@ResponseBody
	public String updateTodoContent(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int ttid = Integer.parseInt(req.getParameter("ttid"));
		int ctid = Integer.parseInt(req.getParameter("ctid"));
		int cnt = tdao.selectTodoMaxCid();
		cnt= cnt+1;
		tdao.updateTodoContent(ttid,cnt,ctid);
		return "todo/todo";
	}
	
	@PostMapping("/todoEmp")
	@ResponseBody
	public String todoEmp(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tid = Integer.parseInt(req.getParameter("todoid"));
		int eid = Integer.parseInt(req.getParameter("employeeid"));
		tdao.insertTodomember(tid,eid);
		return "todo/todo";
	}
	@PostMapping("/todoEmp2")
	@ResponseBody
	public String todoEmp2(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tid = Integer.parseInt(req.getParameter("todoid"));
		int eid = Integer.parseInt(req.getParameter("employeeid"));
		TodoDTO member = tdao.selectTodomember2(tid);
//		System.out.println(member.getEid());
		int tmember = member.getEid();
		if(tmember==eid) {
			return "NO";
		} else {
			tdao.deleteTodomember(tid,eid);
		}
		return "todo/todo";
	}
	
	@PostMapping("/todoDel")
	@ResponseBody
	public void todoDel(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tid = Integer.parseInt(req.getParameter("todoid"));
		tdao.deleteTodoBoard(tid);
	}
	
	@PostMapping("/btnAddTitleOK")
	@ResponseBody
	public void btnAddTitleOK(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		int tid = Integer.parseInt(req.getParameter("todoid"));
		String nowTitle = req.getParameter("nowTitle");
		tdao.insertTodoTitle0(tid,eid,nowTitle);
	}
	@PostMapping("/todoXbtn")
	@ResponseBody
	public void todoXbtn(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int ttid = Integer.parseInt(req.getParameter("ttid"));
		tdao.deleteTodoContent1(ttid);
		tdao.deleteTodoTitle(ttid);
	}
	@PostMapping("/todoletsdel")
	@ResponseBody
	public void todoletsdel(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int tcid = Integer.parseInt(req.getParameter("tcid"));
		tdao.deleteTodoContent2(tcid);
	}
	
	@PostMapping("/newboardContentAdd")
	@ResponseBody
	public void newboardContentAdd(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		int ttid = Integer.parseInt(req.getParameter("ttid"));
		String content = req.getParameter("content");
		tdao.insertTodoContent(ttid,eid,content);
	}
}
