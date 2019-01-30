package org.spring.dto;

public class BookDTO {
	
	private String bookCood;
	private String bookName;
	private String bookAuthor;
	private String bookState;
	public BookDTO(String bookCood) {
		this.bookCood = bookCood;
	}
	
	public BookDTO(String bookCood, String bookName, String bookAuthor, String bookState) {
		this.bookCood = bookCood;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookState = bookState;
	}
	public BookDTO() {
	}
	public String getBookCood() {
		return bookCood;
	}
	public void setBookCood(String bookCood) {
		this.bookCood = bookCood;
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
