<%@page import="model1.vo.Board"%>
<%@page import="model1.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspAddBoardList.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MODEL1 BOARD ONE</title>
	</head>
	
	<body>
		<h1>MODEL1 게시글 보기</h1>
		<%
			BoardService boardService = new BoardService();
			Board board = boardService.getBoardOne(no);
		%>
		<div>
			<a href="<%=request.getContextPath()%>/model1/m1BoardList.jsp">홈으로</a>
		</div>
		<table border="1">
			<tr>
				<th>제목</th>
				<td>
					<%=board.getTitle()%>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<%=board.getContent() %>
				</td>
			</tr>
		</table>
		<div>
			<a href='<%=request.getContextPath()%>/jsp/jspModifyBoardForm.jsp?no=<%=board.getNo()%>'>수정</a>
			<a href='<%=request.getContextPath()%>/jsp/jspRemoveBoard.jsp?no=<%=board.getNo()%>'>삭제</a>
		</div>
	</body>
</html>