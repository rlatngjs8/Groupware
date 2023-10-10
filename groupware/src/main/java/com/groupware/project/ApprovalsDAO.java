package com.groupware.project;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalsDAO {
	 
	ArrayList<ApprovalsDTO> select_receipt_approval(String userid);
	ArrayList<ApprovalsDTO> select_incomplete_approval(String userid);
	ArrayList<ApprovalsDTO> select_incomplete_approval1(String userid);
	ArrayList<ApprovalsDTO> select_completion_approval(String userid);
	ArrayList<ApprovalsDTO> select_my_incomplete_approval(String userid);
	ArrayList<ApprovalsDTO> sendList(String userid);
	ArrayList<ApprovalsDTO> arrive_approval(String userid);
	
	ApprovalsDTO showDetail(int ApprovalID);

	void approvalInsert(String sender, String receiver, String approvalType, String approvalTitle, String approText);
}
