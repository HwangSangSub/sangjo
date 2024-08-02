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
public class MemberIdCheckControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberId = req.getParameter("memberId");
		MemberService memberService = new MemberServiceImpl();
		MemberVO memberVO = memberService.getMemberById(memberId);
		if(memberVO == null) {
			System.out.println("사용가능한 아이디입니다.");
		}else {
			System.out.println("중복된 아이디 입니다.");
		}
		
		
	}

}
