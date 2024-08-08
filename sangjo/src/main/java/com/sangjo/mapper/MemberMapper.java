package com.sangjo.mapper;

import org.apache.ibatis.annotations.Param;

import com.sangjo.vo.MemberVO;

public interface MemberMapper {

	/**
	 * 아이디 값을 통해 회원 객체를 반환한다.
	 * 
	 * @param memberId
	 * @return 회원 객체
	 */
	MemberVO selectMemberById(String memberId);

	/**
	 * 아이디와 비번을 통해 회원객체를 반환한다. 현제 사용 X
	 * 
	 * @param memberId
	 * @param memberPw
	 * @return 회원 객체
	 */
	@Deprecated
	MemberVO selectMemberByIdPw(@Param("id") String memberId, @Param("pw") String memberPw);

	/**
	 * 회원 정보를 서버에 넣는다.
	 * 
	 * @param memberVO
	 * @return 추가된 숫자
	 */
	int insertMember(MemberVO memberVO);

	int updateMember(MemberVO member);

	/**
	 * 이메일을 통해 회원객체를 반환한다.
	 * 
	 * @param memberEmail
	 * @return 회원 객체
	 */
	MemberVO selectMemberByEamil(String memberEmail);

	/**
	 * 아이디 값을 통해 login_date를 수정한다.
	 * 
	 * @param memberId
	 */
	int updateLoginDateByMemberId(String memberId);

	/**
	 * 비밀번호 수정
	 * 
	 * @param newMemberPw
	 * @param memberEmail
	 * @return 변경 개수
	 */
	int updateMemberPw(@Param("pw") String newMemberPw, @Param("email") String memberEmail);

	/**
	 * 인증 코드 값 수정
	 * @param memberId
	 * @param randomNum
	 * @return 변경 개수
	 */
	int updateVerificationCode(@Param("id") String memberId, @Param("code") String randomNum);

}
