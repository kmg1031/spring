package org.spring.dto;

public class BordDTO{
	private int no;
	private String userId;
	private String title;
	private String memo;

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
	public BordDTO() {
		super();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public BordDTO(int no, String userId, String title, String memo) {
		super();
		this.no = no;
		this.userId = userId;
		this.title = title;
		this.memo = memo;
	}
	
}
