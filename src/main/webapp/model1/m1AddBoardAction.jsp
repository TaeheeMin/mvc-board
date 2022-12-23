<%@page import="model1.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("title") == null || request.getParameter("title").equals("") || request.getParameter("content") == null || request.getParameter("content").equals("") ) {
		response.sendRedirect(request.getContextPath() + "/model1/m1AddBoardForm.jsp");
		return;
	}
	
	// 값 받아오기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// db연결
	int result = 0;
	BoardService boardService = new BoardService();
	result = boardService.addBoard(content, title);
	
	// 결과
	if(result == 1) {
		// 리스트로 이동
		System.out.println("입력성공");
		response.sendRedirect(request.getContextPath()+"/model1/m1BoardList.jsp"); 
	} else {
		// 폼이동
		System.out.println("입력실패");
		response.sendRedirect(request.getContextPath()+"/model1/m1AddBoardForm.jsp");
	}
%>