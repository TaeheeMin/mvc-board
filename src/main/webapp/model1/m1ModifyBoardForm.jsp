<%@page import="model1.vo.Board"%>
<%@page import="model1.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/model1/m1BoardList.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>M1 Modify Board Form</title>
	</head>
	
	<body>
		<h1>MODEL1 게시글 수정</h1>
		<%
			BoardService boardService = new BoardService();
			Board board = boardService.getBoardOne(no);
		%>
		<div>
			<a href="<%=request.getContextPath()%>/model1/m1BoardList.jsp">홈으로</a>
		</div>
		
		<form action="<%=request.getContextPath()%>/model1/m1ModifyBoardAction.jsp?no=<%=no%>" method="post">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" style="width:90%;" value="<%=board.getTitle()%>">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="100" name="content" ><%=board.getContent() %></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>