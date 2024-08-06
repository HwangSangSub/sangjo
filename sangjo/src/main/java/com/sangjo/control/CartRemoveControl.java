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
import com.sangjo.service.CartListService;
import com.sangjo.service.CartListServiceImpl;

public class CartRemoveControl implements Control {

   

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String cartNo = req.getParameter("cartNo");
        CartListService cls = new CartListServiceImpl();
        Map<String, Object> map = new HashMap<>();

        try {
            if (cartNo != null && cls.deleteCartList(cartNo)) {
                map.put("retCode", "Success");
            } else {
                map.put("retCode", "Fail");
            }
        } catch (Exception e) {
            // 오류 발생 시
            map.put("retCode", "Error");
            // JSON 문자열 생성
            Gson gson = new GsonBuilder().create();
            String json = gson.toJson(map);

            resp.setContentType("application/json");
            resp.getWriter().print(json);

            // 오류 페이지로 리다이렉트
            req.getRequestDispatcher("/errorPage.do").forward(req, resp);
            return;
        }

        // 성공 시 JSON 응답
        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(map);

        resp.setContentType("application/json");
        resp.getWriter().print(json);
    }
}