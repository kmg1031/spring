package org.spring.dto;

import java.sql.Timestamp;

public class BookRecordDTO {
	private int no;
	private String userId;
	private String bookCood;
	private String bookAction;
	private Timestamp bookOutTs;
	private Timestamp bookInTs;
	public BookRecordDTO(int no, String userId, String bookCood, String bookAction, Timestamp bookOutTs,
			Timestamp bookInTs) {
		this.no = no;
		this.userId = userId;
		this.bookCood = bookCood;
		this.bookAction = bookAction;
		this.bookOutTs = bookOutTs;
		this.bookInTs = bookInTs;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBookCood() {
		return bookCood;
	}
	public void setBookCood(String bookCood) {
		this.bookCood = bookCood;
	}
	public String getBookAction() {
		return bookAction;
	}
	public void setBookAction(String bookAction) {
		this.bookAction = bookAction;
	}
	public Timestamp getBookOutTs() {
		return bookOutTs;
	}
	public void setBookOutTs(Timestamp bookOutTs) {
		this.bookOutTs = bookOutTs;
	}
	public Timestamp getBookInTs() {
		return bookInTs;
	}
	public void setBookInTs(Timestamp bookInTs) {
		this.bookInTs = bookInTs;
	}
	public BookRecordDTO() {
	}
	public BookRecordDTO(String userId, String bookCood, String bookAction) {
		this.userId = userId;
		this.bookCood = bookCood;
		this.bookAction = bookAction;
	}
	
}
	