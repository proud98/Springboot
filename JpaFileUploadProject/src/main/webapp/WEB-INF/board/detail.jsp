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
.table{
font-size: 1.5em;
text-align: center;
}
</style>
</head>
<body>
	<h2 class="alert alert-info" style="width: 600px;"><b>${dto.subject }</b></h2>
	<h2 class="alert alert-info" style="width: 600px;"><b>${dto.writer }</b>이 작성함!!!</h2>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
			${dto.content }<br>
			<img alt="" src="/save/${dto.photo }" style="max-width: 500px;">
			</td>
		</tr>
		
		<tr>
			<td>
			<button type="button" class="btn btn-info" onclick="location.href='updateform?num=${dto.num}'">수정</button>
			<button type="button" class="btn btn-info" onclick="location.href='delete?num=${dto.num}'">삭제</button>
			<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
			</td>
		</tr>

	</table>
</body>
</html>