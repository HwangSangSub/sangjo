package com.sangjo.control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;
import com.sangjo.vo.MemberVO;

/**
 * 이메일을 통해 비밀번호 수정할 수 있게한다.
 * 실제 이메일은 보낼수 없기에
 * 이메일값이 올바르면 특정 랜덤 값을 반환하며 
 * 올바르지 않으면 Faild로 환한다.
 * 랜덤 값을 통해 비번을 수정할 수 있다.
 */
public class FindPwControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memberEmail = req.getParameter("memberEmail");
		MemberService memberService = new MemberServiceImpl();
		
		MemberVO memberVO = memberService.getMemberByEmail(memberEmail);
		String json = null;
		if(memberVO != null) {
			int verificationCode = saveRandomNum(memberService,memberVO.getMemberId());
			json= String.format("{\"%s\":\"%s\"}", "sendEmail", verificationCode);
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "sendEmail","Faild");
		resp.getWriter().print(json);
	}
	/**
	 * 서버에 이메일 확인 코드를 저장하기위한 메서드이다.
	 * 이후 랜덤 숫자를 반환한다.
	 * @param memberService
	 */
	private int saveRandomNum(MemberService memberService, String memberId) {
		Random random = new Random();
		int randomNum = random.nextInt(8999999)+1000000;
		memberService.saveVerificationCode(memberId,String.format("%d", randomNum));
		return randomNum;
	}

}
