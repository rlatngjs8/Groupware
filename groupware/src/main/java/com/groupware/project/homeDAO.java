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
}
