package sangjo.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import sangjo.common.Control;
import sangjo.service.MemberService;
import sangjo.service.MemberServiceImpl;
import sangjo.vo.MemberVO;

/**
 * 로그인 동작을한다.
 */
public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		String memberPw = req.getParameter("memberPw");
		MemberService memberService = new MemberServiceImpl();
		HttpSession session = req.getSession();
		
		MemberVO memberVO = memberService.getMemberByIdPw(memberId, memberPw);
		
		String json;
		if(memberVO !=null) {
			session.setAttribute("member", memberVO);
			session.setMaxInactiveInterval(60 * 60);// 1시간 동안 유지됨
			
			json= String.format("{\"%s\":\"%s\"}", "loginResult","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "loginResult","Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);
	}

}
