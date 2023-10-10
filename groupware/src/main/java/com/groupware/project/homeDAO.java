package com.groupware.project;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface homeDAO {
	ArrayList<P_BoardDTO> gethomealist();

	ArrayList<MailDTO> selectSendMail(int senderemployeeid);
	ArrayList<MailDTO> selectRecMail(int receiveremployeeid);
	ArrayList<MailDTO> selectImportantMail(int employeeid);
	ArrayList<P_BoardDTO> gethomewlist();
	ArrayList<MailDTO> getboardlist();
}
