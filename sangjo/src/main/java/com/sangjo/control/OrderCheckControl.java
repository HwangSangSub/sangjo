package com.sangjo.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sangjo.common.Control;

public class OrderCheckControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {
    	req.setCharacterEncoding("utf-8");
        // 요청 파라미터를 가져옵니다.
        String fullName = req.getParameter("send_fullName");
        String phone = req.getParameter("send_phone");
        String address = req.getParameter("send_address");
        String detailAddress = req.getParameter("send_detailAdress");
        String orderMemo = req.getParameter("send_orderMemo");
        String productNos = req.getParameter("productNos");
        String productPrices = req.getParameter("productPrices");
        String productNames = req.getParameter("productNames");
        String productImgs = req.getParameter("productImgs");
        String quantities = req.getParameter("quantities");
        String shippingCost = req.getParameter("shippingCost");
        String paymentMethod = req.getParameter("paymentMethod");
        String totalAmount = req.getParameter("totalAmount");

        
        // request에 값을 설정합니다.
        req.setAttribute("fullName", fullName);
        req.setAttribute("totalAmount", totalAmount);
        req.setAttribute("phone", phone);
        req.setAttribute("address", address);
        req.setAttribute("detailAddress", detailAddress);
        req.setAttribute("orderMemo", orderMemo);
        req.setAttribute("productNos", productNos);
        req.setAttribute("productPrices", productPrices);
        req.setAttribute("productNames", productNames);
        req.setAttribute("productImgs", productImgs);
        req.setAttribute("quantities", quantities);
        req.setAttribute("shippingCost", shippingCost);
        req.setAttribute("paymentMethod", paymentMethod);

        // orderCheck.tiles로 포워딩합니다.
        req.getRequestDispatcher("sangjo/orderCheck.tiles").forward(req, resp);
    }
}