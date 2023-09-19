package com.groupware.project;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SuController {
		
		@Autowired
		private EmployeesDAO edao;
		@Value("${image.upload.directory}")
  private String imageUploadDirectory;
		
		@GetMapping("/manage/showEmployee")
		public String showEmployee(HttpServletRequest req, Model model) {
				// 페이지 넘버 먹여서 직원리스트
			 int start,psize;
    String page = req.getParameter("pageno");
    if(page == null || page.equals("")) {
       page="1";
    }
    int pno = Integer.parseInt(page);
    start = (pno -1) * 10;
    psize = 10;
    ArrayList<EmployeesDTO> alEmp = edao.getList(start, psize);
    
    int cnt=edao.getTotal();
    System.out.println("cnt="+cnt);
    int pagecount = (int) Math.ceil(cnt/10.0);
    System.out.println("pagecount="+pagecount);
    
    String pagestr="";
    for(int i=1; i<=pagecount; i++) {
       if(pno == i) {
          pagestr += i+"&nbsp;";
       } else {
          pagestr+="<a href='/manage/showEmployee?pageno="+i+"'>"+i+"</a>&nbsp;";            
       }
       System.out.println(pagestr);
    }
    model.addAttribute("pagestr",pagestr);
    model.addAttribute("Elist",alEmp);
    
				return "/manage/showEmployee";
		}
		
		
		@PostMapping("/signup")
		public String signup(HttpServletRequest req,
																							@RequestParam(name = "profileIMG") MultipartFile profileIMG) {
			try {
				String userid = req.getParameter("userid");
				String password = req.getParameter("password");
				String name = req.getParameter("name");
				String departmentID = req.getParameter("departmentID");
				String position = req.getParameter("position");
				String birthdate = req.getParameter("birthday");
				String phoneNumber = req.getParameter("phoneNumber");
				String address = req.getParameter("address");
				String email = req.getParameter("email");
				String salary = req.getParameter("salary");
				String hireDate = req.getParameter("hireDate");
				
				String fileName = userid + "_" + name + ".jpg";;
    String filePath = imageUploadDirectory + "/" + fileName;
    profileIMG.transferTo(new File(filePath));
			
				edao.signup(userid,password,name,departmentID,position,birthdate,phoneNumber,address,email,salary,filePath,hireDate);
				System.out.println("성공");
				return "redirect:/manage/showEmployee";
			} catch(Exception e) {
			 e.printStackTrace();
    // 오류 페이지로 리다이렉트 또는 오류 메시지를 반환할 수 있습니다.
    return "errorPage";
			}
		}
}
