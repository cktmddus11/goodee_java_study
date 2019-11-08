package model;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBConnection {
	private static SqlSessionFactory sqlMap;
	static {
		// mybatis-config.xml 파일의 위치
		String resource="model/mapper/mybatis-config.xml";
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader(resource);
		}catch(IOException e) {
			e.printStackTrace();
		}
		// build : Reader로부터 읽어서 Connection 객체성정,
		// 			sql구문을 저장하고있는 컨테이너 설정
		sqlMap = new SqlSessionFactoryBuilder().build(reader);
	}
	// 접근제어자 없 -> 같은 패키지내에서만 접근가능 
	static SqlSession getConnection() {
		return sqlMap.openSession();// 설정한 Connection 객체로 db와 연결
	}
	static void close(SqlSession session) {
		session.commit(); // commit해야지 반영됨
		session.close();
	}
}
