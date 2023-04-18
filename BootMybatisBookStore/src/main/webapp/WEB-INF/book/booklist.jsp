<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>
</head>
<body>
	<h3 class="alert alert-warning">총 ${totalCount }개의 책 정보가 있습니당</h3>
	<button type="button" class="btn btn-warning" onclick="location.href='add'">책 추가</button>
	<br><br>
	
	<span>
	<c:forEach var="dto" items="${list }" varStatus="i">
	<span>
	<img alt="" src="../upload/${dto.bookphoto }" style="max-width: 150px;">
	</span>
	
	</c:forEach>
	</span>
</body>
</html>