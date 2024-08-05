package com.sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.BoardMapper;
import com.sangjo.vo.BoardVO;

public class BoardServiceImpl implements BoardService{

	SqlSession sqlSession = 
			DataSource.getInstance().openSession(true);
	BoardMapper mapper 
		= sqlSession.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> getBoardList() {
		return mapper.selectBoardList();
	}

}
