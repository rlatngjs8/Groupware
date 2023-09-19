package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MailDAO {
	MailDTO selectEmpEmail(String email);
	int insertEmails(String subject,String content,int senderemployeeid,int receiveremployeeid,
			String attachment1,String attachment2,String attachment3);
	ArrayList<MailDTO> selectRecMail(int receiveremployeeid);
}
