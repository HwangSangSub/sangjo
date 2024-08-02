package sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.service.BoardService;
import sangjo.service.BoardServiceImpl;

public class TestPageControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BoardService boardService = new BoardServiceImpl();
		
		req.setAttribute("boardList", boardService.getBoardList());
		
		// 이방법은 임시로 페이지를 여는 방법이지
		// 실제 프로젝트에서는
		// 메인 화면 완료된뒤 타일즈를 적용한뒤에 하나씩 해나가자
		req.getRequestDispatcher("sangjo/testPage.tiles")
			.forward(req, resp);

	}

}
