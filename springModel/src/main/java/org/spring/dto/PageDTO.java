package org.spring.dto;

public class PageDTO {
	private int pageNow;
	private int pageStart;
	private int pageEnd;
	private int pageMax;
	private int	contentStart;
	private int contentEnd;
	public PageDTO(int pageNow, int pageStart, int pageEnd, int pageMax, int contentStart, int contentEnd) {
		super();
		this.pageNow = pageNow;
		this.pageStart = pageStart;
		this.pageEnd = pageEnd;
		this.pageMax = pageMax;
		this.contentStart = contentStart;
		this.contentEnd = contentEnd;
	}
	public PageDTO() {
		super();
	}
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getPageMax() {
		return pageMax;
	}
	public void setPageMax(int pageMax) {
		this.pageMax = pageMax;
	}
	public int getContentStart() {
		return contentStart;
	}
	public void setContentStart(int contentStart) {
		this.contentStart = contentStart;
	}
	public int getContentEnd() {
		return contentEnd;
	}
	public void setContentEnd(int contentEnd) {
		this.contentEnd = contentEnd;
	}

}
