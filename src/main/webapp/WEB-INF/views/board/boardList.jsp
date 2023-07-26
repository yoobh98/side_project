<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align: center;">

	<h1>게시판 리스트</h1>

	<table border="1">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
			<c:choose>
				<c:when test="${boardList != null}">
					<c:forEach var="list" items="${boardList}">
						<tr>
							<th>${list.title}</th>
							<th>${list.content}</th>
							<th>${list.writeId}</th>
							<th>${list.writeDate}</th>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<th colspan="4">없음 그냥</th>
					</tr>
				</c:otherwise>
			</c:choose>
	</table>
	<a href="goWriteForm">글 쓰러가기</a>

</div>
</body>
</html>