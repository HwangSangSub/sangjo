package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;

public class OrderListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 1. form 안에 있는 input의 name으로 받아오면서 변수로 지정하기
		String cartNos = req.getParameter("cartNos");
		String productNos = req.getParameter("productNos");
		String productPrices = req.getParameter("productPrices");
		String productNames = req.getParameter("productNames");		
		String productImgs = req.getParameter("productImgs");
		String quantities = req.getParameter("quantities");
		String totalAmount = req.getParameter("totalAmount");
		
		// 2. 받아온 값을 orderList.jsp 로 값 보내기
		
		req.setAttribute("cartNos", cartNos); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("productNos", productNos); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("productPrices", productPrices); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("productNames", productNames); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("productImgs", productImgs); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("quantities", quantities); // 앞에 문자열은 보내는 이름 , 뒤는 보내는 값
		req.setAttribute("totalAmount", totalAmount); 
		
		req.getRequestDispatcher("sangjo/orderList.tiles").forward(req, resp);
		
	}// end exec() 
	

}// end class