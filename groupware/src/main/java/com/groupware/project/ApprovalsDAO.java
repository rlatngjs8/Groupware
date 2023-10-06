package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalsDAO {
	
	ArrayList<ApprovalsDTO> select_receipt_approval(String userid);
	ArrayList<ApprovalsDTO> select_incomplete_approval(String userid);
	ArrayList<ApprovalsDTO> select_completion_approval(String userid);

}
