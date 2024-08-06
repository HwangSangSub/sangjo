package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;
import com.sangjo.vo.MemberVO;

/**
 * 아이디를 찾기위해 사용한다.
 */
public class FindIdControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberEmail = req.getParameter("memberEmail");
		MemberService memberService = new MemberServiceImpl();
		
		MemberVO memberVO = memberService.getMemberByEmail(memberEmail);
		
		String json = null;
		if(memberVO != null) {
			json= String.format("{\"%s\":\"%s\"}", "memberId",memberVO.getMemberId());
			resp.getWriter().print(json);
		}else {
			json= String.format("{\"%s\":\"%s\"}", "memberId","Faild");
			resp.getWriter().print(json);
		}
	}

}
