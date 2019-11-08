package mybatisjava;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.StudentMapper3;

public class Main4 {
	private final static String ns = "mapper.StudentMapper3.";
	private static SqlSessionFactory sqlMap;
	static { // static 초기화 블럭
		InputStream input = null;
		try {
			input = Resources.getResourceAsStream("mapper/mybatis-config.xml");
		} catch (IOException e) {
			e.printStackTrace();
		} // 컨테이너에 들어있는거 읽어와서 생성?
		sqlMap = new SqlSessionFactoryBuilder().build(input);
	}

	public static void main(String[] args) {
		SqlSession session = sqlMap.openSession();
		System.out.println("모든 학생 정보 조회하기");
		// getMapper이런식으로 쓰는게 더 좋음
		List<Student> list = session.getMapper(StudentMapper3.class).select(null);
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("xml 방식과 동일하게 호출");
		list = session.selectList(ns + "select");
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("1학년 학생 정보 조회하기");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grade", 1);
		list = session.getMapper(StudentMapper3.class).select(map);
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("학번 981213 정보 조회하기");
		map.clear();
		map.put("studno", 981213);
		list = session.getMapper(StudentMapper3.class).select(map);
		for (Student s : list) {
			System.out.println(s);
		}

		System.out.println("홍길동 학생 정보 추가하기");
		
		Student st = new Student(); 
		st.setStudno(1000);
		st.setName("홍길동");
		st.setJumin("1234");
		st.setId("hongkd"); 
		int result = session.getMapper(StudentMapper3.class).insert(st); 
		System.out.println(result+ "건 추가"); 
		
		map.clear(); 
		map.put("studno", 1000); 
		list = session.getMapper(StudentMapper3.class).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("홍길동 학생의 학년은 1학년 "
				+ "몸무게 : 80, 키 : 175 로 변경하기");
		
		st.setWeight(80);
		st.setHeight(175);
		st.setGrade(1);
		result = session.getMapper(StudentMapper3.class).update(st); 
		System.out.println(result+ "건 수정"); 

		list = session.getMapper(StudentMapper3.class).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		System.out.println("학번이 1000번인 홍길동 학생 정보 삭제하기");
		result =  session.getMapper(StudentMapper3.class).delete("홍길동", 1000);
		for (Student s : list) {
			System.out.println(s);
		}
		System.out.println(result+ "건 삭제"); 
		list = session.getMapper(StudentMapper3.class).select(map);
		for (Student s : list) {
			System.out.println(s);
		}
		
		
	}
}
