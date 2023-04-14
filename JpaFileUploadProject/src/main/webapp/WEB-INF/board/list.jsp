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
	<div style="margin: 50px 50px;">
	<h2 class="alert alert-info" style="width: 600px;">총 ${totalCount }개의 글이 있습니다</h2>
	<button type="button" class="btn btn-info" onclick="location.href='writeform'">글쓰기</button>

	<table class="table table-bordered" style="width: 600px;">
	<caption>목록</caption>
		<tr>
		<th width="50">번호</th>
		<th width="300">제목</th>
		<th width="100">작성자</th>
		<th width="150">작성일</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>
			<a href="detail?num=${dto.num }">${dto.subject }</a>
			</td>
			<td>${dto.writer }</td>
			<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy.MM.dd"/> </td>
		</tr>		
		</c:forEach>
	
	</table>
	
	</div>
</body>
</html>