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
	
	// update
	
	// delete
}
