package com.groupware.project;

public class P_BoardDTO {
	
	Integer CommunityID;
	String CommunityTitle;
	Integer AuthorEmployeeID;
	String Content;
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
	public Integer getAuthorEmployeeID() {
		return AuthorEmployeeID;
	}
	public void setAuthorEmployeeID(Integer authorEmployeeID) {
		AuthorEmployeeID = authorEmployeeID;
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
	


}
