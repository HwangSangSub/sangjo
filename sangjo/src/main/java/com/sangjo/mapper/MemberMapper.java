package com.sangjo.mapper;

import org.apache.ibatis.annotations.Param;

import com.sangjo.vo.MemberVO;

public interface MemberMapper {

	MemberVO selectMemberById(String memberId);

	MemberVO selectMemberByIdPw(@Param("id") String memberId,@Param("pw") String memberPw);

	int insertMember(MemberVO memberVO);
}
