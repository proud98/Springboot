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
	<h3 class="alert alert-warning">총 ${totalCount }개</h3>
	<button type="button" class="btn btn-warning" onclick="location.href='form'">글쓰기</button>
	
	<c:forEach var="a" items="${list }">
		<table class="table table-bordered">
			<tr>
				<td>
				<c:if test="${a.photoname!=null }">
					<img alt="" src="../upload/${a.photoname }" style="max-width: 150px;" align="left">
				</c:if>
				<c:if test="${a.photoname==null }">
					<img alt="" src="../upload/noimg.jpg" style="max-width: 150px;" align="left">
				</c:if>
				
				<h4>상품묭: ${a.sang }</h4>
				<h4>단가: <fmt:formatNumber value="${a.dan }" type="currency" /> </h4>
				<h4>입고일: <fmt:formatDate value="${a.ipgo }" pattern="yyyy.MM.dd HH:mm"/></h4>
				<h4>
				<button type="button" class="btn btn-warning" onclick="location.href='updateform?num=${a.num}'">수정</button>
				<button type="button" class="btn btn-warning" onclick="location.href='delete?num=${a.num}'">삭제</button>
				</h4>
				</td>
			</tr>
		</table>
	</c:forEach>
	
</body>
</html>