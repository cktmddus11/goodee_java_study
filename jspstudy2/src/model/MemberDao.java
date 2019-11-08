package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.MemberMapper;
// Model ����� ����ϴ� Ŭ����
// Dao : Data Access Object �����ͺ��̽� ���� ���
public class MemberDao {
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<MemberMapper> cls = MemberMapper.class;
	public Member selectOne(String id) {
		// id : ȭ�鿡 �Էµ� ���̵�
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("id", id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // return null ���� �����ǽ���
			DBConnection.close(session);
		}
		return null;
	}
	// ȸ�����
	public int insert(Member m) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).insert(m);
		}catch(Exception e) {
			e.printStackTrace();
		}finally { // pstmt.executeUpdate() ������ �ص� Ŀ�ؼ��� ����
			DBConnection.close(session);
		}
		return 0; // insert ���� 
		
	}
	public List<Member> list(){
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).select(null);
		}catch(Exception  e) {
			e.printStackTrace();
		}finally { // pstmt.executeUpdate() ������ �ص� Ŀ�ؼ��� ����
			DBConnection.close(session);
		}
	return null;
		
	}
	public int update(Member mem) { 
		// mem : ����ڰ� �Է��� ȸ������ ����. ����� ������ ������ �ִ� ��ü 
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).update(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int delete(String id) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
	}
	public int updatePw(String id, String pw) {
		SqlSession session = DBConnection.getConnection();
		try {
			return session.getMapper(cls).updatePw(id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return 0;
		
	}
	public String selectID(String email, String tel) {
		SqlSession session = DBConnection.getConnection();
		String sql = "select id from member where email = ? and tel = ?";
		try {
			/*
			 * map.clear(); map.put("id", id);
			 */
			return session.getMapper(cls).selectID(email, tel);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
		
	}
	public String selectPW(String email, String tel, String id) {
		SqlSession session= DBConnection.getConnection();
		String sql = "select pass from member where email = ? and tel = ? and id=?";
		try {
			/*
			 * map.clear(); map.put("id", id);
			 */
			return session.getMapper(cls).selectPW(email, tel, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return null;
		
	}
	
}
