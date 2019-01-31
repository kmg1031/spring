package org.spring.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.BookDTO;
import org.spring.dto.BookRecordDTO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class BookDAO{
	
	@Inject
	SqlSession sqlSession;

	public int addInfo(BookDTO dto) {
		return sqlSession.insert("bookMapper.addInfo",dto);
	}
	
	public int checkOut(ArrayList<BookDTO> bookCodeList, String userId) {
		for(BookDTO dto : bookCodeList) {
			sqlSession.update("bookMapper.checkOut", dto.getBookCood());
			sqlSession.insert("bookMapper.outRecord", new BookRecordDTO(userId, dto.getBookCood()));
		}
		return 1;
	}
	public int checkIn(ArrayList<BookDTO> bookCodeList, String userId) {
		for(BookDTO dto : bookCodeList) {
			sqlSession.update("bookMapper.checkIn",dto.getBookCood());
			sqlSession.update("bookMapper.inRecord", new BookRecordDTO(userId, dto.getBookCood()));
		}
		return 1;
	}
	
	public String stateCheck(String bookCode) {
		return sqlSession.selectOne("bookMapper.stateCheck", bookCode);
	}
	
	
	
	public List<BookDTO> list(){
		List<BookDTO> list = sqlSession.selectList("bookMapper.list");
		return list;
	}
	
	public List<BookDTO> search(String option, String keyword){
		Map<String, String> map = new HashMap<>();
		map.put("option", option);
		map.put("keyword", keyword);
		List<BookDTO> list = sqlSession.selectList("bookMapper.search", map);
		
		return list;
	}

}
