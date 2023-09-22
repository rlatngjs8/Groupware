package com.groupware.project;

/**
 * 
 */
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
	int CommentID;
	String Comment;
	String Comment_Date;
	String Comment_Name;
	String Comment_Position;
	String CmtAuthorID;
	
	
	public String getCmtAuthorID() {
		return CmtAuthorID;
	}
	public void setCmtAuthorID(String cmtAuthorID) {
		CmtAuthorID = cmtAuthorID;
	}
	public int getCommentID() {
		return CommentID;
	}
	public void setCommentID(int commentID) {
		CommentID = commentID;
	}
	public String getComment_Position() {
		return Comment_Position;
	}
	public void setComment_Position(String comment_Position) {
		Comment_Position = comment_Position;
	}
	public String getComment_Name() {
		return Comment_Name;
	}
	public void setComment_Name(String comment_Name) {
		Comment_Name = comment_Name;
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
