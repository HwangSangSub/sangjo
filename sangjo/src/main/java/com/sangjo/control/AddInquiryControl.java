package com.sangjo.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sangjo.common.Control;
import com.sangjo.service.InquiryService;
import com.sangjo.service.InquiryServiceImpl;
import com.sangjo.vo.InquiryVO;

public class AddInquiryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		String memberId = req.getParameter("memberId");
		String inquiryTitleIns = req.getParameter("inquiryTitleIns");
		String inquiryContentIns = req.getParameter("inquiryContentIns");
		
		InquiryService ivc = new InquiryServiceImpl();
		InquiryVO ivo = new InquiryVO();
		ivo.setInquiryInquirer(memberId);
		ivo.setInquiryTitle(inquiryTitleIns);
		ivo.setInquiryContent(inquiryContentIns);

		Map<String, Object> map = new HashMap<>();
		
		if(ivc.addInquiry(ivo)) {
			map.put("result", "success");
		}else {
			map.put("result", "fail");
		}

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(map); // 목록을 JSON으로 변환

		resp.getWriter().print(json);
	}
}
