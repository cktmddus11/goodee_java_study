package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 sql구문
/*
xml로 sql안해도되는데 동적 쿼리만 xml로 해야됨?
xml과 인터페이스 하나로 되있다고 생각해야함

interface 방식을 이용한 mybatis사용
메서드의 이름 : id 속성 -> 메서드의 이름은 중복 불가. 오버로딩이 불가
		xml에있는 id속성값과 인터페이스 메서드이름이 동일하면 안됨
매개변수 : parameterType 속성값. 
 				두개이상의 값을 매개변수 지정 x -> Map객체, 빈객체로 지정해야한다.
 				=> 두개 이상 매개변수 지정시 어노테이션을 이용하여 내부적으로 map객체 생성가능
리턴타입 : resultType 속성값을 의미



*/
public interface StudentMapper3 {
	// 인터페이스의 접근제어자 항상 public 
	//@Select("select *from student")
//	List<Student> select(); // mapper.StudentMapper3.select 패키지명.인터페이스명 -> 인터페이스명
	//List<Student> select(int i); // 이름이 같고 매개변수 있는거 허용 x -> id는 유일한 값이기 때문에
	
	@Select({"<script>", 
		"select *From student",
		"<if test='grade != null'>"
		+ "where grade = #{grade}"
		+ "</if>"
		+ "<if test='studno != null'>"
		+ "where studno = #{studno}"
		+ "</if>"
		+ "</script>"
	})
	List<Student> select(Map<String, Object> map); // mapper.StudentMapper3.select
	
	@Insert("insert into student (studno, name, jumin, id) "
			+ "values (#{studno}, #{name}, #{jumin}, #{id})")
	int insert(Student st);
	
	@Update("update student set weight=#{weight},"
			+ " height=#{height}, grade=#{grade} where studno = #{studno}")
	int update(Student st);
	
	@Delete("delete from student where name = #{name} and studno = #{studno}")
	//int delete(String name);
	//int delete(Student st);
	int delete(@Param("name") String name, @Param("studno") int studno);
	
	
	
}
