package sangjo.mapper;

import java.util.List;

import sangjo.vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectBoardList();
}
