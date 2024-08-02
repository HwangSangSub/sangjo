package sangjo.service;

import sangjo.vo.MemberVO;

public interface MemberService {

	MemberVO getMemberById(String memberId);

	MemberVO getMemberByIdPw(String memberId, String memberPw);

}
