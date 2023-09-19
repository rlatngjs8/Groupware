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
public class MailController {
	@Autowired
	private MailDAO mdao;
	
//	public static void session(HttpServletRequest req, Model model) {
//		HttpSession s = req.getSession();
//		String uid = (String) s.getAttribute("user_id");
//		s.setMaxInactiveInterval(-1);
//		if(uid==null||uid.equals("")) {
//			model.addAttribute("userid","");
//		} else {
//			model.addAttribute("userid",uid);
//		}
//	}
	
	@GetMapping("/mailFolder0")
	public String mailFolder0(HttpServletRequest req, Model model) {
		
		//로그인임시
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시

		return "email/mailFolder0";
	}
	@GetMapping("/mailFolder1")
	public String mailFolder1(HttpServletRequest req, Model model) {
		
		//로그인임시
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시
		ArrayList<MailDTO> receiveEmail = mdao.selectRecMail(eid);
		System.out.println(receiveEmail.get(0).getEmailid());
		model.addAttribute("rlist", receiveEmail);

		return "email/mailFolder1";
	}
	@GetMapping("/mailFolder2")
	public String mailFolder2(HttpServletRequest req, Model model) {
		
		//로그인임시
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시

		return "email/mailFolder2";
	}
	
	@GetMapping("/mailWrite")
	public String mailWrite(HttpServletRequest req, Model model) {
		
		//로그인임시
		HttpSession s = req.getSession();
		s.setAttribute("empID", 18);
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시

		return "email/mailWrite";
	}
	@PostMapping("/mailSend")
	@ResponseBody
	public String mailSend(HttpServletRequest req, Model model) {
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
//		int senderEmployeeID = Integer.parseInt(req.getParameter("senderEmployeeID"));
		HttpSession s = req.getSession();
		int senderEmployeeID = (Integer) s.getAttribute("empID");
		String receiverEmail = req.getParameter("receiverEmail");
		MailDTO mdto = mdao.selectEmpEmail(receiverEmail); //이메일값을 받아서 이메일값으로 사원아이디를추적하여 최종적으로 insert해야함.
		
		//receiver 받는사람 정보//
		int recID = mdto.getEmployeeid();
		String recName = mdto.getName();
		int recDpartID = mdto.getDepartmentid();
		String recPosition = mdto.getPosition();
		String recEmail = mdto.getEmail();
//		System.out.println(empID+","+empName+","+DpartID+","+empPosition+","+empEmail);
		////
		
		//임시
		String attachment1="";
		String attachment2="";
		String attachment3="";
		mdao.insertEmails(subject, content, senderEmployeeID, recID,
				attachment1, attachment2, attachment3);
		return "mailFolder1";
	}
}
