package sangjo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.BoardMapper;
import com.sangjo.mapper.ReviewMapper;
import com.sangjo.vo.ReviewVO;

public class MybatisTest {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = 
				DataSource.getInstance().openSession(true);
		BoardMapper boardMapper 
			= sqlSession.getMapper(BoardMapper.class);
		ReviewMapper reviewMapper 
			= sqlSession.getMapper(ReviewMapper.class);
		
		//boardTest(boardMapper);
		reviewTest(reviewMapper);
	}
	
	private static void reviewTest(ReviewMapper reviewMapper) {
		List<ReviewVO> list = reviewMapper.selectReviewList("1", "1");
		list.forEach(System.out::println);
	}

	// 샘플데이터 넣기
	//insert into tbl_board (board_no,board_title ,board_content,board_type,member_id)
	//values(1,'제목','내용','1','1');
	private static void boardTest(BoardMapper boardMapper) {
		boardMapper.selectBoardList().forEach(boardVO 
				-> {System.out.println(boardVO);});
	}
}
