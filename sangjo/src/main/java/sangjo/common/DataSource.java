package sangjo.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataSource {
	
	public static SqlSessionFactory getInstance() {
		// config 경로의 mybatis-config.xml 을 읽는다.
		String resource =  "config/mybatis-config.xml";
		InputStream inputStream = null;
		
		try {
			inputStream = Resources.getResourceAsStream(resource);
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		SqlSessionFactory sqlSessionFactory
			= new SqlSessionFactoryBuilder().build(inputStream);
		return sqlSessionFactory;
	}
}
