package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class P_controller {
	@Autowired
	private P_BoardDAO bdao;
	@GetMapping("/header")
	public String header() {
		return "P_header";
	}
	@GetMapping("/community")
	public String community(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno=Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<P_BoardDTO> alBoard=bdao.getlist(start, psize);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alBoard.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("CommunityID", alBoard.get(i).getCommunityID());
			jo.put("CommunityTitle", alBoard.get(i).getCommunityTitle());
			jo.put("AuthorEmployeeID", alBoard.get(i).getAuthorEmployeeID());
			jo.put("Content", alBoard.get(i).getContent());
			jo.put("Views", alBoard.get(i).getViews());
			jo.put("Likes", alBoard.get(i).getLikes());
			jo.put("CreatedTime", alBoard.get(i).getCreatedTime());
			ja.add(jo);
		}
		ja.toJSONString();
		int cnt=bdao.getTotal();
		int pagecount = (int) Math.ceil(cnt/10.0);
		String pagestr="";
		for(int i=1; i<=pagecount;i++) {
			if(pno==i) {
				pagestr += i+"&nbsp;";
			}else {
				pagestr+="<a href='/?pageno="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		System.out.println(alBoard);
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "P_community";
	}
}
