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
	<h3 class="alert alert-info" style="width: 400px;">JShop Form</h3>	
	<form action="insert" method="post">
		<table class="table table-bordered" style="width: 400px;">
			<tr>
			<th width="100">상품명</th>
				<td>
				<input type="text" name="sangpum" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th width="100">사진</th>
				<td>
				<select name="photo" onchange="changeImage(this.value)" class="form-control">
					<option value="최고심1">최고심1</option>
					<option value="최고심2">최고심2</option>
					<option value="최고심3">최고심3</option>
				</select>
				</td>
			</tr>
			
			<tr>
			<th width="100">가격</th>
				<td>
				<input type="text" name="price" class="form-control">
				</td>
			</tr>

			
			<tr>
			<th width="100">입고날짜</th>
				<td>
				<input type="date" name="ipgoday" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-info">저장</button>
				<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>