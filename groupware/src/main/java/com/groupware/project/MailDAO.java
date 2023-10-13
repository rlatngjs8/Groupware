package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailDAO {
	int selectEmpid(String userid);
	MailDTO selectEmpEmail(String email);
	int selectEmpEmail2(String email);
	int insertEmails(String subject,String content,int senderemployeeid,int receiveremployeeid,
			String attachment1,String attachment2,String attachment3,int multiplesend);
	ArrayList<MailDTO> selectRecMail(int receiveremployeeid, int limit1, int limit2);
	ArrayList<MailDTO> selectSendMail(int senderemployeeid, int limit1, int limit2);
	ArrayList<MailDTO> selectTrashCanMail(int employeeid, int limit1, int limit2);
	ArrayList<MailDTO> selectMarkMail(int employeeid, int limit1, int limit2);

	int selectemailAlarmcnt(int receiveremployeeid);
	MailDTO selectDetailMail(int emailid);
	MailDTO selectSenderName(int emailid);
	ArrayList<MailDTO> selectmultipleEid(int multiplesend);
	MailDTO selectmultipleEmail(int employeeid);
	int selectmetomecnt(int emailid);
	int selectMaxemailid();
	int selectMaxemailid2(int employeeid);
	void updateEmailReceive0(int emailid);
	void updateEmailReceive1(int emailid);
	void updateEmailReceive2(int emailid);
	void updateEmailReceive3(int emailid);
	void updateEmailSend0(int emailid);
	void updateEmailSend1(int emailid);
	void updateEmailSend2(int emailid);
	void updateEmailSend3(int emailid);
	void updateReceiveMark0(int emailid);
	void updateReceiveMark1(int emailid);
	void updateSendMark0(int emailid);
	void updateSendMark1(int emailid);
	int selectmyMarkCount(int emailid);
	
	int selectReceiverEmailscnt(int eid);
	int selectSenderEmailscnt(int eid);
	int selectTrashCancnt(int eid);
	int selectMarkcnt(int eid);

}
