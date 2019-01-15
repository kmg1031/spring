package org.spring.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.FileDTO;
import org.spring.dto.MemberDTO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements InDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<MemberDTO> list() {	
		return sqlSession.selectList("memberMapper.list");
	}

	@Override
	public MemberDTO info(MemberDTO dto) {
		return sqlSession.selectOne("memberMapper.info", dto);
	}

	@Override
	public int join(MemberDTO dto) {
		return sqlSession.insert("memberMapper.join", dto);
	}

	public int file(FileDTO dto) {
		return sqlSession.insert("memberMapper.file_test", dto);
	}
	
	@Override
	public int login(MemberDTO dto , HttpServletRequest request) {
		int result=sqlSession.selectOne("memberMapper.login", dto);
		if(result==1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", dto.getUserId());
			session.setMaxInactiveInterval(60 * 60);
		}
		return result;
	}

	@Override
	public int DeleteDo(MemberDTO dto) {
		return sqlSession.delete("memberMapper.delete", dto);
	}

	@Override
	public int update(MemberDTO dto) {
		return sqlSession.update("memberMapper.update", dto);
	}

	@Override
	public String idCheck(MemberDTO dto) {
		return sqlSession.selectOne("memberMapper.idCheck", dto);
	}

	@Override
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}

}
