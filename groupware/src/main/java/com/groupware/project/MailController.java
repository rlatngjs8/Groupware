package com.groupware.project;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Configuration
@Controller
public class MailController implements WebMvcConfigurer {
//	@Override
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//    	registry.addResourceHandler("/img/**") //지금eclipse 내 사진폴더 classpath:/static
//    		.addResourceLocations("file:///C:/Users/1234/git/Groupware/groupware/src/main/resources/static/img"); //내 로컬 폴더	
//   	}
	
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
		if(receiveEmail.size()==0) {
			System.out.println(receiveEmail);
			model.addAttribute("rlist", "");
		} else {
			model.addAttribute("rlist", receiveEmail);
		}
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
	public String mailSend(HttpServletRequest req, Model model, HttpServletResponse response, MultipartFile[] uploadFile) {		
		String uploadFolder = "C:/Users/1234/git/Groupware/groupware/src/main/resources/static/img";
		File uploadPath = new File(uploadFolder); //폴더만들고 업로드
		if(uploadPath.exists() == false) {//폴더 없을 시에만 폴더생성.
			uploadPath.mkdirs();
		}
		//
		String subject = req.getParameter("mailTitle");
		String content = req.getParameter("mailContent");
		HttpSession s = req.getSession();
		int senderEmployeeID = (Integer) s.getAttribute("empID");
		String receiverEmail = req.getParameter("receiverEmail");
		MailDTO mdto = mdao.selectEmpEmail(receiverEmail); //이메일값을 받아서 이메일값으로 사원아이디를추적하여 최종적으로 insert해야함.
		int eid = mdao.selectMaxemailid();
		
		String uploadFileName = "";
		String attachment1=""; String attachment2=""; String attachment3="";
		if(uploadFile!=null) {
			for(int i=0;i<uploadFile.length; i++) {
				uploadFileName = uploadFile[i].getOriginalFilename(); //파일이름	
				if(i==0) {
					try {
						attachment1 = (eid+1)+"_"+i+"."+uploadFileName;
						System.out.println(attachment1);
						attachment1 = URLEncoder.encode(attachment1, "UTF-8"); //16진수로
						System.out.println(attachment1);
						uploadFileName = attachment1;
					}  catch (UnsupportedEncodingException e1) {
			            e1.printStackTrace();
			        }
				}
				if(i==1) {
					try {
						attachment2 = (eid+1)+"_"+i+"."+uploadFileName;
						System.out.println(attachment2);
						attachment2 = URLEncoder.encode(attachment2, "UTF-8"); //16진수로
						System.out.println(attachment2);
						uploadFileName = attachment2;
					}  catch (UnsupportedEncodingException e1) {
			            e1.printStackTrace();
			        }
				}
				if(i==2) {
					try {
						attachment3 = (eid+1)+"_"+i+"."+uploadFileName;
						System.out.println(attachment3);
						attachment3 = URLEncoder.encode(attachment3, "UTF-8"); //16진수로
						System.out.println(attachment3);
						uploadFileName = attachment3;
					}  catch (UnsupportedEncodingException e1) {
			            e1.printStackTrace();
			        }
				}
				File saveFile = new File(uploadPath, uploadFileName); //(파일위치, 파일이름) 파일 객체 생성.
				try{
					uploadFile[i].transferTo(saveFile); //파일저장
				} catch (Exception e) { //transferTo는 try-catch사용.
					e.printStackTrace();
				}	
			}	
		}
		
		//receiver 받는사람 정보//
		int recID = mdto.getEmployeeid();
//		String recName = mdto.getName();
//		int recDpartID = mdto.getDepartmentid();
//		String recPosition = mdto.getPosition();
//		String recEmail = mdto.getEmail();
//		System.out.println(empID+","+empName+","+DpartID+","+empPosition+","+empEmail);
		////
		
		//임시
		mdao.insertEmails(subject, content, senderEmployeeID, recID,
				attachment1, attachment2, attachment3);
		
		return "mailFolder1";
	}
	@GetMapping("/mailDetail")
	public String mailDetail(HttpServletRequest req, Model model) {
		sessionL(req);
		int emailid = Integer.parseInt(req.getParameter("eid"));
//		System.out.println(emailid);
		MailDTO detailMail = mdao.selectDetailMail(emailid);
		model.addAttribute("dmail", detailMail);
		MailDTO detailMail2 = mdao.selectSenderName(emailid);
		model.addAttribute("dmail2", detailMail2);
		String C1 = ""; String C2 = ""; String C3 = "";
        try {
        	C1 = URLDecoder.decode(detailMail.getAttachment1(), "UTF-8");
        	C2 = URLDecoder.decode(detailMail.getAttachment2(), "UTF-8");
        	C3 = URLDecoder.decode(detailMail.getAttachment3(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        model.addAttribute("C1", C1);
        model.addAttribute("C2", C2);
        model.addAttribute("C3", C3);
		return "email/mailDetail";
	}
}
