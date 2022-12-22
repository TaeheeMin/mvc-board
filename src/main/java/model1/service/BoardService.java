package model1.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import model1.dao.BoardDao;
import model1.util.DBUtil;
import model1.vo.Board;

public class BoardService {
	// 서비스 역할
	// 1) 예외처리 -> 트랜잭션 처리/db자원반납
	// 2) Connection 객체를 dao에 넘겨줌
	// 3) dao에 있으면 안되는 비지니스 로직 처리
	private DBUtil DBUtil;
	private BoardDao boardDao;
	
	public ArrayList<Board> getBoardList() {
		Connection conn = null;
		boardDao = new BoardDao();
		ArrayList<Board> list = null;
		try {
			conn = DBUtil.getConnection();
			//conn.setAutoCommit(false);
			list = boardDao.selectBoardList(conn);
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public Board getBoardOne(int no) {
		Connection conn = null;
		boardDao = new BoardDao();
		Board board = null;
		try {
			conn = DBUtil.getConnection();
			//conn.setAutoCommit(false);
			board = boardDao.selectBoardOne(conn, no);
			
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	
}
