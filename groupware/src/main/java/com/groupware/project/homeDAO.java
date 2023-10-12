package com.groupware.project;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface homeDAO {
	ArrayList<homeDTO> gethomealist();
	ArrayList<homeDTO> getboardlist();
	ArrayList<homeDTO> selectSendMail(int senderemployeeid);
	ArrayList<homeDTO> selectRecMail(int receiveremployeeid);
	ArrayList<homeDTO> selectImportantMail(int employeeid);
	ArrayList<homeDTO> getWapplist(String employeeid);
	ArrayList<homeDTO> getSapplist(String employeeid);
	ArrayList<homeDTO> getRapplist(String employeeid);
	
	
	ArrayList<homeDTO> getSearchAnnouncement(String search);
	ArrayList<homeDTO> getSearchBoard(String search);
	
	ArrayList<homeDTO> getSearchReceiveMail(int empid, String search);
	ArrayList<homeDTO> getSearchSendMail(int empid, String search);
	ArrayList<homeDTO> getSearchImportantMail(int empid, String search);
	
	ArrayList<homeDTO> getSearchWaitApproval(String userid, String search);
	ArrayList<homeDTO> getSearchSendApproval(String userid, String search);
	ArrayList<homeDTO> getSearchReceiveApproval(String userid, String search);
	
	ArrayList<homeDTO> getSearchcalendar(String search);
}
