package org.spring.dto;

import java.sql.Timestamp;

public class BookRecordDTO {
	private int no;
	private String userId;
	private String bookCode;
	private Timestamp bookOutTs;
	private Timestamp bookInTs;
	public BookRecordDTO(String userId, String bookCode) {
		this.userId = userId;
		this.bookCode = bookCode;
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
		return bookCode;
	}
	public void setBookCood(String bookCode) {
		this.bookCode = bookCode;
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
	public BookRecordDTO(int no, String userId, String bookCode, Timestamp bookOutTs, Timestamp bookInTs) {
		this.no = no;
		this.userId = userId;
		this.bookCode = bookCode;
		this.bookOutTs = bookOutTs;
		this.bookInTs = bookInTs;
	}
	public BookRecordDTO() {
	}

}
	