<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("title") == null || request.getParameter("title").equals("")
		|| request.getParameter("content") == null || request.getParameter("content").equals("")
		|| request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspBoardList.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// db연결
	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("드라이버 로딩");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
	String sql ="UPDATE board SET title =?, content=? WHERE no=?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, title);
	stmt.setString(2, content);
	stmt.setInt(3, no);
	int result = 0; 
	result = stmt.executeUpdate();
	System.out.println("result");
	
	// 결과
	if(result == 1) {
		// one으로 이동
		System.out.println("수정성공");
		response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp"); 
	} else {
		// 폼이동
		System.out.println("입력실패");
		response.sendRedirect(request.getContextPath()+"/jsp/jspBoardList.jsp");
	}
%>