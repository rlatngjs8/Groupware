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


@Controller
public class Ko_controller {
	@Autowired
	private CalendarDAO cdao;
	
	@GetMapping("ko_calendar")		//캘린더 페이지
	public String ko_calendar() {
		return "ko_calendar";
	}

	@GetMapping("/getPlan")			//DB에서 일정 불러오기
	@ResponseBody
	public String getPlan() {
		ArrayList<CalendarDTO> alCalendar = cdao.getPlan();		
		JSONArray ja = new JSONArray();
		for(int i=0; i<alCalendar.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("calendar_no",alCalendar.get(i).calendar_no);
			jo.put("calendar_title", alCalendar.get(i).calendar_title);
			jo.put("calendar_memo", alCalendar.get(i).calendar_memo);
			jo.put("calendar_start", alCalendar.get(i).calendar_start);
			jo.put("calendar_end", alCalendar.get(i).calendar_end);
			jo.put("birthday", alCalendar.get(i).birthday);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	@GetMapping("ko_addPlan")		//일정 추가페이지로 이동
	public String ko_addPlan() {
		return "ko_addPlan";
	}
	@PostMapping("planInsert")		//일정 추가하기
	public String planInsert(HttpServletRequest req) {
		String title = req.getParameter("ipt_tit");
		String start = req.getParameter("startHidden");
		String end = req.getParameter("endHidden");
		String content = req.getParameter("contentArea");
		cdao.planInsert(title,start,end,content);
		return "ko_calendar";
	}
	@GetMapping("ko_calendarDetails")		// 게시글 상세페이지로 이동
	public String ko_calendarDetails(HttpServletRequest req, Model model) {
		int c_num = Integer.parseInt(req.getParameter("c_no"));
		System.out.println(c_num);
		CalendarDTO cdto = cdao.getPlanDetails(c_num);
		System.out.println(cdto);
		model.addAttribute("getDetails",cdto);
		return "ko_calendarDetails";
	}
	@PostMapping("planUpdate")		//일정 수정하기
	public String planUpdate(HttpServletRequest req) {
		int c_num = Integer.parseInt(req.getParameter("c_num"));
		String title = req.getParameter("ipt_tit");
		String start = req.getParameter("startHidden");
		String end = req.getParameter("endHidden");
		String content = req.getParameter("contentArea");
		cdao.planUpdate(c_num,title,start,end,content);
		return "redirect:/ko_calendarDetails?c_no="+c_num;
	}
	@GetMapping("ko_calendarDelete")
	public String ko_calendarDelete(HttpServletRequest req) {
		int c_num = Integer.parseInt(req.getParameter("c_no"));
		cdao.planDelete(c_num);
		return "ko_calendar";
	}
}
