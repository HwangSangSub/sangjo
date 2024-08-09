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
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;
import com.sangjo.vo.CartListVO;

public class CartAddControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		CartListService cartListService = new CartListServiceImpl();
		ObjectMapper objectMapper = new ObjectMapper();
		
		ServletInputStream inputStream = req.getInputStream();
		Map<String,String> map 
			= objectMapper.readValue(inputStream,
					new TypeReference<Map<String,String>>(){});
		
		CartListVO cartListVO = new CartListVO();
		cartListVO.setProductNo(Integer.parseInt(map.get("productNo")));
		cartListVO.setMemberId(map.get("memberId"));		
		
		// System.out.println(cartListVO);
		String json;
		if(cartListService.insertCartList(cartListVO)) {
			json= String.format("{\"%s\":\"%s\"}", "addCart","Success");
			resp.getWriter().print(json);
			return;
		}
		json= String.format("{\"%s\":\"%s\"}", "addCart","Faild");
		resp.getWriter().print(json);
	}

}
