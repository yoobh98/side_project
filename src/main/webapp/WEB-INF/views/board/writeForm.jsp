<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align: center;">

	<h1>게시판</h1>

	<form action="writeBoard" method="post">
		제목 : <input type="text" name="title"><br>
		내용 : <input type="text" name="content"><br>
		<input type="submit" value="등록">
	</form>

</div>

</body>
</html>