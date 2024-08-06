package com.sangjo.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sangjo.common.Control;
import com.sangjo.control.BoardListControl;
import com.sangjo.control.CartListControl;
import com.sangjo.control.CartRemoveControl;
import com.sangjo.control.CategoryControl;
import com.sangjo.control.FindIdControl;
import com.sangjo.control.HelpDeskControl;
import com.sangjo.control.IdCheckControl;
import com.sangjo.control.IndexControl;
import com.sangjo.control.JoinControl;
import com.sangjo.control.LoginControl;
import com.sangjo.control.LogoutControl;
import com.sangjo.control.MyPageControl;
import com.sangjo.control.OrderControl;
import com.sangjo.control.OrderListControl;
import com.sangjo.control.ProductInfoControl;
import com.sangjo.control.ProductListControl;
import com.sangjo.control.TestPageControl;

public class FrontController extends HttpServlet {
	Map<String, Control> map;

	public FrontController() {
		map = new HashMap<String, Control>();
	}

	// 여러 요청들 등록하기
	@Override
	public void init() throws ServletException {
		map.put("/testPage.do", new TestPageControl());
		// 템플릿 가져온 부분을 화면에 보이게 처리

		map.put("/index.do", new IndexControl());// 메인페이지-상품목록 (화면)
		map.put("/productList.do", new ProductListControl()); // 상품목록조회 - (기능)
		map.put("/productInfo.do", new ProductInfoControl()); // 상품상세 - (화면)

		map.put("/category.do", new CategoryControl()); // 카테고리 (기능)

		map.put("/cartList.do", new CartListControl()); // 장바구니 (화면)
		map.put("/cartRemove.do", new CartRemoveControl()); // 장바구니 (삭제)

		map.put("/orderList.do", new OrderListControl()); // 주문 (화면)
		map.put("/order.do", new OrderControl()); // 주문 (기능)

		map.put("/helpDesk.do", new HelpDeskControl()); // 고객센터
		map.put("/boardList.do", new BoardListControl()); // 게시판 가져오기(기능)

		map.put("/myPage.do", new MyPageControl());// 마이페이지(화면)
		
		/*회원 파트*/
		map.put("/idCheck.do", new IdCheckControl());// 아이디 중복체크 (기능)
		map.put("/join.do", new JoinControl());// 회원가입 (기능)
		map.put("/login.do", new LoginControl());// 로그인 (기능)
		map.put("/logout.do", new LogoutControl());// 로그아웃 (기능)
		map.put("/findId.do", new FindIdControl());// 미완성 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI(); // uri 가져옴
		String context = request.getContextPath();// 프로젝트명 /BoardWeb
		String path = uri.substring(context.length()); // "/*.do"

		System.out.println(path);
		Control sub = map.get(path);

		try {
			sub.exec(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
