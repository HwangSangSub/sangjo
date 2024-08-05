package sangjo.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.service.CartListService;
import sangjo.service.CartListServiceImpl;
import sangjo.vo.CartListVO;

public class CartListControl implements Control {

    private CartListService cartListService = new CartListServiceImpl();

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 사용자 ID를 세션에서 가져오기
        String memberId = (String) req.getSession().getAttribute("memberId");

        // 서비스 호출을 통해 장바구니 목록 가져오기
        List<CartListVO> cartList = cartListService.getCartList(memberId);

        // 요청 속성에 장바구니 목록 저장
        req.setAttribute("cartList", cartList);

        // JSP 페이지로 포워딩
        req.getRequestDispatcher("sangjo/cartList.jsp").forward(req, resp);
    }
}