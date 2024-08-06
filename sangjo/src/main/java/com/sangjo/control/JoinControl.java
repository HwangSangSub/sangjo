package com.sangjo.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sangjo.common.Control;
import com.sangjo.service.AddressService;
import com.sangjo.service.AddressServiceImpl;
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;
import com.sangjo.vo.AddressVO;
import com.sangjo.vo.MemberVO;

/**
 * 회원가입을 한다.
 */
public class JoinControl implements Control{
	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService memberService = new MemberServiceImpl();
		AddressService addressService = new AddressServiceImpl();
		ObjectMapper objectMapper = new ObjectMapper();
		
		// http body에서 데이터 가져오기
		ServletInputStream inputStream 
			= req.getInputStream();
		Map<String,String> map
		= objectMapper.readValue(inputStream, 
				new TypeReference<Map<String,String>>(){
		});
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(map.get("memberId"));
		memberVO.setMemberPw(map.get("memberPw"));
		memberVO.setMemberName(map.get("memberName"));
		memberVO.setMemberPhone(map.get("memberPhone"));
		memberVO.setMemberEmail(map.get("memberEmail"));
		
		AddressVO addressVO = new AddressVO();
		addressVO.setAddressCode(Integer.parseInt(map.get("addressCode")));
		addressVO.setMemberId(map.get("memberId"));
		addressVO.setAddressMain(map.get("addressMain"));
		addressVO.setAddressDetail(map.get("addressDetail"));
		addressVO.setIdDefault(1);// 회원 가입시 처음 입력하는 주소값은 매인으로 고정한다.
		
		String json;
		if(memberService.join(memberVO) && addressService.addAddress(addressVO)) {// 회원 가입 동작 시작
			json= String.format("{\"%s\":\"%s\"}", "joinResult","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "joinResult","Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);
	}
}
