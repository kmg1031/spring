package org.spring.dto;

import java.sql.Timestamp;

public class FileDTO{
	private String fileName;
	private String filePath;
	private long fileByte;
	private Timestamp fileUpTime;
	public FileDTO(String fileName, String filePath, long fileByte, Timestamp fileUpTime) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileByte = fileByte;
		this.fileUpTime = fileUpTime;
	}
	public FileDTO(String fileName, String filePath, long fileByte) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileByte = fileByte;
	}
	public FileDTO() {
		super();
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileByte() {
		return fileByte;
	}
	public void setFileByte(long fileByte) {
		this.fileByte = fileByte;
	}
	public Timestamp getFileUpTime() {
		return fileUpTime;
	}
	public void setFileUpTime(Timestamp fileUpTime) {
		this.fileUpTime = fileUpTime;
	}
	
	
}
