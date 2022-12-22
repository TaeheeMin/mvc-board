<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>M1 add Board Form</title>
	</head>
	
	<body>
		<h1>MODEL1 게시글 입력</h1>
		
		<div>
			<a href="<%=request.getContextPath()%>/model1/m1BoardList.jsp">홈으로</a>
		</div>
		
		<form action="<%=request.getContextPath()%>/model1/m1AddBoardAction.jsp">
			<table border="1">
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" style="width:90%;">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="100" name="content"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">등록</button>
		</form>
	</body>
</html>