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
		<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
	
	<div style="margin-left: 100px; margin-top: 100px;">
		<img alt="" src="${root }/image/최고심5.jpg" style="width: 200px;" align="left" hspace="20"><br>
		<!-- 아이디에 따른 이름 받아서 표시 -->
		
		
		<button type="button" class="btn btn-info" onclick="location.href='logoutprocess'">로그아웃</button>
	</div>
	
</body>
</html>