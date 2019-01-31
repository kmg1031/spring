package org.spring.dto;

public class BookDTO {
	
	private String bookCode;
	private String bookName;
	private String bookAuthor;
	private String bookState;
	public BookDTO(String bookCode) {
		this.bookCode = bookCode;
	}
	
	public BookDTO(String bookCode, String bookName, String bookAuthor, String bookState) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookState = bookState;
	}
	public BookDTO() {
	}
	public String getBookCood() {
		return bookCode;
	}
	public void setBookCood(String bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookState() {
		return bookState;
	}
	public void setBookState(String bookState) {
		this.bookState = bookState;
	}
	
}
