package org.spring.dao;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.FileDTO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class FileDAO{

	@Inject
	private SqlSession sqlSession;
	
	public int fileUpload(FileDTO dto) {
		try {
			sqlSession.insert("fileMapper.fileUpload", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;
	}
	
	public String getFilePath(FileDTO dto) {
		return ((FileDTO) sqlSession.selectOne("fileMapper.getFilePath", dto)).getFilePath();
	}
	
	public ArrayList<FileDTO> getFileList() {
		return new ArrayList<FileDTO>(sqlSession.selectList("fileMapper.getFileList"));
	}
	
	
}
