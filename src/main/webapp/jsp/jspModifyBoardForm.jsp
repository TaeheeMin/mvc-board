<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspBoardOne.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
	
	// db연결
	Class.forName("org.mariadb.jdbc.Driver");
	System.out.println("드라이버 로딩");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/mvc", "root", "java1234");
	String sql ="SELECT no, title, content FROM board WHERE no=?";
	
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, no);
	ResultSet rs = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP Modify Board Form</title>
	</head>
	
	<body>
		<h1>게시글 수정</h1>
		
		<div>
			<a href="<%=request.getContextPath()%>/jsp/jspBoardList.jsp">홈으로</a>
		</div>
		<form action="<%=request.getContextPath()%>/jsp/jspModifyBoardAction.jsp?no=<%=no%>" method="post">
			<table border="1">
				<%
					if(rs.next()) {
				%>
						<tr>
							<th>제목</th>
							<td>
								<input type="text" name="title" value="<%=rs.getString("title")%>" style="width:90%;">
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="10" cols="100" name="content"><%=rs.getString("content") %></textarea>
							</td>
						</tr>
				<%
					}
				%>
			</table>
			<button type="submit">수정</button>
		</form>
	</body>
</html>