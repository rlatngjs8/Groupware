package com.groupware.project;

public class DocumentDTO {
	int documentID;
	String documentTitle;
	String writer;
	String fileType;
	int fileSize;
	String createdTime;
	String storageType;
	String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDocumentID() {
		return documentID;
	}
	public void setDocumentID(int documentID) {
		this.documentID = documentID;
	}
	public String getDocumentTitle() {
		return documentTitle;
	}
	public void setDocumentTitle(String documentTitle) {
		this.documentTitle = documentTitle;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}
	public String getStorageType() {
		return storageType;
	}
	public void setStorageType(String storageType) {
		this.storageType = storageType;
	}
	
	
	
}
