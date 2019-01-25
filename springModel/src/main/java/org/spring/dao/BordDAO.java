package org.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.spring.dto.BordDTO;
import org.spring.dto.PageDTO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class BordDAO{
	
	@Inject
	SqlSession sqlSession;

	public List<BordDTO> list(String page) {
		List<BordDTO> list = sqlSession.selectList("bordMapper.list", getPageDTO(page));
		return list;
	}
	
	public PageDTO getPageDTO(String page) {
		int contentMax = contentMax();
		if(contentMax == 0) return new PageDTO(-1, 0, 0, 0, 0, 0);
		int contentCount = 10;
		int pageCount = 10;
		int pageMax = (contentMax - 1) / contentCount + 1;
		int pageNow=1;
		if(page!=null) {
			try {
			pageNow = Integer.parseInt(page);
			}catch (Exception e) {
				e.printStackTrace();
				pageNow = 1;
			}
			if(pageNow < 1 ) {
				pageNow = 1;
			}else if(pageNow > pageMax) {
				pageNow = pageMax;
			}
		}
		int pageStart = (pageNow - 1) / contentCount + 1;
		int pageEnd = pageStart + pageCount - 1;
		pageEnd = pageEnd > pageMax ? pageMax : pageEnd;
		
		int contentStart = (pageNow-1) * 10;
		int contentEnd = contentStart + 10;
		
		return new PageDTO(pageNow, pageStart, pageEnd, pageMax, contentStart, contentEnd);

	}
	
	public BordDTO info(BordDTO dto) {
		return sqlSession.selectOne("bordMapper.info", dto);
	}
		
	public int write(BordDTO dto) {
		return sqlSession.insert("bordMapper.write",dto);
	}
	
	public int delete(BordDTO dto, String sessionId) {
		BordDTO info = sqlSession.selectOne("bordMapper.info", dto);
		if(info.getUserId().equals(sessionId)) {
			return sqlSession.delete("bordMapper.delete", dto);
		}else {
			return 0;
		}
	}
	
	public int update(BordDTO dto, String sessionId) {
		BordDTO info = sqlSession.selectOne("bordMapper.info", dto);
		if(info.getUserId().equals(sessionId)) {
			return sqlSession.update("bordMapper.update", dto);
		}else {
			return 0;
		}
	}
	public int contentMax() {
		return sqlSession.selectOne("bordMapper.contentMax");
	}
	
}
