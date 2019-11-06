package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import mybatisjava.Student;

//mapper.StudentMapper3 sql����
/*
xml�� sql���ص��Ǵµ� ���� ������ xml�� �ؾߵ�?
xml�� �������̽� �ϳ��� ���ִٰ� �����ؾ���

interface ����� �̿��� mybatis���
�޼����� �̸� : id �Ӽ� -> �޼����� �̸��� �ߺ� �Ұ�. �����ε��� �Ұ�
		xml���ִ� id�Ӽ����� �������̽� �޼����̸��� �����ϸ� �ȵ�
�Ű����� : parameterType �Ӽ���.  �ΰ��̻��� ���� �Ű����� ���� x -> Map��ü, ��ü�� �����ؾ��Ѵ�.
����Ÿ�� : resultType �Ӽ����� �ǹ�
*/
public interface StudentMapper3 {
	// �������̽��� ���������� �׻� public 
	@Select("select *from student")
	List<Student> select(); // mapper.StudentMapper3.select ��Ű����.�������̽��� -> �������̽���
	//List<Student> select(int i); // �̸��� ���� �Ű����� �ִ°� ��� x -> id�� ������ ���̱� ������

	
}
