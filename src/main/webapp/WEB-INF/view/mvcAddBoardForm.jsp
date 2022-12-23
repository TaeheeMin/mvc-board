<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	C -> M -> V
	C -> M ====> redirect =====> 다른 C 호출 
	view는 보안위해 숨겨놔서 C필요없지만 C 붙여줌
	C => v
-->
 <!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>MVC add Board Form</title>
	</head>
	
	<body>
		<h1>MVC 게시글 입력</h1>
		
		<div>
			<a href="<%=request.getContextPath()%>/mvc/BoardListController">홈으로</a>
		</div>
		
		<form action="<%=request.getContextPath()%>/mvc/AddBoardActionController" method="post">
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