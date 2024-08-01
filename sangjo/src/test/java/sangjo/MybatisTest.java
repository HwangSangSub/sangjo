package sangjo;

import org.apache.ibatis.session.SqlSession;

import sangjo.common.DataSource;
import sangjo.mapper.BoardMapper;

public class MybatisTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = 
				DataSource.getInstance().openSession(true);
		BoardMapper boardMapper 
			= sqlSession.getMapper(BoardMapper.class);
		
		boardTest(boardMapper);
	}
	
	// 샘플데이터 넣기
	//insert into tbl_board (board_no,board_title ,board_content,board_type,member_id)
	//values(1,'제목','내용','1','1');
	private static void boardTest(BoardMapper boardMapper) {
		boardMapper.selectBoardList().forEach(boardVO 
				-> {System.out.println(boardVO);});
	}
}
