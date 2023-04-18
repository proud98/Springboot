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
	<form action="insert" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
		<caption>책 정보 입력</caption>
			<tr>
			<th bgcolor="#fffccc">제목</th>
				<td>
				<input type="text" name="bookname" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th bgcolor="#fffccc">이미지</th>
				<td>
				<input type="file" name="photo" class="form-control" required="required" multiple="multiple">
				</td>
			</tr>
			
			<tr>
			<th bgcolor="#fffccc">저자</th>
				<td>
				<input type="text" name="bookwriter" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th bgcolor="#fffccc">가격</th>
				<td>
				<input type="text" name="bookprice" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th bgcolor="#fffccc">출판사</th>
				<td>
				<input type="text" name="bookcompany" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-warning">저장</button>
				<button type="button" class="btn btn-warning" onclick="location.href='list'">목록</button>
				</td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>