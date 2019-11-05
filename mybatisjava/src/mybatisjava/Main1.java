package mybatisjava;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mapper.Member;

public class Main1 {

	public static void main(String[] args) {
		SqlSessionFactory sqlMap = null;
		Reader reader = null;
		
		try {
			// mapper 패키지의 mybatis-config.xml 을 읽기
			reader = Resources.getResourceAsReader("mapper/mybatis-config.xml");
			// mybatis 환경을 읽어서 컨테이너에 저장함.
			// 1. connection 정보
			// sql 구문중복
			sqlMap = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		int x = 0;
		
		// Connction 에서 session 할당
		SqlSession session = sqlMap.openSession();
		// selectOne : 데이터르 ㄹ db부터 조회하기. 결과가 레코드가 1개인 경우
		// member.count : sql 구문의 id속성값 
		x = (Integer)session.selectOne("member.count");
		System.out.println("member 테이블의 레코드 갯수 : "+x);
		// selectList : 데이터의 db로 부터 조회하기 : 결과가 여러개인 경우
		List<Member> list = session.selectList("member.list");
		for(Member m : list) {
			System.out.println(m);
		}
		System.out.println("============");
		// admin 정보를 조회하기
		Member m = session.selectOne("member.selectid", "admin");
		System.out.println(m);
		System.out.println("============");
		// id가 test를 가진 사람을 조회하기
		System.out.println("id가 test를 가진 사람을 조회하기");
		 List<Member> list2 = session.selectList("member.selectname", "test");
		for(Member mem : list2) {
			System.out.println(mem);
		}
		System.out.println("=======여러개의 파라미터 전달=====");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", "admin");
		map.put("name", "asdf");
		list = session.selectList("member.selectidname", map);
		for(Member mem : list) {
			System.out.println(mem);
		}
	}

}
