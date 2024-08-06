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
import com.sangjo.service.MemberService;
import com.sangjo.service.MemberServiceImpl;

public class ChangePwControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberService memberService = new MemberServiceImpl();
		ObjectMapper objectMapper = new ObjectMapper();
		
		// http body에서 데이터 가져오기
		ServletInputStream inputStream 
			= req.getInputStream();
		Map<String,String> map
		= objectMapper.readValue(inputStream, 
				new TypeReference<Map<String,String>>(){
		});
		
		String verificationCode = map.get("verificationCode");
		String memberEmail = map.get("memberEmail");
		String newMemberPw = map.get("newMemberPw");
		
		String json;
		// 인증 코드 확인하고 맞으면 비밀번호 수정 실행하기
		if(checkVerificationCode(verificationCode)) {
			if(memberService.changePassword(newMemberPw,memberEmail)) {
				json= String.format("{\"%s\":\"%s\"}", "changePassword", "Success");
				resp.getWriter().print(json);
				return;
			}
		}
		json= String.format("{\"%s\":\"%s\"}", "changePassword", "Faild");
		resp.getWriter().print(json);
		return;
		
	}
	
	/**
	 * 실제로 인증코드는 체크하지 않으며 
	 * 무조건 true로 반환해준다. (미완성)
	 * @param verificationCode
	 * @return 인증 코드 확인결과
	 */
	private boolean checkVerificationCode(String verificationCode) {
		String serverVerificationCode = "서버에서의 인증코드";
		if(serverVerificationCode.equals(verificationCode))
		{
			return true;
		}
		return true;
	}
	
	

}
