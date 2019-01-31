package org.spring.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.MemberDTO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class MemberDAO{

	@Inject
	private SqlSession sqlSession;
	
	public List<MemberDTO> list() {	
		return sqlSession.selectList("memberMapper.list");
	}

	public MemberDTO info(MemberDTO dto) {
		return sqlSession.selectOne("memberMapper.info", dto);
	}

	public int join(MemberDTO dto) {
		if(dto.getUserId().length() >= 4 || dto.getUserId().length() <= 16) {
			if(dto.getUserPw().length() >= 4 || dto.getUserPw().length() <= 16) {
				if(dto.getUserName().length() >= 4 || dto.getUserName().length() <= 16) {
					return sqlSession.insert("memberMapper.join", dto);
				}
			}
		}
		return 0;
	}
	
	public int login(MemberDTO dto , HttpServletRequest request) {
		int result=sqlSession.selectOne("memberMapper.login", dto);
		if(result==1) {
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", dto.getUserId());
			session.setMaxInactiveInterval(60 * 60);
		}
		return result;
	}

	public int Delete(MemberDTO dto, HttpServletRequest request) {
		if(sqlSession.delete("memberMapper.delete", dto)==1) {
			logout(request);
			return 1;
		}else {
			return 0;
		}
	}

	public int update(MemberDTO dto) {
		return sqlSession.update("memberMapper.update", dto);
	}

	public String idCheck(MemberDTO dto) {
		return sqlSession.selectOne("memberMapper.idCheck", dto);
	}

	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
	}

}
