package com.groupware.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
		@Autowired
		private EmployeesDAO edao;
		
		@GetMapping("/")
		public String home(HttpServletRequest req, Model model) {
			HttpSession session = req.getSession(false); // 세션이 존재하면 가져오고, 존재하지 않으면 새로 생성하지 않도록 설정
			if (session != null && session.getAttribute("userid") != null) {
				// 세션에 userid가 이미 설정되어 있으면 "home" 페이지로 리디렉션
				return "home";
			} else {
				// 세션에 userid가 없으면 로그인 페이지 표시
				return "login";
			}
		} 
		
	@PostMapping("/doLogin")
	public String doLogin(HttpServletRequest req, HttpServletResponse response, HttpSession session, Model model) {
			String userid = req.getParameter("userid");
			String password = req.getParameter("password");
			int n = edao.login(userid, password);
  			if(n == 1) {
  					ArrayList<EmployeesDTO> employee = edao.getListOne(userid);
  					String name= "";
  					String profileIMG = "";
  					
  					// 세션에 userid, password, name, 프로필이미지 저장
  					if(!employee.isEmpty()) {
  							name = employee.get(0).getName();
  							profileIMG = employee.get(0).getProfilePicture();
  					}
  					 
  					session.setAttribute("userid", userid);
  					session.setAttribute("password", password);
  					session.setAttribute("name", name);
  					session.setAttribute("profileIMG", profileIMG);
  					
  					//쿠키 설정
  					Cookie useridCookie = new Cookie("userid", userid);
  					Cookie passwordCookie = new Cookie("password",password);
  					useridCookie.setMaxAge(7884000); // 쿠키 3개월 유효
  					passwordCookie.setMaxAge(7884000); // 쿠키 3개월 유효
  					response.addCookie(useridCookie);
  					response.addCookie(passwordCookie);
  					
  					return "redirect:/";
  					
  			} else {
  					model.addAttribute("loginFailed", true);
  					return "login";					
  			}
	}
	
	
	
	
}
