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
			conn.setAutoCommit(false);
			list = boardDao.selectBoardList(conn);
			conn.commit();
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
			conn.setAutoCommit(false);
			board = boardDao.selectBoardOne(conn, no);
			conn.commit();
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
	
	// add
	public int addBoard(String content, String title) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			result = boardDao.insertBoard(conn, title, content);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// modify
	// 1-2) modify
	public int modifyBoard(int no, String title, String content) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			result = boardDao.updateBoard(conn, no, title, content);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	// remove
	public int removeBoard(int no) {
		int result = 0;
		Connection conn = null;
		boardDao = new BoardDao();
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			result = boardDao.deleteBoard(conn, no);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
				System.out.println("예외발생");
			}
			e.printStackTrace();
			
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
}
