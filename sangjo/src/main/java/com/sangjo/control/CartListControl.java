package com.sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sangjo.common.Control;

public class CartListControl implements Control {

  

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        // 세션에서 로그인된 회원 정보를 가져옴
        Object member = session.getAttribute("member");
        
        if (member == null) {
            // 로그인 되어 있지 않으면 로그인 페이지로 리다이렉트
            resp.sendRedirect("login.do");
            return;
        }
        req.getRequestDispatcher("sangjo/cartList.tiles").forward(req, resp);       
    }
}
