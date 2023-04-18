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

<style type="text/css">
body{
font-size: 1.5em;
font-family: 'Gamja Flower';
}

ul.menu{
list-style: none;
}

ul.menu li{
width: 120px;
float: left;
border: 1px solid gray;
height: 60px;
line-height: 60px;
margin-right: 10px;
text-align: center;
font-size: 25px;
background-color: "#fffcc";
cursor: pointer;
}

ul.menu li a{
color: black;
text-decoration: none;
}
</style>
</head>
<body>

	<c:set var="root" value="<%=request.getContextPath() %>"></c:set>
	
	<ul class="menu">
		<li>
			<a href="${root }/">Home</a>
		</li>
		
		<li>
			<a href="${root }/ipgo/form">상품등록</a> <!-- 매핑주소 쓰기 -->
		</li>
		
		<li>
			<a href="${root }/ipgo/list">목록</a>
		</li>
		
		<li>
			<a href="${root }/member/list">회원목록</a>
		</li>
		<li>
			<a href="${root }/board/list">게시판</a>
		</li>
		
		<li>
			<a href="${root }/login/main">로그인</a> <!-- main 통해서 감 -->
		</li>
		
		<li>
			<a href="${root }/member/form">회원가입</a>
		</li>
		
		<li>
			<a href="${root }/load/map">오시는길</a>
		</li>
	</ul>
	
</body>
</html>