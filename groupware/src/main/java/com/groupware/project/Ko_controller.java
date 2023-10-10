package com.groupware.project;

import java.util.ArrayList;
import java.util.UUID;

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
public class Ko_controller {
	@Autowired
	private CalendarDAO cdao;
	
	@Autowired
	private ReservationDAO rdao;
	
	@Autowired
	private NoticeDAO ndao;
	
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
			jo.put("reservation", alCalendar.get(i).reservation);
			jo.put("connectionID", alCalendar.get(i).connectionID);
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
		String writer = req.getParameter("writer");
		String content = req.getParameter("contentArea");
		cdao.planInsert(title,start,end,content,writer);
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
	@GetMapping("ko_calendarDelete")	//일정 삭제하기
	public String ko_calendarDelete(HttpServletRequest req) {
		int c_num = Integer.parseInt(req.getParameter("c_no"));
		cdao.planDelete(c_num);
		return "ko_calendar";
	}
	@GetMapping("ko_reservation")
	public String ko_reservation(Model model) {
		ArrayList<MeetingroomsDTO> alMeetingrooms = rdao.getMeetingrooms();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alMeetingrooms.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomID",alMeetingrooms.get(i).roomID);
			jo.put("roomName",alMeetingrooms.get(i).roomName);
			ja.add(jo);			
		}
		ja.toJSONString();
		model.addAttribute("meetingrooms",ja);
		return "ko_reservation";
	}
	@PostMapping("reservationMeetingrooms")		//회의실 예약하기
	public String reservationMeetingrooms(HttpServletRequest req) {
		UUID uuid = UUID.randomUUID();
		String connectionID = uuid.toString();
		System.out.println(connectionID);
		HttpSession session = req.getSession(false);
		String roomName = req.getParameter("roomNameHidden");
		String start = req.getParameter("startHidden");
		String end = req.getParameter("endHidden");
		String writer = req.getParameter("writer");
		String content = req.getParameter("contentArea");
		rdao.reservationMeetingrooms(roomName,start,end,content,writer,connectionID);
		
		int roomID = Integer.parseInt(req.getParameter("roomIdHidden"));
		int reserverEmpID = (int)session.getAttribute("EmpId");
		String reservationDate = req.getParameter("startDate");
		String startTime = req.getParameter("sHourHidden");
		String endTime = req.getParameter("eHourHidden");
		System.out.println(reserverEmpID);
		rdao.reservations(roomID,reserverEmpID,reservationDate,startTime,endTime,connectionID);
		return "reservationList";
	}
	@PostMapping("/getTime")	//예약된 시간들 체크하기
	@ResponseBody
	public String getTime(HttpServletRequest req) {
		int roomId = Integer.parseInt(req.getParameter("roomId"));
		String startDate = req.getParameter("date");
		System.out.println("check:"+roomId+"+"+startDate);
		ArrayList<ReservationDTO> alReservation = rdao.getTime(roomId,startDate);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alReservation.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("reservationID",alReservation.get(i).reservationID);
			jo.put("roomID",alReservation.get(i).roomID);
			jo.put("reserverEmployeeID",alReservation.get(i).reserverEmployeeID);
			jo.put("reservationDate",alReservation.get(i).reservationDate);
			jo.put("starttime",alReservation.get(i).starttime);
			jo.put("endtime",alReservation.get(i).endtime);
			ja.add(jo);
		}
		System.out.println(ja);
		return ja.toJSONString();
	}
	@GetMapping("ko_reservationDetails")
	public String ko_reservationDetails(HttpServletRequest req, Model model) {		// 예약 상세페이지로 이동
		ArrayList<MeetingroomsDTO> alMeetingrooms = rdao.getMeetingrooms();
		JSONArray ja = new JSONArray();
		for(int i=0; i<alMeetingrooms.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("roomID",alMeetingrooms.get(i).roomID);
			jo.put("roomName",alMeetingrooms.get(i).roomName);
			ja.add(jo);			
		}
		ja.toJSONString();
		model.addAttribute("meetingrooms",ja);
		
		 String connectionID = req.getParameter("c_no");
		 System.out.println(connectionID);
		 
		 CalendarDTO cdto = cdao.getReservationDetailsC(connectionID);
		 System.out.println(cdto);
		 model.addAttribute("getDetailsC",cdto);
		 
		 ReservationDTO rdto = rdao.getReservationDetailsR(connectionID);
		 System.out.println(rdto);
		 model.addAttribute("getDetailsR", rdto);
		
		return "ko_reservationDetails";
	}
	@PostMapping("/getTimeDetails")	//예약된 시간들 체크하기
	@ResponseBody
	public String getTimeDetails(HttpServletRequest req) {
		int roomId = Integer.parseInt(req.getParameter("roomId"));
		String startDate = req.getParameter("date");
		String connectionID = req.getParameter("connectionID");
		System.out.println("check:"+roomId+"+"+startDate+"+"+connectionID);
		ArrayList<ReservationDTO> alReservation = rdao.getTimeDetails(roomId,startDate,connectionID);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alReservation.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("reservationID",alReservation.get(i).reservationID);
			jo.put("roomID",alReservation.get(i).roomID);
			jo.put("reserverEmployeeID",alReservation.get(i).reserverEmployeeID);
			jo.put("reservationDate",alReservation.get(i).reservationDate);
			jo.put("starttime",alReservation.get(i).starttime);
			jo.put("endtime",alReservation.get(i).endtime);
			jo.put("connectionID",alReservation.get(i).connectionID);
			ja.add(jo);
		}
		System.out.println(ja);
		return ja.toJSONString();
	}
	@PostMapping("/reservationUpdate")	//예약 업데이트
	public String reservationUpdate(HttpServletRequest req) {
		String roomName = req.getParameter("roomNameHidden");
		String start = req.getParameter("startHidden");
		String end = req.getParameter("endHidden");
		String content = req.getParameter("contentArea");
		String connectionID = req.getParameter("connectionIDHidden");
		rdao.reservationUpdateC(roomName,start,end,content,connectionID);
		
		int roomID = Integer.parseInt(req.getParameter("roomIdHidden"));
		String reservationDate = req.getParameter("startDate");
		String startTime = req.getParameter("sHourHidden");
		String endTime = req.getParameter("eHourHidden");
		rdao.reservationUpdateR(roomID,reservationDate,startTime,endTime,connectionID);
		return "reservationList";
	}
	@GetMapping("/reservationList")	//예약 리스트
	public String reservationList() {
		return "reservationList";
	}
	@GetMapping("/reservationDelete")	//예약 삭제하기
	public String reservationDelete(HttpServletRequest req) {
		String connectionID = req.getParameter("connectionID");
		rdao.reservationDeleteC(connectionID);
		rdao.reservationDeleteR(connectionID);
		return "reservationList";
	}
	@PostMapping("/getNewNotice")
	@ResponseBody
	public String getNewNotice(HttpServletRequest req) {
		int empID=Integer.parseInt(req.getParameter("empID"));
		ArrayList<NoticeDTO> alNotice = ndao.getNewNotice(empID);
		JSONArray ja = new JSONArray();
		for(int i=0; i<alNotice.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("type",alNotice.get(i).type);
			jo.put("title",alNotice.get(i).title);
			jo.put("time",alNotice.get(i).time);
			ja.add(jo);
		}	
		return ja.toJSONString();
	}
}
