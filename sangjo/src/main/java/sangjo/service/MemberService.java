package sangjo.service;

import sangjo.vo.MemberVO;

public interface MemberService {

	MemberVO getMemberById(String memberId);

	MemberVO getMemberByLogin(String memberId, String memberPw);

	boolean join(MemberVO memberVO);

}
