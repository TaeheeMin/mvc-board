<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model1.vo.*"%>
<%
	// 컨트롤러에서 공유한 모델 데이터 셋팅
	ArrayList<Board> list = (ArrayList<Board>)(request.getAttribute("list"));
%>
<!-- view -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MVC BOARD LIST</title>
	</head>
	
	<body>
		<h1>MVC BOARD LIST</h1>
		<div>
			<a href="<%=request.getContextPath()%>/mvc/AddBoardFormController">글등록</a>
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