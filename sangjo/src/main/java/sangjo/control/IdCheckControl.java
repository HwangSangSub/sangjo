package sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.service.MemberService;
import sangjo.service.MemberServiceImpl;
import sangjo.vo.MemberVO;

/**
 * 회원 아이디 중복체크를 한다.
 */
public class IdCheckControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		MemberService memberService = new MemberServiceImpl();
		MemberVO memberVO = memberService.getMemberById(memberId);
		
		String json;
		if(memberVO == null) {
			System.out.println("사용가능한 아이디입니다.");
			json= String.format("{\"%s\":\"%s\"}", "idCheckResult","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "idCheckResult","Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);
	}

}
