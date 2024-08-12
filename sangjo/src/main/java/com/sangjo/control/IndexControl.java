package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;

/**
 * 메인페이지 열어줍니다
 */
public class IndexControl implements Control {
	
	
	
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		req.getRequestDispatcher("sangjo/indexBody.tiles").forward(req, resp);
	}

}
