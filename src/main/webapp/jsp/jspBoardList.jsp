<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP Board List</title>
	</head>
	
	<body>
		<h1>JSP BOARD LIST</h1>
		<%
			Class.forName("org.mariadb.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
			String sql ="SELECT no, title FROM board";
			
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
		%>
		<div>
			<a href="<%=request.getContextPath()%>/jsp/jspAddBoardForm.jsp">글등록</a>
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
					// Set타입은 순서가 없으니 Iterator 패턴 사용해 순서가 있는것처험 사용
					// ResultSet은 내부적 Iterator 패턴이 적용된 API 있음
					while(rs.next()) {
				%>
						<tr>
							<td><%=rs.getInt("no")%></td>
							<td>
								<a href='<%=request.getContextPath()%>/jsp/jspBoardOne.jsp?no=<%=rs.getInt("no")%>'>
									<%=rs.getString("title")%>
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