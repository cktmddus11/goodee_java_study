package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper3;


public class Main4 {
	private final static String NS = "mapper.StudentMapper3"; 
	private static SqlSessionFactory sqlMap;
	static { // static 초기화 블럭 
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		}catch(IOException e) {
			e.printStackTrace();
		} // 컨테이너에 들어있는거 읽어와서 생성?
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}
	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("모든 학생 정보 조회하기");
		// getMapper이런식으로 쓰는게 더 좋음
		List<Student> list = session.getMapper(StudentMapper3.class).select();
		for(Student s : list) {
			System.out.println(s);
		}
		 
//		list = session.selectList(NS+"select");
//		for(Student s : list)System.out.println(s);
		
	}
}
