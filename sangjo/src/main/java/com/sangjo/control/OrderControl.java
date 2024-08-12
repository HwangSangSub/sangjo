package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.OrderService;
import com.sangjo.service.OrderServiceImpl;

public class OrderControl implements Control {

   

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	  OrderService osv = new OrderServiceImpl();  // OrderServiceImpl 인스턴스 생성
        // 요청 파라미터 추출
        String fullName = req.getParameter("fullName");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String detailAddress = req.getParameter("detailAddress");
        String orderMemo = req.getParameter("orderMemo");
        String productNos = req.getParameter("productNos");
        String productImgs = req.getParameter("productImgs");
        String productNames = req.getParameter("productNames");
        String productPrices = req.getParameter("productPrices");
        String quantities = req.getParameter("quantities");
        String shippingCost = req.getParameter("shippingCost");
        String totalAmount = req.getParameter("totalAmount");

        // 비즈니스 로직을 호출하여 결제 처리
        boolean paymentSuccess = osv.processOrder(fullName, phone, 
                address, detailAddress, orderMemo, productNos, productImgs, 
                productNames, productPrices, quantities, shippingCost, totalAmount);

        // 결과 메시지 설정
        String status = paymentSuccess ? "success" : "error";
        String message = paymentSuccess ? "결제가 완료되었습니다." : "결제에 실패했습니다.";

        // 요청 속성에 상태와 메시지 설정
        req.setAttribute("status", status);
        req.setAttribute("message", message);

        // 결과 페이지로 포워딩
        req.getRequestDispatcher("sangjo/orderComplete.tiles").forward(req, resp);
    }
}