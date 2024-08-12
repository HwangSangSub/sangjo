package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;

/**
 * 아이디 찾기 화면을 열기위해 사용한다.
 */
public class FindIdForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("sangjo/findId.tiles").forward(req, resp);
		
	}

}
