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
	<div class="alert alert-info" style="width: 500px;">
		<b>총 ${totalCount }개</b>	
	</div>
	
	<table class="table table-bordered" style="width: 500px;">
	<caption>
		<span><button type="button" class="btn btn-info" onclick="location.href='form'">상품추가</button> </span>
	</caption>
		
		<c:forEach var="dto" items="${list }">
			<tr>
				<td width="300" rowspan="4">
					<c:if test="${dto.photoname!='no'}">
						<img alt="" src="../photo/${dto.dimage }" style="max-width: 300px;"> <!-- 대표이미지 가져오기 방법2-->
						<%-- <c:forTokens var="pp" items="${dto.photoname }" delims=","> <!-- , 으로 분리 --> 방법1
							<a>
							<img alt="" src="../photo/${pp }" style="max-width: 50px;">
							</a>
						</c:forTokens> --%>
					</c:if>
					
					<c:if test="${dto.photoname=='no' }">
						<img alt="" src="../image/noimg.jpg" style="max-width: 50px;">
					</c:if>
				</td>
				
				<td>
				<b>상품명: ${dto.sangpum }</b>
				</td>
			</tr>
			
			<tr>
				<td>
				<b>단가:<fmt:formatNumber value="${dto.price }" type="currency"/></b>
				</td>
			</tr>
			
			<tr>
				<td>
				<b>입고일:<fmt:formatDate value="${dto.ipgoday }" pattern="yyyy.MM.dd HH:mm"/></b>
				</td>
			</tr>
			
			<tr>
				<td align="center">
				<button type="button" class="btn btn-info" onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-info" onclick="location.href=''">삭제</button>
				</td>
			</tr>
		</c:forEach>	
	</table>
</body>
</html>