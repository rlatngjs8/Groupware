package com.groupware.project;

public class P_BoardDTO {
	
	Integer CommunityID;
	String CommunityTitle;
	String Userid;
	String Content;
	String Position;
	String Name;
	int Views;
	int Likes;
	String CreatedTime;
	public Integer getCommunityID() {
		return CommunityID;
	}
	public void setCommunityID(Integer communityID) {
		CommunityID = communityID;
	}

	public String getCommunityTitle() {
		return CommunityTitle;
	}
	public void setCommunityTitle(String communityTitle) {
		CommunityTitle = communityTitle;
	}
	public String getUserid() {
		return Userid;
	}
	public void setUserid(String userid) {
		Userid = userid;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getViews() {
		return Views;
	}
	public void setViews(int views) {
		Views = views;
	}
	public int getLikes() {
		return Likes;
	}
	public void setLikes(int likes) {
		Likes = likes;
	}
	public String getCreatedTime() {
		return CreatedTime;
	}
	public void setCreatedTime(String createdTime) {
		CreatedTime = createdTime;
	}
	
	public String getPosition() {
		return Position;
	}
	public void setPosition(String position) {
		Position = position;
	}
	

	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}

	String Comment_Userid;
	String Comment;
	String Comment_Date;
	public String getComment_Userid() {
		return Comment_Userid;
	}
	public void setComment_Userid(String comment_Userid) {
		Comment_Userid = comment_Userid;
	}
	
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public String getComment_Date() {
		return Comment_Date;
	}
	public void setComment_Date(String comment_Date) {
		Comment_Date = comment_Date;
	}
	


}
