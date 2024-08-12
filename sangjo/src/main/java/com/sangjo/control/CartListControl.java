package com.sangjo.control;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;
import com.sangjo.vo.CartListVO;

public class CartListControl implements Control {

  

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자 ID를 세션에서 가져오기
        String memberId = (String) req.getSession().getAttribute("memberId");
        
     // 사용자 ID가 null이면 빈 리스트를 반환
        if (memberId == null) {
            memberId = "guest"; // 또는 적절한 기본값 설정
        }
        
         CartListService csc = new CartListServiceImpl();
         memberId = "user01";
         
        // 사용자 ID가 null이면 빈 리스트를 반환하고, 그렇지 않으면 장바구니 목록을 가져오기
         List<CartListVO> cartList = csc.getCartList(memberId);
        
        // 요청 속성에 장바구니 목록 저장
        req.setAttribute("cartList", cartList);

        // JSP 페이지로 포워딩
        req.getRequestDispatcher("sangjo/cartList.tiles").forward(req, resp);       
    }
}