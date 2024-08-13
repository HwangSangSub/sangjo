package com.sangjo.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sangjo.common.Control;

public class ImageDownLoad implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");// 한글깨짐 방지
		ServletInputStream inputStream = req.getInputStream();
		ObjectMapper mapper = new ObjectMapper();
		// 자바스크립트로 보내진 json 값을 객체로 변환하자.
		// "[{"imgSrc":"url","prdName": "상품"},.... => 자바 객체
		List<Map<String, String>> list = mapper.readValue(inputStream,	new TypeReference<List<Map<String, String>>>() {});
		String dml = "";
		for (Map<String, String> map : list) {
			String prodImage = map.get("prodImage");
			String prodName = map.get("prodName");
			String prodPrice = map.get("prodPrice");
			String categoryNo = map.get("category_no");

			// 파일 생성 함수 호출
			fileCreate(prodImage, prodName);
			// dml insert 구문 생성 함수 호출
			dml += dataCreate(categoryNo, prodName, prodPrice);
		}
		// sql 문장들을 콘솔에 출력한후 , 사용자는 콘솔의 내용을
		// 복붙해 사용한다.
		System.out.println(dml);

		PrintWriter out = resp.getWriter();
		out.print("{\"retCode\": \"Success\"}");
	}
	private String dataCreate(String categoryNo, String prodName, String prodPrice) {
		String sql = String.format("INSERT INTO tbl_product (product_no, category_no, product_name, product_price)"
				+ "VALUES(product_seq.NEXTVAL,'%s','%s',%s,'%s.jpg'); \n"
				, categoryNo,prodName,prodPrice,prodName);
		return sql;
	}
	private void fileCreate(String prodImage, String prodName) {
		String path = prodImage;
		String name = prodName.replaceAll("/", "");
		name = name.replace("*", "");

		try {
			URL url = new URL(path);
			InputStream inputStream = url.openStream();
			BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);

			FileOutputStream fileOutputStream = new FileOutputStream("c:/sangjo/images/" + name + ".jpg");
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);

			while (true) {
				int read = bufferedInputStream.read();
				if (read == -1)
					break;
				bufferedOutputStream.write(read);
			}
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
			fileOutputStream.flush();
			fileOutputStream.close();
			bufferedInputStream.close();
			inputStream.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
