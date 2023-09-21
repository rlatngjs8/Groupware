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
public class P_controller {
	@Autowired
	private P_BoardDAO bdao;
	@SuppressWarnings("unchecked")
	@GetMapping("/community")
	public String community(HttpServletRequest req, Model model) {
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
			jo.put("Userid", alBoard.get(i).getUserid());
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
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "P_community";
	}
	@GetMapping("/community_write")
	public String community_write(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Integer EmpId=(int) session.getAttribute("EmpId");
		return "P_community_write";
	}
	@PostMapping("/savepost")
	@ResponseBody
	public String savepost(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		int EmpId=(int) session.getAttribute("EmpId");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		bdao.savepost(title, content, EmpId);
		return "/community";
	}
	
	@GetMapping("/community_view")
	public String viewpost(HttpServletRequest req,Model model) {
		int seqno = Integer.parseInt(req.getParameter("seqno"));
		P_BoardDTO bdto = bdao.view(seqno);
		String oriwri=bdto.getUserid();
		bdao.hitup(seqno);
		model.addAttribute("bpost",bdto);
		System.out.println("----------------------"+bdto);
		HttpSession session = req.getSession();
		String writer=(String) session.getAttribute("userid");
		try {
			if(writer.equals(oriwri)){
				model.addAttribute("modidel","<a href='/write'>글쓰기</a>&nbsp;&nbsp;<button id=btnUpdate>수정</button>&nbsp;&nbsp;<button id=btnDelete>삭제</button>");
				return "P_community_view";
			}else {
				model.addAttribute("modidel","");
				model.addAttribute("write","<a href='/community_write'>글쓰기</a>&nbsp;");
				return "P_community_view";
			}
		} catch(Exception e) {
			model.addAttribute("modidel","");
			return "P_community_view";
		}
	}
	@PostMapping("/addComment")
	@ResponseBody
	public String addcomment(HttpServletRequest req,Model model) {
		int  seqno= Integer.parseInt(req.getParameter("postId"));
		String cmt = req.getParameter("comment");
		return "";
	}
}
