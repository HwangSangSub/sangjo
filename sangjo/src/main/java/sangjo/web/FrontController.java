package sangjo.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;
import sangjo.control.IndexControl;
import sangjo.control.TestPageControl;

public class FrontController extends HttpServlet {
	Map<String, Control> map;
	public FrontController() {
		map = new HashMap<String, Control>();
	}
	// 여러 요청들 등록하기
	@Override
	public void init() throws ServletException {
		map.put("/testPage.do", new TestPageControl());
		map.put("/index.do", new IndexControl());// 메인페이지 오픈
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
