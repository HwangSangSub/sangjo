package sangjo.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import sangjo.common.Control;
import sangjo.service.MemberService;
import sangjo.service.MemberServiceImpl;
import sangjo.vo.MemberVO;

/**
 * 회원가입을 한다.
 */
public class JoinControl implements Control{
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
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemberId(map.get("memberId"));
		memberVO.setMemberPw(map.get("memberPw"));
		memberVO.setMemberName(map.get("memberName"));
		memberVO.setMemberPhone(map.get("memberPhone"));
		memberVO.setMemberEmail(map.get("memberEmail"));
		
		String json;
		if(memberService.join(memberVO)) {// 회원 가입 동작 시작
			json= String.format("{\"%s\":\"%s\"}", "joinResult","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "joinResult","Faild");
		resp.setContentType("text/json;charset=utf-8");
		resp.getWriter().print(json);
	}
}
