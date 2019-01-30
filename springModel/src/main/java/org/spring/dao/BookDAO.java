package org.spring.dao;

import java.util.ArrayList;
import java.util.List;

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
	
	public int checkIn(ArrayList<BookDTO> bookCoodList, String userId) {
		for(BookDTO dto : bookCoodList) {
			sqlSession.update("bookMapper.checkIn",dto);
			record(dto.getBookCood(), "checkIn", userId);
		}
		return 1;
	}
	public int checkOut(ArrayList<BookDTO> bookCoodList, String userId) {
		for(BookDTO dto : bookCoodList) {
			sqlSession.update("bookMapper.checkOut",dto);
			record(dto.getBookCood(), "checkOut", userId);
		}
		return 1;
	}
	public List<BookDTO> list(){
		List<BookDTO> list = sqlSession.selectList("bookMapper.list");
		return list;
	}
	
	public int record(String bookCood, String bookAction, String userId) {
		BookRecordDTO dto = new BookRecordDTO(userId, bookCood, bookAction);
		return sqlSession.insert("bookMapper.record", dto);
	}
	

}
