package sangjo.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.control.CategoryControl;
import sangjo.control.IndexControl;
import sangjo.control.OrderControl;
import sangjo.control.ProductInfoControl;
import sangjo.control.ProductListControl;
import sangjo.control.TestPageControl;
import sangjo.control.MyPageControl;

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
		
		map.put("/myPage.do", new MyPageControl());// 마이페이지
		map.put("/index.do", new IndexControl());// 메인페이지 오픈
		map.put("/order.do", new OrderControl()); // 주문
		map.put("/category.do", new CategoryControl()); // 카테고리
		map.put("/productList.do", new ProductListControl()); // 상품목록
		map.put("/productInfo.do", new ProductInfoControl()); // 상품상세
		
		
		
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
