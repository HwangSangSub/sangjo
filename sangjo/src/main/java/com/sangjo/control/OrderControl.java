package com.sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.OrderService;
import com.sangjo.service.OrderServiceImpl;
import com.sangjo.vo.OrderVO;

public class OrderControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		OrderService osv = new OrderServiceImpl();

		// 요청 파라미터 추출
		String productNos = req.getParameter("productNos");
		String productPrices = req.getParameter("productPrices");
		String quantities = req.getParameter("quantities");
		String totalAmount = req.getParameter("totalAmount");
		String memberId = req.getParameter("memberId");
		boolean paymentSuccess = false;
		
		OrderVO ovo = new OrderVO();
		ovo.setOrderPrice((int) Math.round(Double.parseDouble(totalAmount)));
		ovo.setMemberId(memberId);

		if (osv.addOrder(ovo) == 1) {

			String[] productNoArray = productNos.split("/");
			String[] productPriceArray = productPrices.split("/");
			String[] quantityArray = quantities.split("/");

			// Loop through the product numbers
			for (int i = 0; i < productNoArray.length; i++) {
				ovo = new OrderVO();
				ovo.setProductNo(Integer.parseInt(productNoArray[i]));
				ovo.setOdPrice(Integer.parseInt(productPriceArray[i]));
				ovo.setOdCnt(Integer.parseInt(quantityArray[i]));

				if (osv.addOrderDetail(ovo) == 1) {
					paymentSuccess = true;
				} else {
					paymentSuccess = false;
				}
			}
		}

		// 결과 메시지 설정
		String status = paymentSuccess ? "success" : "error";
		String message = paymentSuccess ? "결제가 완료되었습니다." : "결제에 실패했습니다.";

		// 요청 속성에 상태와 메시지 설정
		req.setAttribute("status", status);
		req.setAttribute("message", message);

		// 결과 페이지로 포워딩
		if (paymentSuccess) {
			req.getRequestDispatcher("sangjo/orderComplete.tiles").forward(req, resp);
			return; // 포워딩 후 메서드 종료
		} else {
			req.getRequestDispatcher("sangjo/error.tiles").forward(req, resp);
			return; // 포워딩 후 메서드 종료
		}
	}
}
