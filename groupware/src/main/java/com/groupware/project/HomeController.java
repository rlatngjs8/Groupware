package com.groupware.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

		@Autowired
		private EmployeesDAO edao;
		@Autowired
		private homeDAO hdao;
		
		@GetMapping("/")
		public String home(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession(false); // 세션이 존재하면 가져오고, 존재하지 않으면 새로 생성하지 않도록 설정
			if (session != null && session.getAttribute("userid") != null) {
				// 세션에 userid가 이미 설정되어 있으면 "home" 페이지로 리디렉션
//				String profileIMG=(String)session.getAttribute("profileIMG");
//				model.addAttribute("profileIMG", profileIMG);
				String userid = (String) session.getAttribute("userid");
				int empid = (Integer) session.getAttribute("EmpId");
				EmployeesDTO alEmp = edao.getListSelect(userid);
				model.addAttribute("emp",alEmp);
				
				ArrayList<homeDTO> alist=hdao.gethomealist();
				ArrayList<homeDTO> blist = hdao.getboardlist();
				
				ArrayList<homeDTO> RecMail = hdao.selectRecMail(empid);
				ArrayList<homeDTO> sendMail = hdao.selectSendMail(empid);
				ArrayList<homeDTO> Importantmail = hdao.selectImportantMail(empid);
				
				ArrayList<homeDTO> Wapproval = hdao.getWapplist(userid);
				ArrayList<homeDTO> Sapproval = hdao.getSapplist(userid);
				ArrayList<homeDTO> Rapproval = hdao.getRapplist(userid);
				
				model.addAttribute("alist",alist);
				model.addAttribute("blist",blist);
				model.addAttribute("rMlist", RecMail);
				model.addAttribute("sMlist", sendMail);
				model.addAttribute("iMlist", Importantmail);
				
				model.addAttribute("Wapproval", Wapproval);
				model.addAttribute("Sapproval", Sapproval);
				model.addAttribute("Rapproval", Rapproval);
				

				return "home";
			} else {
				// 세션에 userid가 없으면 로그인 페이지 표시
				return "login";
			}
		} 
		@PostMapping("/doLogin")
		@ResponseBody
		public String doLogin(HttpServletRequest req, HttpServletResponse response, HttpSession session) {
				String userid = req.getParameter("userid");
				String password = req.getParameter("password");
				String cookiePW = req.getParameter("cookiePW");
				System.out.println("password="+password);
				int n = edao.login(userid, password);
	  			if(n == 1) {
	  					ArrayList<EmployeesDTO> employee = edao.getListOne(userid);
	  					String name= "";
	  					String profileIMG = "";
	  					int employeeID = 0;
	  					
	  					// 세션에 userid, password, name, 프로필이미지 저장
	  					if(!employee.isEmpty()) {
	  							name = employee.get(0).getName();
	  							profileIMG = employee.get(0).getProfilePicture();
	  							employeeID = employee.get(0).getEmployeeID();
	  					}
	  					 
	  					session.setAttribute("userid", userid);
	  					session.setAttribute("password", password);
	  					session.setAttribute("name", name);
	  					session.setAttribute("profileIMG", profileIMG);
	  					session.setAttribute("EmpId", employeeID);
	  				
	  					//체크박스 체크되어있을때만 쿠키설정
	  					if(req.getParameter("auto") != null  && req.getParameter("auto").equals("on")) {
	  					
	  					//쿠키 설정
	  					Cookie useridCookie = new Cookie("userid", userid);
	  					Cookie passwordCookie = new Cookie("password",cookiePW);
	  					useridCookie.setMaxAge(7884000); // 쿠키 3개월 유효
	  					passwordCookie.setMaxAge(7884000); // 쿠키 3개월 유효
	  					response.addCookie(useridCookie);
	  					response.addCookie(passwordCookie);
	  			}
	  					return "success";
	  					
	  			} else {
	  					return "failed";					
	  			}
		}	
		@GetMapping("/logout")
		public String doLogout(HttpServletRequest req) {
		   HttpSession s = req.getSession();
		   s.invalidate();
		   return "redirect:/";
		}
		
		@GetMapping("/dosearch")
		public String doSearch(HttpServletRequest req,Model model) {
			String search = req.getParameter("search");
			HttpSession session = req.getSession();
			String userid = (String) session.getAttribute("userid");
			int empid = (Integer) session.getAttribute("EmpId");
			EmployeesDTO alEmp = edao.getListSelect(userid);
			model.addAttribute("emp",alEmp);
			
			ArrayList<homeDTO> alist=hdao.getSearchAnnouncement(search);
			ArrayList<homeDTO> blist = hdao.getSearchBoard(search);
			
			model.addAttribute("alist",alist);
			model.addAttribute("blist",blist);
			
			ArrayList<homeDTO> RecMail = hdao.getSearchReceiveMail(empid,search);
			ArrayList<homeDTO> sendMail = hdao.getSearchSendMail(empid,search);
			ArrayList<homeDTO> Importantmail = hdao.getSearchImportantMail(empid,search);
			
			model.addAttribute("rMlist", RecMail);
			model.addAttribute("sMlist", sendMail);
			model.addAttribute("iMlist", Importantmail);
			
			ArrayList<homeDTO> Wapproval = hdao.getSearchWaitApproval(userid,search);
			ArrayList<homeDTO> Sapproval = hdao.getSearchSendApproval(userid,search);
			ArrayList<homeDTO> Rapproval = hdao.getSearchReceiveApproval(userid,search);
			
			model.addAttribute("Wapproval", Wapproval);
			model.addAttribute("Sapproval", Sapproval);
			model.addAttribute("Rapproval", Rapproval);
			
			ArrayList<homeDTO> searchcalendar = hdao.getSearchcalendar(search);
			model.addAttribute("calendar", searchcalendar);
			return "P_searchresult";
		}
}
