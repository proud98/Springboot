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
	<h2 class="alert alert-info">총 ${count }명의 회원이 있습니다</h2><br>
	<table class="table table-bordereds" style="width: 800px;">
	<caption><b>전체 회원 명단</b></caption>
		<tr style="background-color: #ffccc">
		<th style="width: 70px;">번호</th>
		<th style="width: 200px;">이름</th>
		<th style="width: 100px;">아이디</th>
		<th style="width: 200px;">핸드폰</th>
		<th style="width: 200px;">주소</th>
		<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td><img src="../photo/${dto.photo }" width="80"> &nbsp; ${dto.name }</td>
				<td>${dto.id }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td><input type="checkbox" class="del" num=${dto.num }> </td>
			</tr>
		</c:forEach>
	
	<tr>
		<td colspan="7" align="right">
		<button type="button" class="btn btn-info" id="btnmemberdel">삭제</button>
		</td>
	</tr>	
	</table>
	
</body>
</html>