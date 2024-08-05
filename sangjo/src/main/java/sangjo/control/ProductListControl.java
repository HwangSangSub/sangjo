package sangjo.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sangjo.common.Control;

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int categoryNo = Integer.parseInt(req.getParameter("categoryNo"));
		req.setAttribute("categoryNo", categoryNo);
		
		req.getRequestDispatcher("product/productList.tiles").forward(req, resp); // 페이지 재지정
	}// end exec();

}// end class
