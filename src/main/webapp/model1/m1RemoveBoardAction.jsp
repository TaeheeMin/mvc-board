<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model1.service.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/model1/m1BoardList.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
	
	BoardService boardService = new BoardService();
	int result = boardService.removeBoard(no);
	
	// 결과
	if(result == 1) {
		// one으로 이동
		System.out.println("삭제성공");
		response.sendRedirect(request.getContextPath()+"/model1/m1BoardList.jsp"); 
	} else {
		// 폼이동
		System.out.println("삭제실패");
		response.sendRedirect(request.getContextPath()+"/model1/m1BoardOne.jsp?no="+no);
	}
%>