package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.service.BoardService;
import com.sangjo.service.BoardServiceImpl;
import com.sangjo.vo.BoardVO;

public class HelpDeskControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8"); // 내용 중 한글이 있다면 utf-8로 변환해야함.
		
		BoardService svc = new BoardServiceImpl();
		List<BoardVO> list = svc.getBoardList();

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // 목록을 JSON으로 변환
		
		req.setAttribute("boardList", list);
		req.getRequestDispatcher("sangjo/helpDesk.tiles").forward(req, resp);

	}// end exec()

}// end class
