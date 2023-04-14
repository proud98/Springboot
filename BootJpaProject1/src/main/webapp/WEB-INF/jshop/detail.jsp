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
	<table class="table table-bordered" style="width: 800px;">
	
	<tr>
	<td><b>상품명:</b> ${dto.sangpum }</td>
	</tr>
	
	<tr>
	<td><b>가격:</b> ${dto.price }</td>
	</tr>
	
	<tr>
	<td><b>입고일:</b> ${dto.ipgoday }</td>
	</tr>
	
	<tr>
	<td><b>등록일:</b> ${dto.writeday }</td>
	</tr>
	
	<tr>
	<td><img alt="" src="/${dto.photo }.jpg" style="max-width: 400px;"></td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<button type="button" class="btn btn-info" onclick="location.href='update?num=${dto.num}'">수정</button>
	<button type="button" class="btn btn-info" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
	
	</td>
	
	</tr>
	
	</table>
</body>
</html>