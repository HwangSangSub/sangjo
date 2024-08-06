package com.sangjo.control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sangjo.common.Control;
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;

public class CartRemoveControl implements Control {

    private CartListService cartListService = new CartListServiceImpl();

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 요청 파라미터에서 장바구니 번호를 가져옴
        String cartNo = req.getParameter("cartNo");
        
        if (cartNo != null) {
            // 서비스 클래스의 메서드를 호출하여 장바구니 항목을 삭제
            cartListService.removeCartLIst(cartNo);
        }

        // 성공적으로 삭제되었다고 가정하고, 리다이렉션 등의 처리를 할 수 있음
        resp.sendRedirect("cartList.do"); // 장바구니 리스트 페이지로 리다이렉트
    }
}