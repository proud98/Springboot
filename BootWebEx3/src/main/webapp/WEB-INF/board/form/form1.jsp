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
	<h3 class="alert alert-info" style="width: 300px;">form 데이터 각각 읽기</h3>	
	<form action="read1" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<tr>
			<th width="100">이름</th>
				<td>
				<input type="text" name="name" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th width="100">자바</th>
				<td>
				<input type="text" name="java" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th width="100">스프링</th>
				<td>
				<input type="text" name="spring" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">저장</button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>