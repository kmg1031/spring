package org.spring.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.spring.dto.MemberDTO;



public interface InDAO {

	public List<MemberDTO> list();
	
	public MemberDTO info(MemberDTO dto);
	
	public int join(MemberDTO dto);
	
	public String idCheck(MemberDTO dto);
	
	public int Delete(MemberDTO dto, HttpServletRequest request);

	public int update(MemberDTO dto);

	public int login(MemberDTO dto, HttpServletRequest request);
	
	public void logout(HttpServletRequest request);
	
	
}
