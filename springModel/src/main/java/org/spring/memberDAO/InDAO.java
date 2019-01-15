package org.spring.memberDAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.spring.memberDTO.MemberDTO;



public interface InDAO {

	public List<MemberDTO> list();
	
	public MemberDTO info(MemberDTO dto);
	
	public int join(MemberDTO dto);
	
	public String idCheck(MemberDTO dto);
	
	public int DeleteDo(MemberDTO dto);

	public int update(MemberDTO dto);

	public int login(MemberDTO dto, HttpServletRequest request);
	
	public void logout(HttpServletRequest request);
	
	
}
