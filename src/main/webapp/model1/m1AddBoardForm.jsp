<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>m1 Add Board Form</title>
	</head>
	<body>
		<h1>게시글 입력</h1>
		<form method="post" action="<%=request.getContextPath()%>/model1/m1AddBoardAction.jsp">
			<table border="1">
				<tr>
					<td>title</td>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<td>content</td>
					<td>
						<textarea rows="5" cols="50" name="content"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">글입력</button>
		</form>
	</body>
</html>
