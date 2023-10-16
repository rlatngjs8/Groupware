package com.groupware.project;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class P_controller {
	@Value("${image.upload.directory}")
	private String imageUploadDirectory;
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
			jo.put("Name", alBoard.get(i).getName());
			jo.put("Position", alBoard.get(i).getPosition());
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
				pagestr+="<a href='/community?pageno="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "board/P_community";
	}
	@GetMapping("/doboardsearch")
	@SuppressWarnings("unchecked")
	public String doboardsearch(HttpServletRequest req,Model model) {
		String search = req.getParameter("search");
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno=Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<P_BoardDTO> alBoard=bdao.getsearch(start, psize,search);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alBoard.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("CommunityID", alBoard.get(i).getCommunityID());
			jo.put("CommunityTitle", alBoard.get(i).getCommunityTitle());
			jo.put("Name", alBoard.get(i).getName());
			jo.put("Position", alBoard.get(i).getPosition());
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
				pagestr+="<a href='/doboardsearch?search="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "board/P_community";
	}
	@GetMapping("/community_write")
	public String community_write(HttpServletRequest req, Model model) {
		return "board/P_community_write";
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
		ArrayList<P_BoardDTO> alComment=bdao.getComment(seqno);
		model.addAttribute("alComment",alComment);
		model.addAttribute("bpost",bdto);
		HttpSession session = req.getSession();
		String writer=(String) session.getAttribute("userid");
		model.addAttribute("user",writer);
		int chklike = bdao.chklike(writer,seqno);
		if (chklike >= 1) {
			model.addAttribute("chklike",true);
			
		} else {
			model.addAttribute("chklike",false);
			
		}
		try {
			if(writer.equals(oriwri)||writer.equals("관리자1")){
				model.addAttribute("modidel","<button id=btnUpdate>수정</button>&nbsp;&nbsp;<button id=btnDelete>삭제</button>");
				return "board/P_community_view";
			}else {
				model.addAttribute("modidel","");
				return "board/P_community_view";
			}
		} catch(Exception e) {
			model.addAttribute("modidel","");
			return "board/P_community_view";
		}
	}
	@GetMapping("/community_view_update")
	public String updateview(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		P_BoardDTO bdto = bdao.view(seqno);
		model.addAttribute("bpost",bdto);
		return "board/P_view_update";
	}
	@PostMapping("/updatepost")
	@ResponseBody
	public String updatepost(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		bdao.updateBoard(seqno,title,content);
		return "community_view?seqno="+seqno;
	}
	@GetMapping("/deletepost")
	public String deletepost(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		bdao.deleteBoardcmt(seqno);
		bdao.deleteBoard(seqno);
		bdao.deletelike(seqno);
		return "redirect:/community";
	}
	@PostMapping("/addComment")
	@ResponseBody
	public String addcomment(HttpServletRequest req,Model model) {
		HttpSession session = req.getSession();
		int EmpID= (int) session.getAttribute("EmpId");
		int  seqno= Integer.parseInt(req.getParameter("postId"));
		String cmt = req.getParameter("comment");
		bdao.addComment(seqno,cmt,EmpID);
		return "community_view?seqno="+seqno;
	}
	@PostMapping("/updateComment")
	@ResponseBody
	public String updatcomment(HttpServletRequest req,Model model) {
		int  cmtID= Integer.parseInt(req.getParameter("cmtID"));
		String updatecmt = req.getParameter("updatecmt");
		bdao.updateComment(cmtID,updatecmt);
		return "community_view?seqno="+Integer.parseInt(req.getParameter("seqno"));
	}
	
	 @PostMapping("/deleteComment")
	 @ResponseBody 
	 public String deletecomment(HttpServletRequest req,Model model){ 
		 int cmtID= Integer.parseInt(req.getParameter("cmtID"));
		 bdao.deleteComment(cmtID); 
		 return "community_view?seqno="+Integer.parseInt(req.getParameter("seqno")); 
	}
	@PostMapping("/like")
	@ResponseBody
	public String like(HttpServletRequest req,Model model) {
		int  seqno= Integer.parseInt(req.getParameter("seqno"));
		HttpSession session = req.getSession();
		int EmpID= (int) session.getAttribute("EmpId");
		System.out.println("please"+seqno+EmpID);
		bdao.like(seqno,EmpID); 
		return "1";
	}
	@PostMapping("/undolike")
	@ResponseBody
	public String undolike(HttpServletRequest req,Model model) {
		int  seqno= Integer.parseInt(req.getParameter("seqno"));
		HttpSession session = req.getSession();
		int EmpID= (int) session.getAttribute("EmpId");
		bdao.undolike(seqno,EmpID);
		return "0";
	}
	@GetMapping("/announcement")
	public String announcement(HttpServletRequest req,Model model) {
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno=Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<P_BoardDTO> alBoard=bdao.getalist(start, psize);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alBoard.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("CommunityID", alBoard.get(i).getCommunityID());
			jo.put("CommunityTitle", alBoard.get(i).getCommunityTitle());
			jo.put("Name", alBoard.get(i).getName());
			jo.put("Position", alBoard.get(i).getPosition());
			jo.put("Content", alBoard.get(i).getContent());
			jo.put("Views", alBoard.get(i).getViews());
			jo.put("CreatedTime", alBoard.get(i).getCreatedTime());
			ja.add(jo);
		}
		ja.toJSONString();
		int cnt=bdao.getaTotal();
		int pagecount = (int) Math.ceil(cnt/10.0);
		String pagestr="";
		for(int i=1; i<=pagecount;i++) {
			if(pno==i) {
				pagestr += i+"&nbsp;";
			}else {
				pagestr+="<a href='/announcement?pageno="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "board/P_announcement";
	}
	@GetMapping("/announcement_write")
	public String announcementwrite(HttpServletRequest req,Model model) {
		return "board/P_announcement_write";
	}
	@PostMapping("/announcement_savepost")
	@ResponseBody
	public String announcementsavepost(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		int EmpId=(int) session.getAttribute("EmpId");
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		bdao.saveapost(title, content, EmpId);
		return "/announcement";
	}
	@GetMapping("/announcement_view")
	public String announcementviewpost(HttpServletRequest req,Model model) {
		Integer seqno = Integer.parseInt(req.getParameter("seqno"));
		P_BoardDTO bdto = bdao.aview(seqno);
		String oriwri=bdto.getUserid();
		System.out.println(seqno);
		bdao.ahitup(seqno);
		model.addAttribute("bpost",bdto);
		HttpSession session = req.getSession();
		String writer=(String) session.getAttribute("userid");
		model.addAttribute("user",writer);
		try {
			if(writer.equals(oriwri)||writer.equals("관리자1")){
				model.addAttribute("modidel","<button id=btnUpdate>수정</button>&nbsp;&nbsp;<button id=btnDelete>삭제</button>");
				return "board/P_announcement_view";
			}else {
				model.addAttribute("modidel","");
				return "board/P_announcement_view";
			}
		} catch(Exception e) {
			model.addAttribute("modidel","");
			return "board/P_announcement_view";
		}
	}
	@GetMapping("/announcement_view_update")
	public String updateannouncement(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		P_BoardDTO bdto = bdao.aview(seqno);
		model.addAttribute("bpost",bdto);
		return "board/P_announcement_update";
	}
	@PostMapping("/updateapost")
	@ResponseBody
	public String updateapost(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		bdao.updateaBoard(seqno,title,content);
		return "/announcement_view?seqno="+seqno;
	}
	@GetMapping("/deleteapost")
	public String deleteapost(HttpServletRequest req,Model model) {
		int seqno= Integer.parseInt(req.getParameter("seq"));
		bdao.deleteaBoard(seqno);
		return "/announcement";
	}
	@GetMapping("/doaboardsearch")
	@SuppressWarnings("unchecked")
	public String dobaoardsearch(HttpServletRequest req,Model model) {
		String search = req.getParameter("search");
		int start,psize;
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		int pno=Integer.parseInt(page);
		start = (pno-1)*10;
		psize = 10;
		ArrayList<P_BoardDTO> alBoard=bdao.getasearch(start, psize,search);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alBoard.size();i++) {
			JSONObject jo = new JSONObject();
			jo.put("CommunityID", alBoard.get(i).getCommunityID());
			jo.put("CommunityTitle", alBoard.get(i).getCommunityTitle());
			jo.put("Name", alBoard.get(i).getName());
			jo.put("Position", alBoard.get(i).getPosition());
			jo.put("Content", alBoard.get(i).getContent());
			jo.put("Views", alBoard.get(i).getViews());
			jo.put("CreatedTime", alBoard.get(i).getCreatedTime());
			ja.add(jo);
		}
		ja.toJSONString();
		int cnt=bdao.getaTotal();
		int pagecount = (int) Math.ceil(cnt/10.0);
		String pagestr="";
		for(int i=1; i<=pagecount;i++) {
			if(pno==i) {
				pagestr += i+"&nbsp;";
			}else {
				pagestr+="<a href='/doaboardsearch?search="+i+"'>"+i+"</a>&nbsp;";
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("blist",ja);
		return "board/P_announcement";
	}
}
