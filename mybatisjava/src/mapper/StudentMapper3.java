package mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import mybatisjava.Student;

//mapper.StudentMapper3 sql����
/*
xml�� sql���ص��Ǵµ� ���� ������ xml�� �ؾߵ�?
xml�� �������̽� �ϳ��� ���ִٰ� �����ؾ���

interface ����� �̿��� mybatis���
�޼����� �̸� : id �Ӽ� -> �޼����� �̸��� �ߺ� �Ұ�. �����ε��� �Ұ�
		xml���ִ� id�Ӽ����� �������̽� �޼����̸��� �����ϸ� �ȵ�
�Ű����� : parameterType �Ӽ���. 
 				�ΰ��̻��� ���� �Ű����� ���� x -> Map��ü, ��ü�� �����ؾ��Ѵ�.
 				=> �ΰ� �̻� �Ű����� ������ ������̼��� �̿��Ͽ� ���������� map��ü ��������
����Ÿ�� : resultType �Ӽ����� �ǹ�



*/
public interface StudentMapper3 {
	// �������̽��� ���������� �׻� public 
	//@Select("select *from student")
//	List<Student> select(); // mapper.StudentMapper3.select ��Ű����.�������̽��� -> �������̽���
	//List<Student> select(int i); // �̸��� ���� �Ű����� �ִ°� ��� x -> id�� ������ ���̱� ������
	
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
