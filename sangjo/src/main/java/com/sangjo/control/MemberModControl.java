package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;
import com.sangjo.vo.MemberVO;

public class MemberModControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService mvc = new MemberServiceImpl();

		String memberId = req.getParameter("memberId");
		String memberPw = req.getParameter("memberPw");
		String memberOldPw = req.getParameter("memberOldPw");
		String memberName = req.getParameter("memberName");
		String memberPhone = req.getParameter("memberPhone");
		String memberEmail = req.getParameter("memberEmail");
		String memberModPw = "";

		MemberVO mvo = new MemberVO();
		mvo.setMemberId(memberId);
		mvo.setMemberName(memberName);
		mvo.setMemberPhone(memberPhone);
		mvo.setMemberEmail(memberEmail);
		mvo.setMemberPw(memberModPw);
		// 변경할 비밀번호를 입력하지 않았으면 비밀번호를 수정하지 않는다.
		if (memberPw != "") {
			// 변경할 비밀번호와 기존 비밀번호를 비교해서 같으면 변경하지 않고 다를경우에만 변경한다.
			if (!memberPw.equals(memberOldPw)) {
				mvo.setMemberPw(memberPw);
			}
		}

		String json;
		if (mvc.modMember(mvo)) {
			json = String.format("{\"%s\":\"%s\"}", "retCode", "Success");
			resp.getWriter().print(json);
			return;
		}
		json = String.format("{\"%s\":\"%s\"}", "retCode", "Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);

	}// end exec()

}// end class
