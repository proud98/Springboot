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
	
	<h3 class="alert alert-info">${totalCount }</h3>
	<button type="button" class="btn btn-info" onclick="location.href='form'">상품추가</button><br><br>
	
	<table class="table table-bordered" style="width: 900px;">
	<caption><b>상품목록</b></caption>
		<tr bgcolor="#fffcc">
		<th width="100">번호</th>
		<th width="300">상품명</th>
		<th width="100">색상</th>
		<th width="200">가격</th>
		<th width="200">입고일</th>
		</tr>
		
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="5">
				<b>등록된 상품이 없습니다</b>
				</td>
			</tr>
		</c:if>
		
		<c:if test="${totalCount>0 }">
			<c:forEach var="s" items="${list }">
			<c:set var="no" value="${no-1 }"/>
				<tr>
				<td>${no }</td>
				<td><a href="detail?num=${s.num }&currentPage=${currentPage}" style="color: black">${s.sangpum }</a></td>
				<td>${s.color }</td>
				<td><fmt:formatNumber value="${s.price }" type="currency" /> </td>
				<td>${s.ipgoday }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	
	<c:if test="${totalCount>0 }">
			<div style="width: 800px; text-align: center;" class="container">
				<ul class="pagination"> 
				
					<!-- 이전 -->
					<c:if test="${startPage>1 }">
					<li>
					<a href="list?currentPage=${startPage-1 }">이전</a>
					</li>
					</c:if>
					
					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${pp==currentPage }">
						<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
						</li>
						</c:if>
						
						<c:if test="${currentPage!=pp }">
						<li>
						<a href="list?currentPage=${pp }">${pp }</a>
						</li>
						</c:if>
					</c:forEach>
					
					<!-- 다음  -->
					<c:if test="${endPage<totalPage }">
					<li>
					<a href="list?currentPage=${endPage+1 }">다음</a>
					</li>
					</c:if>
				
				</ul>
			
			</div>
		
		</c:if>
​
</body>
</html>