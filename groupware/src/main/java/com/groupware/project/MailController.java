package com.groupware.project;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Locale;

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
	
	int mpageStart, mpageSize, mailPno, pageCnt;
	
	@Autowired
	private MailDAO mdao;
	
//	public static void sessionL(HttpServletRequest req) {
//		//로그인임시
//		HttpSession s = req.getSession();
//		s.setAttribute("empID", 85);
//		//로그인임시
//	}
	public void sessionL(HttpServletRequest req) {
		HttpSession s = req.getSession();
		String userid = (String) s.getAttribute("userid");
		int eid = mdao.selectEmpid(userid);
		s.setAttribute("empID", eid);
	}
	public void page(HttpServletRequest req, Model model) {
		sessionL(req);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		
		String page = req.getParameter("pageno");
		if(page==null || page.equals("")) {
			page="1";
		}
		mailPno = Integer.parseInt(page);
		mpageStart = (mailPno-1)*15;
		mpageSize = 15;
	}
	
	@GetMapping("/mailFolder1")
	public String mailFolder1(HttpServletRequest req, Model model) {
		sessionL(req);
		page(req,model);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		
		int cnt=mdao.selectReceiverEmailscnt(eid); //전체 메일 수
		int pagecount = (int) Math.ceil(cnt/15.0); 
		pageCnt = pagecount;
		int totalpage = (int) Math.ceil(pagecount/5.0);
		ArrayList<MailDTO> receiveEmail = mdao.selectRecMail(eid,mpageStart,mpageSize);
		
		String pagestr = "";
	
		if(mailPno<4) {
			for(int i=1; i<=pagecount; i++) {
				if(i>5) {
					break;
				}
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder1?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		} else {
			for(int i=mailPno-2; i<=mailPno+2; i++) {
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder1?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("pageno",mailPno);
		model.addAttribute("pagecnt",pagecount);
		
		if(receiveEmail.size()==0) {
			model.addAttribute("rlist", "");
		} else {
			model.addAttribute("rlist", receiveEmail);
		}
		s.setAttribute("rs", "receive");
		return "email/mailFolder1";
	}
	@PostMapping("/mailNext")
	@ResponseBody
	public String mailNext(HttpServletRequest req, Model model) {
		sessionL(req);
		if(mailPno==pageCnt) {
			return "noMove";
		}
		mailPno = mailPno + 1;
		String nowPno = Integer.toString(mailPno);
		return nowPno;
	}
	@PostMapping("/mailPrev")
	@ResponseBody
	public String mailPrev(HttpServletRequest req, Model model) {
		sessionL(req);
		if(mailPno==1) {
			return "noMove";
		}
		mailPno = mailPno - 1;
		String nowPno = Integer.toString(mailPno);
		return nowPno;
	}
	@GetMapping("/mailFolder2")
	public String mailFolder2(HttpServletRequest req, Model model) {
		sessionL(req);
		page(req,model);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		
		int cnt=mdao.selectSenderEmailscnt(eid); //전체 메일 수
		int pagecount = (int) Math.ceil(cnt/15.0); 
		pageCnt = pagecount;
		int totalpage = (int) Math.ceil(pagecount/5.0);
		ArrayList<MailDTO> sendEmail = mdao.selectSendMail(eid,mpageStart,mpageSize);
		
		String pagestr = "";
	
		if(mailPno<4) {
			for(int i=1; i<=pagecount; i++) {
				if(i>5) {
					break;
				}
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder2?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		} else {
			for(int i=mailPno-2; i<=mailPno+2; i++) {
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder2?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("pageno",mailPno);
		model.addAttribute("pagecnt",pagecount);
		
		if(sendEmail.size()==0) {
			model.addAttribute("rlist", "");
		} else {
			model.addAttribute("rlist", sendEmail);
		}
		s.setAttribute("rs", "send");
		return "email/mailFolder2";
	}
	@GetMapping("/trashcanFolder")
	public String trashcanFolder(HttpServletRequest req, Model model) {
		sessionL(req);
		page(req,model);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		
		int cnt=mdao.selectTrashCancnt(eid);
		int pagecount = (int) Math.ceil(cnt/15.0); 
		pageCnt = pagecount;
		int totalpage = (int) Math.ceil(pagecount/5.0);
		ArrayList<MailDTO> trashcan = mdao.selectTrashCanMail(eid,mpageStart,mpageSize);
		String pagestr = "";
	
		if(mailPno<4) {
			for(int i=1; i<=pagecount; i++) {
				if(i>5) {
					break;
				}
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/trashcanFolder?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		} else {
			for(int i=mailPno-2; i<=mailPno+2; i++) {
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/trashcanFolder?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("pageno",mailPno);
		model.addAttribute("pagecnt",pagecount);
		
		if(trashcan.size()==0) {
			model.addAttribute("rlist", "");
		} else {
			model.addAttribute("rlist", trashcan);
		}
		s.setAttribute("rs", "trash");
		model.addAttribute("eid", eid);
		return "email/trashcanFolder";
	}
	@GetMapping("/mailMark")
	public String mailMark(HttpServletRequest req, Model model) {
		sessionL(req);
		page(req,model);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		
		int cnt=mdao.selectMarkcnt(eid); //전체 메일 수
		int pagecount = (int) Math.ceil(cnt/15.0); 
		pageCnt = pagecount;
		int totalpage = (int) Math.ceil(pagecount/5.0);
		ArrayList<MailDTO> markEmail = mdao.selectMarkMail(eid,mpageStart,mpageSize);
		
		String pagestr = "";
	
		if(mailPno<4) {
			for(int i=1; i<=pagecount; i++) {
				if(i>5) {
					break;
				}
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder1?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		} else {
			for(int i=mailPno-2; i<=mailPno+2; i++) {
				if(mailPno==i) {
					pagestr+="&nbsp;<label>"+i+"</label>&nbsp;";
				} else {
					pagestr+="&nbsp;<a href='/mailFolder1?pageno="+i+"' style='color:lightgray; text-decoration-line:none;'>"+i+"</a>&nbsp;";
				}
			}
		}
		model.addAttribute("pagestr",pagestr);
		model.addAttribute("pageno",mailPno);
		model.addAttribute("pagecnt",pagecount);
		
		if(markEmail.size()==0) {
			model.addAttribute("rlist", "");
		} else {
			model.addAttribute("rlist", markEmail);
		}
		s.setAttribute("rs", "mark");
		model.addAttribute("eid", eid);
		return "email/mailMark";
	}
	@PostMapping("/rsMark")
	@ResponseBody
	public String rsMark(HttpServletRequest req, Model model) {
		int emailid = Integer.parseInt(req.getParameter("emailid"));
		String now = req.getParameter("now");
		int rmark = Integer.parseInt(req.getParameter("rmark"));
		String now2 = req.getParameter("now2");
//		System.out.println(emailid+", "+now);
		if(now.equals("receive")) {
			if (rmark==1) {
				mdao.updateReceiveMark0(emailid);
			} else if (rmark==0) {
				mdao.updateReceiveMark1(emailid);	
			}
			return "receive";
		} else if(now.equals("send")){
			if (rmark==1) {
				mdao.updateSendMark0(emailid);
			} else if (rmark==0) {
				mdao.updateSendMark1(emailid);	
			}
			return "send";
		} else if (now.equals("mark")) {
//			System.out.println("A");
			if (now2.equals("mR")) {
//				System.out.println("B");
				if (rmark==1) {
					mdao.updateReceiveMark0(emailid);
				} else if (rmark==0) {
					mdao.updateReceiveMark1(emailid);	
				}
			} else if (now2.equals("mS")) {
//				System.out.println("C");
				if (rmark==1) {
					mdao.updateSendMark0(emailid);
				} else if (rmark==0) {
					mdao.updateSendMark1(emailid);	
				}
			}
			return "mark";
		} else if (now.equals("trash")) {
			if (now2.equals("tR")) {
				if (rmark==1) {
					mdao.updateReceiveMark0(emailid);
				} else if (rmark==0) {
					mdao.updateReceiveMark1(emailid);	
				}
			} else if (now2.equals("tS")) {
				if (rmark==1) {
					mdao.updateSendMark0(emailid);
				} else if (rmark==0) {
					mdao.updateSendMark1(emailid);	
				}
			}
			return "trash";
		}
		return "";
	}
	@GetMapping("/mailWrite")
	public String mailWrite(HttpServletRequest req, Model model) {
		sessionL(req);
		HttpSession s = req.getSession();
		s.setAttribute("mdAnswer_email", "");
		s.setAttribute("mdAnswer_subject", "");
		s.setAttribute("mdAnswer_content", "");
		s.setAttribute("mdAnswer_content2", "");
		return "email/mailWrite";
	}
	@GetMapping("/mailWrite2")
	public String mailWrite2(HttpServletRequest req, Model model) {
		sessionL(req);
		HttpSession s = req.getSession();
		String email = (String) s.getAttribute("mdAnswer_email");
		String subject = (String) s.getAttribute("mdAnswer_subject");
		String content = (String) s.getAttribute("mdAnswer_content");
		String content2 = (String) s.getAttribute("mdAnswer_content2");
		model.addAttribute("email",email);
		model.addAttribute("subject", subject);
		model.addAttribute("content", content);
		model.addAttribute("content2", content2);
		return "email/mailWrite";
	}
	@PostMapping("/mdAnswer")
	@ResponseBody
	public String mdAnswer(HttpServletRequest req, Model model) {
		sessionL(req);
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String email2 = req.getParameter("email2");
		String emailDate = req.getParameter("emailDate");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		HttpSession s = req.getSession();
		String content2 = "--- Original Message ---&#13;&#10;From : "+name+"&#13;&#10;"
					+"To : "+email2+"&#13;&#10;"
					+"Date : "+emailDate+"&#13;&#10;"
					+"Subject : "+subject+"&#13;&#10;";
		s.setAttribute("mdAnswer_email", email);
		s.setAttribute("mdAnswer_subject", subject);
		s.setAttribute("mdAnswer_content", content);
		s.setAttribute("mdAnswer_content2", content2);
		return "email/mailWrite";
	}
	@PostMapping("/mailSend")
	@ResponseBody
	public String mailSend(HttpServletRequest req, Model model, HttpServletResponse response, MultipartFile[] uploadFile) {		
		String uploadFolder = "C:/Users/1234/git/Groupware/groupware/src/main/resources/static/mailImg";
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
		String receiverEmail2[] = receiverEmail.split(" ");

		int eid = mdao.selectMaxemailid();
		
		String uploadFileName = "";
		String attachment1=""; String attachment2=""; String attachment3="";
		if(uploadFile!=null) {
			for(int i=0;i<uploadFile.length; i++) {
				uploadFileName = uploadFile[i].getOriginalFilename(); //파일이름	
				if(i==0) {
					try {
						attachment1 = (eid+1)+"_"+i+"."+uploadFileName;
						attachment1 = URLEncoder.encode(attachment1, "UTF-8"); //16진수로
						uploadFileName = attachment1;
					}  catch (UnsupportedEncodingException e1) {
			            e1.printStackTrace();
			        }
				}
				if(i==1) {
					try {
						attachment2 = (eid+1)+"_"+i+"."+uploadFileName;
						attachment2 = URLEncoder.encode(attachment2, "UTF-8"); //16진수로
						uploadFileName = attachment2;
					}  catch (UnsupportedEncodingException e1) {
			            e1.printStackTrace();
			        }
				}
				if(i==2) {
					try {
						attachment3 = (eid+1)+"_"+i+"."+uploadFileName;
						attachment3 = URLEncoder.encode(attachment3, "UTF-8"); //16진수로
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
		
		for(int i=0; i<receiverEmail2.length;i++) {
			MailDTO mdto = mdao.selectEmpEmail(receiverEmail2[i]);
			//receiver 받는사람 정보//
			int recID = mdto.getEmployeeid();
			if(receiverEmail2.length==1) {
				mdao.insertEmails(subject, content, senderEmployeeID, recID,
						attachment1, attachment2, attachment3,0);
			} else {
				mdao.insertEmails(subject, content, senderEmployeeID, recID,
						attachment1, attachment2, attachment3,eid+1);
			}
		}	
		return "mailFolder1";
	}
	
	@PostMapping("/mailRead")
	@ResponseBody
	public void mailRead(HttpServletRequest req, Model model) {
		String mlist = req.getParameter("mailChklist");
		mlist = mlist.replace("[","").replace("]","").replace("\"","");
		String[] mlist2 = mlist.split(",");
		int emailid;
		
		String now = req.getParameter("now");
		String mtChklist = req.getParameter("mtChklist");
		mtChklist = mtChklist.replace("[","").replace("]","").replace("\"","");
		String[] mtChklist2 = mtChklist.split(",");
		
		if (now.equals("receive")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailReceive1(emailid);
			}
		} else if (now.equals("send")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailSend1(emailid);	
			}
		} else if (now.equals("mark")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("mR")) {
					mdao.updateEmailReceive1(emailid);	
				} else if (mtChklist2[i].equals("mS")) {
					mdao.updateEmailSend1(emailid);	
				}
			}
		} else if (now.equals("trash")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("tR")) {
					mdao.updateEmailReceive1(emailid);	
				} else if (mtChklist2[i].equals("tS")) {
					mdao.updateEmailSend1(emailid);	
				}
			}
		} 
	}
	@PostMapping("/mailNotRead")
	@ResponseBody
	public void mailNotRead(HttpServletRequest req, Model model) {
		String mlist = req.getParameter("mailChklist");
		mlist = mlist.replace("[","").replace("]","").replace("\"","");
		String[] mlist2 = mlist.split(",");
		int emailid;
		
		String now = req.getParameter("now");
		String mtChklist = req.getParameter("mtChklist");
		mtChklist = mtChklist.replace("[","").replace("]","").replace("\"","");
		String[] mtChklist2 = mtChklist.split(",");
		
		if (now.equals("receive")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailReceive0(emailid);	
			}
		} else if (now.equals("send")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailSend0(emailid);	
			}
		} else if (now.equals("mark")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("mR")) {
					mdao.updateEmailReceive0(emailid);	
				} else if (mtChklist2[i].equals("mS")) {
					mdao.updateEmailSend0(emailid);	
				}
			}
		} else if (now.equals("trash")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("tR")) {
					mdao.updateEmailReceive0(emailid);	
				} else if (mtChklist2[i].equals("tS")) {
					mdao.updateEmailSend0(emailid);	
				}
			}
		} 
	}
	@PostMapping("/mailDelete")
	@ResponseBody
	public void mailDelete(HttpServletRequest req, Model model) {
		String mlist = req.getParameter("mailChklist");
		mlist = mlist.replace("[","").replace("]","").replace("\"","");
		String[] mlist2 = mlist.split(",");
		int emailid;
		
		String now = req.getParameter("now");
		String mtChklist = req.getParameter("mtChklist");
		mtChklist = mtChklist.replace("[","").replace("]","").replace("\"","");
		String[] mtChklist2 = mtChklist.split(",");
		
		if (now.equals("receive")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailReceive2(emailid);	
			}
		} else if (now.equals("send")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				mdao.updateEmailSend2(emailid);	
			}
		} else if (now.equals("mark")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("mR")) {
					mdao.updateEmailReceive2(emailid);	
				} else if (mtChklist2[i].equals("mS")) {
					mdao.updateEmailSend2(emailid);	
				}
			}
		}  else if (now.equals("trash")) {
			for(int i=0; i<mlist2.length;i++) {
				emailid = Integer.parseInt(mlist2[i]);
				if (mtChklist2[i].equals("tR")) {
					mdao.updateEmailReceive3(emailid);	
				} else if (mtChklist2[i].equals("tS")) {
					mdao.updateEmailSend3(emailid);	
				}
			}
		} 
	}
	@PostMapping("/mailReadUpdate")
	@ResponseBody
	public void mailReadUpdate(HttpServletRequest req, Model model) {
		HttpSession s = req.getSession();
		int emailid = Integer.parseInt(req.getParameter("eid"));
		String now = req.getParameter("now");
		String now2 = req.getParameter("now2");
		if (now.equals("receive")) {
			mdao.updateEmailReceive1(emailid);
		} else if (now.equals("send")) {
			mdao.updateEmailSend1(emailid);
		} else if (now.equals("mark")) {
			if (now2.equals("mR")) {
				mdao.updateEmailReceive1(emailid);
				s.setAttribute("trs", "mR");
			} else if (now2.equals("mS")) {
				mdao.updateEmailSend1(emailid);	
				s.setAttribute("trs", "mS");
			}
		} else if (now.equals("trash")) {
			if (now2.equals("tR")) {
				mdao.updateEmailReceive1(emailid);
				s.setAttribute("trs", "tR");
			} else if (now2.equals("tS")) {
				mdao.updateEmailSend1(emailid);	
				s.setAttribute("trs", "tS");
			}
		} 

	}
	@GetMapping("/mailDetail")
	public String mailDetail(HttpServletRequest req, Model model) {
		sessionL(req);
		HttpSession s = req.getSession();
		int emailid = Integer.parseInt(req.getParameter("eid"));

		MailDTO detailMail = mdao.selectDetailMail(emailid);
		int ms = detailMail.getMultiplesend();
		
		ArrayList<MailDTO> multipleEmail2 = new ArrayList<MailDTO>();
		
		if(ms!=0) {
			ArrayList<MailDTO> multipleEid = mdao.selectmultipleEid(ms);
			for(int i=0; i<multipleEid.size(); i++) {
				int multipleEid2 = multipleEid.get(i).getReceiveremployeeid();
				MailDTO multipleEmail = mdao.selectmultipleEmail(multipleEid2);
				multipleEmail2.add(multipleEmail);
			}
			model.addAttribute("dlist", multipleEmail2);
		} else {
			model.addAttribute("dlist", "");
			model.addAttribute("dmail", detailMail);
		}
		
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
        
        String stime = detailMail.getSendtime();
        String time = stime.substring(11,16);
        String time3 = stime.substring(13,16);;
        int time2 = Integer.parseInt(time.substring(0,2));
        if(time2>12) {
        	time2 = time2 % 12;
        	time="오후 "+time2+time3;
        	
        } else {
        	time="오전 "+time;
        }
        
        stime = stime.substring(0,10); //날짜까지만
        String[] stime2 =stime.split("-");
        int ldate0 = Integer.parseInt(stime2[0]);
        int ldate1 = Integer.parseInt(stime2[1]);
        int ldate2 = Integer.parseInt(stime2[2]);

        LocalDate date = LocalDate.of(ldate0, ldate1, ldate2);
        DayOfWeek dayOfWeek = date.getDayOfWeek();
        int dayOfWeekNumber = dayOfWeek.getValue();
        
        String down = dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN);
        model.addAttribute("date",stime+" ("+down+") "+time);
        String rs = (String) s.getAttribute("rs");
        model.addAttribute("rs",rs);
        String trs = (String) s.getAttribute("trs");
        model.addAttribute("trs",trs);
		return "email/mailDetail";
	}
	@PostMapping("/mdDelete")
	@ResponseBody
	public void mdDelete(HttpServletRequest req, Model model) {
		int emailid = Integer.parseInt(req.getParameter("emailid"));
		String now = req.getParameter("now");
		String now2 = req.getParameter("now2");
		if (now.equals("receive")) {
			mdao.updateEmailReceive2(emailid);	
		} else if (now.equals("send")) {
			mdao.updateEmailSend2(emailid);	
		} else if (now.equals("mark")) {
			if (now2.equals("mR")) {
				mdao.updateEmailReceive2(emailid);	
				model.addAttribute("trs","");
			} else if (now2.equals("mS")) {
				mdao.updateEmailSend2(emailid);	
				model.addAttribute("trs","");
			}
		} else if (now.equals("trash")) {
			if (now2.equals("tR")) {
				mdao.updateEmailReceive3(emailid);	
				model.addAttribute("trs","");
			} else if (now2.equals("tS")) {
				mdao.updateEmailSend3(emailid);	
				model.addAttribute("trs","");
			}
		} 

	}
	@PostMapping("/pHeaderAlarm")
	@ResponseBody
	public int pHeaderAlarm(HttpServletRequest req, Model model) {
		sessionL(req);
		HttpSession s = req.getSession();
		int eid = (Integer) s.getAttribute("empID");
		int cnt = mdao.selectemailAlarmcnt(eid);
//		System.out.println(cnt+"A");
		return cnt;
	}
}
