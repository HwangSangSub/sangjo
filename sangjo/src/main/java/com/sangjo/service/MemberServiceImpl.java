package com.sangjo.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.sangjo.common.DataSource;
import com.sangjo.mapper.MemberMapper;
import com.sangjo.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	SqlSession sqlSession = 
			DataSource.getInstance().openSession(true);
	MemberMapper mapper 
		= sqlSession.getMapper(MemberMapper.class);
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	/**
	 * 아이디 찾기용 아직 사용처 X
	 */
	@Override
	@Deprecated
	public MemberVO getMemberById(String memberId) {
		return mapper.selectMemberById(memberId);
	}
	/**
	 * 로그인용 
	 * 아이디 값을 통해 객체를 가져온후
	 * 그 객체의 비밀번호와 입력된 비밀번호를 비교한다.
	 */
	@Override
	public MemberVO getMemberByLogin(String memberId, String memberPw) {
		MemberVO memberVO = mapper.selectMemberById(memberId);
		
		// 입력한대상과 비밀번호 복호화로 비교하기 
		if(encoder.matches(memberPw, memberVO.getMemberPw())) {
			// 로그인 성공했으니 객체를 반환한다.
			return memberVO;
		}
		// 로그인 실패
		return null;
	}

	@Override
	public boolean join(MemberVO memberVO) {
		// 비밀번호 암호화 
		String encodingPw = encoder.encode(memberVO.getMemberPw());
		memberVO.setMemberPw(encodingPw);
		return mapper.insertMember(memberVO) == 1;
	}
	
}
