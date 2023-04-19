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
	<div style="margin: 200px;">
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list }">
				<tr>
					<td style="width: 250px" align="center" rowspan="5">
					<img alt="" src="../photo/${dto.photo }" width="230" border="1"><br>
					<input type="file" id="newphoto" style="display: none;" num=${dto.num }> <!-- 수정 할 때 호출하려고 num 같이 넣어줌 -->
					<button type="button" class="btn btn-info" id="btnnewphoto" >사진수정</button>
					</td>
					
					<td style="width: 300px;">회원명: ${dto.name }</td>
					
					<td style="width: 150px; vertical-align: middle;" align="center" rowspan="5" >
					<button type="button" class="btn btn-info" onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-info" onclick="location.href=''">삭제</button>
					</td>
					
				</tr>

				<tr>
					<td style="width: 300px;">아이디: ${dto.id }</td>
				</tr>
				
				<tr>			
					<td style="width: 300px;">연락처: ${dto.hp }</td>
				</tr>
				
				<tr>	
					<td style="width: 300px;">이메일: ${dto.email }</td>
				</tr>
				
				<tr>	
					<td style="width: 300px;">주소: ${dto.addr }</td>
				</tr>	
			</c:forEach>
		
		</table>
	
	</div>
</body>
</html>