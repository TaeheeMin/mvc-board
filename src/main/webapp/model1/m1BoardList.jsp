<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.service.BoardService"%>
<%@page import="model1.*" %>
<%@page import="model1.vo.*"%>
<%@page import="model1.dao.*"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MODEL1 BOARD LIST</title>
	</head>
	
	<body>
		<h1>MODEL1 BOARD LIST</h1>
		<%
			BoardService boardService = new BoardService();
			ArrayList<Board> list = boardService.getBoardList();
		%>
		<div>
			<a href="<%=request.getContextPath()%>/model1/m1AddBoardForm.jsp">글등록</a>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>no</th>
					<th>title</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Board b : list) {
				%>
						<tr>
							<td><%=b.getNo()%></td>
							<td>
								<a href='<%=request.getContextPath()%>/model1/m1BoardOne.jsp?no=<%=b.getNo()%>'>
									<%=b.getTitle()%>
								</a>
							</td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</body>
</html>