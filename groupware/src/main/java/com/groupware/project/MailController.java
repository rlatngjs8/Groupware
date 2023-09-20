package com.groupware.project;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MailController {
	@Autowired
	private MailDAO mdao;
	
	public static void sessionL(HttpServletRequest req) {
		//로그인임시
		HttpSession s = req.getSession();
		s.setAttribute("empID", 17);
		//로그인임시
	}
	
	@GetMapping("/mailFolder0")
	public String mailFolder0(HttpServletRequest req, Model model) {
		sessionL(req);
		return "email/mailFolder0";
	}
	@GetMapping("/mailFolder1")
	public String mailFolder1(HttpServletRequest req, Model model) {
		sessionL(req);
		//로그인임시
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시
		ArrayList<MailDTO> receiveEmail = mdao.selectRecMail(eid);
//		System.out.println(receiveEmail.size());
//		System.out.println(receiveEmail.get(0).getSenderemployeeid());
		model.addAttribute("rlist", receiveEmail);
//		MailDTO senderName = selectSenderName();

		return "email/mailFolder1";
	}
	@GetMapping("/mailFolder2")
	public String mailFolder2(HttpServletRequest req, Model model) {
		sessionL(req);
		//로그인임시
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		//로그인임시

		return "email/mailFolder2";
	}
	
	@GetMapping("/mailWrite")
	public String mailWrite(HttpServletRequest req, Model model) {
		sessionL(req);
		return "email/mailWrite";
	}
//	@PostMapping("/mailSend")
//	@ResponseBody
//	public String mailSend(HttpServletRequest req, Model model) {
//		String subject = req.getParameter("subject");
//		String content = req.getParameter("content");
////		int senderEmployeeID = Integer.parseInt(req.getParameter("senderEmployeeID"));
//		HttpSession s = req.getSession();
//		int senderEmployeeID = (Integer) s.getAttribute("empID");
//		String receiverEmail = req.getParameter("receiverEmail");
//		MailDTO mdto = mdao.selectEmpEmail(receiverEmail); //이메일값을 받아서 이메일값으로 사원아이디를추적하여 최종적으로 insert해야함.
//		
//		//receiver 받는사람 정보//
//		int recID = mdto.getEmployeeid();
//		String recName = mdto.getName();
//		int recDpartID = mdto.getDepartmentid();
//		String recPosition = mdto.getPosition();
//		String recEmail = mdto.getEmail();
////		System.out.println(empID+","+empName+","+DpartID+","+empPosition+","+empEmail);
//		////
//		
//		//임시
//		String attachment1="";
//		String attachment2="";
//		String attachment3="";
//		mdao.insertEmails(subject, content, senderEmployeeID, recID,
//				attachment1, attachment2, attachment3);
//		return "mailFolder1";
//	}
	@PostMapping("/mailSend")
	@ResponseBody
	public String mailSend(HttpServletRequest req, Model model, MultipartFile[] uploadFile) {		
		String uploadFolder = "C:/Users/1234/git/Groupware/groupware/src/main/resources/static/img";
//		File uploadPath = new File(uploadFolder); //폴더만들고 업로드
//		if(uploadPath.exists() == false) {//폴더 없을 시에만 폴더생성.
//			uploadPath.mkdirs();
//		}
		//
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		HttpSession s = req.getSession();
		int senderEmployeeID = (Integer) s.getAttribute("empID");
		String receiverEmail = req.getParameter("receiverEmail");
		MailDTO mdto = mdao.selectEmpEmail(receiverEmail); //이메일값을 받아서 이메일값으로 사원아이디를추적하여 최종적으로 insert해야함.
		//
		
		//0919
//		String uploadFileName = "";
//		String file = "";
//		for(int i=0;i<uploadFile.length; i++) {
//			String fileType = uploadFile[i].getContentType(); //image/png or image/jpeg.
//			fileType = fileType.substring(fileType.lastIndexOf("/")+1); // 마지막 /의 위치를 찾고, 그것을 기준으로 자르기
//			uploadFileName = senderEmployeeID+"_"+i+"_"+subject+"_"+"."+fileType; //파일이름
//			file += "<img src='../img/product/image/"+uploadFileName+"' class='pImg'>";
//			File saveFile2 = new File(uploadFolder, uploadFileName); //(파일위치, 파일이름) 파일 객체 생성.
//			try{
//				uploadFile[i].transferTo(saveFile2); //파일저장
//			} catch (Exception e) { //transferTo는 try-catch사용.
//				e.printStackTrace();
//			}
//		}
		
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
	@GetMapping("/mailDetail")
	public String mailDetail(HttpServletRequest req, Model model) {
		sessionL(req);
		int emailid = Integer.parseInt(req.getParameter("eid"));
		System.out.println(emailid);
		MailDTO detailMail = mdao.selectDetailMail(emailid);
		model.addAttribute("dmail", detailMail);
		return "email/mailDetail";
	}
}
