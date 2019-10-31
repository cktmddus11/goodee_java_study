package model2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
// Model 기능을 담당하는 클래스
// Dao : Data Access Object 데이터베이스 로직 담당
public class MemberDao {
	public Member selectOne(String id) {
		// id : 화면에 입력된 아이디
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet 	rs = null;
		String sql = "select *from member where binary id = ?"; // binary 대소문자구분?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { // return null 전에 무조건실행
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public int insert(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member (id, pass, name, gender, email, tel, picture) "
				+"values (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2,  m.getPass());
			pstmt.setString(3,  m.getName());
			pstmt.setInt(4,  m.getGender());
			pstmt.setString(5,  m.getEmail());
			pstmt.setString(6,  m.getTel());
			pstmt.setString(7, m.getPicture());
			// int executeUpdate() :  변경된 레코드 건수 
			return pstmt.executeUpdate(); // insert 성공 : 1
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { // pstmt.executeUpdate() 리턴을 해도 커넥션은 끊고감
			DBConnection.close(conn, pstmt, null);
		}
		return 0; // insert 실패 
		
	}
	public List<Member> list(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			String sql = "select *from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m);
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally { // pstmt.executeUpdate() 리턴을 해도 커넥션은 끊고감
			DBConnection.close(conn, pstmt, null);
		}
	return null;
		
	}
	public int update(Member mem) { 
		// mem : 사용자가 입력한 회원정보 저장. 변경될 내용을 가지고 있는 객체 
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set email = ?, gender = ?, tel = ?, picture = ?, name = ? where id= ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  mem.getEmail());
			pstmt.setInt(2,  mem.getGender());
			pstmt.setString(3, mem.getTel());
			pstmt.setString(4, mem.getPicture());
			pstmt.setString(5, mem.getName());
			pstmt.setString(6,  mem.getId());
			int result  = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
		
		
	}
	public int delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int result = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
		
		
	}
	public int updatePw(String id, String pw) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set pass = ? where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2,  id);
			int result  = pstmt.executeUpdate();
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0;
		
	}
	public String selectID(String email, String tel) {
		Connection conn= DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id from member where email = ? and tel = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("id");
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public String selectPW(String email, String tel, String id) {
		Connection conn= DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select pass from member where email = ? and tel = ? and id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			pstmt.setString(3, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("pass");
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	
}
