package com.groupware.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SuController {
		
		@Autowired
		private EmployeesDAO edao;
		
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
		
}
