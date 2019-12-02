package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;
import model.mapper.MemberMapper;

public class BoardDao {
	// 현재 등록된 게시물 번호 중 최대값을 리턴
	private Map<String, Object> map = new HashMap<String, Object>();
	private Class<BoardMapper> cls = BoardMapper.class;
	// 최대 게시물 번호
	public int maxnum() {
		SqlSession session = DBConnection.getConnection();

		try {
			return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;

	}
 // 게시물 등록
	public boolean insert(Board board) {
		SqlSession session = DBConnection.getConnection();
		try {
			int result =  session.getMapper(cls).insert(board);
			if(result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;
	}

	public int boardCount(String column, String find) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			if(column != null) {
				String col[] = column.split(",");
				map.put("col1", col[0]);
				if(col.length == 2) {
					map.put("col2", col[1]);
				}
				map.put("find", find);
			}
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return 0;
	}

	public List<Board> list(int pageNum, int limit, String column, String find) {
		SqlSession session = DBConnection.getConnection();
		try {
				map.clear();
				map.put("start", (pageNum - 1) * limit);
				map.put("limit", limit);
				if(column != null) {
					String[]  col = column.split(",");
					map.put("col1", col[0]);
					if(col.length == 2) {
						map.put("col2", col[1]);
					}
					map.put("find", find);
				}
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}

	public Board selectOne(int num) {
		SqlSession session = DBConnection.getConnection();
		try {
			map.clear();
			map.put("num", num);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return null;
	}
	// 조회수 증가
	public void readcntadd(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			session.getMapper(cls).readcntadd(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		
	}
	// 답글 순서 지정
	public void grpStepAdd(int grp, int grpstep) {
		SqlSession session = DBConnection.getConnection();
		try {
			session.getMapper(cls).getStepAdd(grp, grpstep);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}

	}
// 게시글 수정
	public boolean update(Board b) {
		SqlSession session = DBConnection.getConnection();
	
		try {
			return session.getMapper(cls).update(b);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(session);
		}
		return false;

	}
// 게시글 삭제
	public boolean delete(int num) {
		SqlSession session = DBConnection.getConnection();

		try {
			int result = session.getMapper(cls).delete(num);
			if(result > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return false;

	}
	public List<Map<String, Integer>> boardgraph() {
		SqlSession session = DBConnection.getConnection();
		List<Map<String, Integer>> map = null;
		try {
			map = session.getMapper(cls).graph();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(session);
		}
		return map;
	}

}
