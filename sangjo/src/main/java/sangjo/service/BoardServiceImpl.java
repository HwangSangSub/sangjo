package sangjo.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.BoardMapper;
import sangjo.vo.BoardVO;

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
