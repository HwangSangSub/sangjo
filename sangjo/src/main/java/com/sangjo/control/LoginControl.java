package com.sangjo.control;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sangjo.common.Control;
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;
import com.sangjo.vo.CartListVO;
import com.sangjo.vo.MemberVO;

/**
 * 로그인 동작을한다.
 */
public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService memberService = new MemberServiceImpl();
		HttpSession session = req.getSession();
		ObjectMapper objectMapper = new ObjectMapper();

		// http body에서 데이터 가져오기
		ServletInputStream inputStream = req.getInputStream();

		Map<String, String> map = objectMapper.readValue(inputStream, new TypeReference<Map<String, String>>() {
		});

		String memberId = map.get("memberId");
		String memberPw = map.get("memberPw");

		MemberVO memberVO = memberService.getMemberByLogin(memberId, memberPw);
    
		String json;
		if (memberVO != null) {
			// 로그인이 성공 했으니 로그인 로그기록도 남긴다.
			memberService.loginLog(memberVO.getMemberId());

			session.setAttribute("member", memberVO);
			session.setMaxInactiveInterval(60 * 60);// 1시간 동안 유지됨

			json = String.format("{\"%s\":\"%s\"}", "loginResult", "Success");
			resp.getWriter().print(json);
			return;
		}
		json = String.format("{\"%s\":\"%s\"}", "loginResult", "Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);
	}

}
