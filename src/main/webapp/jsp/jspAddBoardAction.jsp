<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("title") == null || request.getParameter("title").equals("") || request.getParameter("content") == null || request.getParameter("content").equals("") ) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspAddBoardForm.jsp");
		return;
	}
	
	// 값 받아오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// db연결
	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("드라이버 로딩");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
	String sql ="INSERT INTO board(title, content) VALUES(?,?)";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, title);
	stmt.setString(2, content);
	
	int result = 0;
	result = stmt.executeUpdate();
	
	// 틀라이언트에게 재요청(redirect) => 현재 사용 방법
	// server에서 서버 자원에게 부탁(forward / include) => 서버 주소가 필요없다. getContextPath()
	
	// 결과
	if(result == 1) {
		// 리스트로 이동
		System.out.println("입력성공");
		response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp"); // => 주체가 클라이언트 getContextPath() 필요
	} else {
		// 폼이동
		System.out.println("입력실패");
		response.sendRedirect(request.getContextPath()+"/jsp/jspAddBoardForm.jsp");
	}
%>