package sangjo.control;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sangjo.common.Control;
import sangjo.service.OrderService;
import sangjo.service.OrderServiceImpl;
import sangjo.vo.OrderVO;

public class OrderControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "viewCart"; // 기본적으로 장바구니 보기로 설정
        }

        OrderService osv = new OrderServiceImpl();
        List<OrderVO> list;

        switch (action) {
            case "addToCart":
                addToCart(req, osv);
                req.getRequestDispatcher("sangjo/cart.tiles").forward(req, resp);
                break;
            case "viewCart":
                list = osv.getOrderList(new OrderVO()); // 빈 OrderVO로 장바구니 목록 조회
                req.setAttribute("OrderList", list);
                req.getRequestDispatcher("sangjo/cart.tiles").forward(req, resp);
                break;
            default:
                req.getRequestDispatcher("sangjo/error.tiles").forward(req, resp);
                break;
        }
    }

    private void addToCart(HttpServletRequest req, OrderService osv) throws ServletException, IOException {
        String memberId = (String) req.getSession().getAttribute("memberId");
        if (memberId == null) {
            req.setAttribute("errorMessage", "로그인 후 장바구니에 담을 수 있습니다.");
            return;
        }
        
        int productNo = Integer.parseInt(req.getParameter("productNo"));
        int odCnt = Integer.parseInt(req.getParameter("odCnt"));
        
        OrderVO ovo = new OrderVO();
        ovo.setMemberId(memberId);
        ovo.setProductNo(productNo);
        ovo.setOdCnt(odCnt);
        ovo.setOdPrice(10000); // 실제 가격은 상품 정보를 통해 받아야 함
        
        osv.addOrderToCart(ovo); // 장바구니에 추가하는 서비스 메서드 호출
    }
}