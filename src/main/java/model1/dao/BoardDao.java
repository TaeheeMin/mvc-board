package model1.dao;

import java.sql.*;
import java.util.*;
import model1.util.*;
import model1.vo.*;

public class BoardDao {
	// List
	public ArrayList<Board> selectBoardList(Connection conn) throws Exception {
		// ResultSet으로 반환타입 별로 => 평범한 타입 => list사용 = 보편적 타입
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// db연결
		String sql ="SELECT no, title FROM board";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setNo(rs.getInt("no"));
			b.setTitle(rs.getString("title"));
			list.add(b);
		}
		return list;
	}

	// selectOne
	public Board selectBoardOne(Connection conn, int no) throws Exception {
		// ResultSet으로 반환타입 별로 => 평범한 타입 => list사용 = 보편적 타입
		Board board = new Board ();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// db연결
		String sql ="SELECT no, title, content FROM board WHERE no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		rs = stmt.executeQuery();
		while(rs.next()) {
			board.setNo(rs.getInt("no"));
			board.setTitle(rs.getString("title"));
			board.setContent(rs.getString("content"));
		}
		return board;
	}
	
	// insert
	public int insertBoard(Connection conn, String title, String content) throws Exception {
		int result = 0;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO board(title, content) VALUES(?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		result = stmt.executeUpdate();
		return result;
	}
	
	// update
	public int updateBoard(Connection conn, int no, String title, String content) throws Exception {
		int result = 0;
		PreparedStatement stmt = null;
		String sql ="UPDATE board SET title =?, content=? WHERE no=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		stmt.setInt(3, no);
		result = stmt.executeUpdate();
		return result;
	}
	
	// delete
	public int deleteBoard(Connection conn, int no) throws Exception {
		int result = 0;
		PreparedStatement stmt = null;
		String sql = "DELETE FROM board WHERE no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, no);
		result = stmt.executeUpdate();
		return result;
	}
}
