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
	
	<!-- dto 불러올때 앞글자는 소문자 D는 대문자로 하면 컨트롤러에서 리턴만 줘도 DTO값 불러올수있음!!  -->
	<h3 class="alert alert-warning">
	form 데이터2 DTO 읽기<br>
	이름: ${personDto.name }
	나이: ${personDto.age }
	주소: ${personDto.addr }
	</h3>
	
	<%-- 이름: ${dto.name }
	나이: ${dto.age }
	주소: ${dto.addr } --%>
</body>
</html>