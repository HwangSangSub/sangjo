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
		// 아이디가 틀린경우
		if(memberVO == null) {
			return null;
		}
		// 입력한대상과 비밀번호 복호화로 비교하기 
		if(encoder.matches(memberPw, memberVO.getMemberPw())) {
			// 객체를 반환한다.
			return memberVO;
		}
		// 로그인 실패
		return null;
	}

	/**
	 * 회원가입 서비스
	 */
	@Override
	public boolean join(MemberVO memberVO) {
		// 비밀번호 암호화 
		String encodingPw = encoder.encode(memberVO.getMemberPw());
		memberVO.setMemberPw(encodingPw);
		return mapper.insertMember(memberVO) == 1;
	}
	
	/**
	 * 이메일로 회원 정보 가져오기
	 */
	@Override
	public MemberVO getMemberByEmail(String memberEmail) {
		return mapper.selectMemberByEamil(memberEmail);
	}
	
	/**
	 * 최신 로그인 기록
	 */
	@Override
	public boolean loginLog(String memberId) {
		return mapper.updateLoginDateByMemberId(memberId) == 1;
	}
	
	/**
	 * 비밀번호 변경
	 */
	@Override
	public boolean changePassword(String newMemberPw, String memberEmail) {
		// 비밀번호 암호화 
		String encodingPw = encoder.encode(newMemberPw);
		return mapper.updateMemberPw(encodingPw, memberEmail) == 1;
	}
	
}
