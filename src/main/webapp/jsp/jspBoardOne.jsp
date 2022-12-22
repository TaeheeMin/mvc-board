<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 유효성 검사 
	if(request.getParameter("no") == null) {
		response.sendRedirect(request.getContextPath() + "/jsp/jspAddBoardList.jsp");
		return;
	}
	
	// 값 받아오기
	int no = Integer.parseInt(request.getParameter("no"));
	// Integer wrapper 클래스의 parseInt static메서드 사용해서 String->int타입으로 변경
	//오토 언박싱 & 오토 박싱 -> 정리파일 참고
		
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
		<title>boardOne</title>
	</head>
	
	<body>
		<h1>게시글 보기</h1>
		
		<div>
			<a href="<%=request.getContextPath()%>/jsp/jspBoardList.jsp">홈으로</a>
		</div>
		<table border="1">
			<%
				if(rs.next()) {
			%>
					<tr>
						<th>제목</th>
						<td>
							<%=rs.getString("title")%>
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<%=rs.getString("content") %>
						</td>
					</tr>
			<%
				}
			%>
		</table>
		<div>
			<a href='<%=request.getContextPath()%>/jsp/jspModifyBoardForm.jsp?no=<%=rs.getInt("no") %>'>수정</a>
			<a href='<%=request.getContextPath()%>/jsp/jspRemoveBoard.jsp?no=<%=rs.getInt("no") %>'>삭제</a>
		</div>
	</body>
</html>