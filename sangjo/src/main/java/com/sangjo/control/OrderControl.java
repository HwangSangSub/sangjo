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
        if (action == null) {
            action = "viewCart"; // 기본적으로 장바구니 보기로 설정
        }

      

        OrderService osv = new OrderServiceImpl();
        List<OrderVO> list;

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
        boolean paymentSuccess = osv.processOrder(fullName, phone, address, detailAddress, orderMemo, productNos,
                productImgs, productNames, productPrices, quantities, shippingCost, totalAmount);

        System.out.println("Payment success: " + paymentSuccess); // 결제 성공 여부 출력

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
    private void addToCart(HttpServletRequest req, OrderService osv) 
    		throws ServletException, IOException {
        String memberId = (String) req.getSession().getAttribute("memberId");
        if (memberId == null) {
            req.setAttribute("errorMessage", "로그인 후 장바구니에 담을 수 있습니다.");
            return; // 여기서 메서드를 종료하여 오류 처리
        }

        int productNo = Integer.parseInt(req.getParameter("productNo"));
        int odCnt = Integer.parseInt(req.getParameter("odCnt"));

        OrderVO ovo = new OrderVO();
        ovo.setMemberId(memberId);
        ovo.setProductNo(productNo);
        ovo.setOdCnt(odCnt);
        ovo.setOdPrice(10000); // 실제 가격은 상품 정보를 통해 받아야 함
    }
}
