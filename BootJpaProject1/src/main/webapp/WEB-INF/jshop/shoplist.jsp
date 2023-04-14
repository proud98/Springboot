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
	<h3 class="alert alert-info" style="width: 800px;">총 ${totalCount }개의 정보가 있어요 </h3>
	<button type="button" class="btn btn-info" onclick="location.href='form'" >글쓰기</button>
	
	<table class="table table-bordered" style="width: 700px;">
	<caption><b>상품목록</b></caption>
		<tr>
		<th width="50">번호</th>
		<th width="250">상품명</th>
		<th width="100">가격</th>
		<th width="150">입고일</th>
		<th width="150">등록일</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>
			<a href="detail?num=${dto.num }">${dto.sangpum }</a>&nbsp;
			<img src="/${dto.photo }.jpg" style="width: 30px;">
			</td>
			<td><fmt:formatNumber value="${dto.price }" /> </td>
			<td>${dto.ipgoday }</td>
			<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy.MM.dd"/> </td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>