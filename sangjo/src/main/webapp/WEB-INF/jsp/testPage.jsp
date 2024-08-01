<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>테스트 페이지 입니다.</h1>
	<c:forEach var="board" items="${boardList}">
	<p>${board.boardNo}</p>
	<p>${board.boardTitle}</p>
	<p>${board.boardContent}</p>
	<p>${board.boardType}</p>
	<p>${board.memberId}</p>
	<p>${board.regDate}</p>
	</c:forEach>
</body>
</html>