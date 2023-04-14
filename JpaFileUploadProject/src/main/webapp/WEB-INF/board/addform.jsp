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
		<table class="table tabl-bordered" style="width: 500px;">
		<caption><b>새글쓰기</b></caption>
			<tr>
			<th width="80" bgcolor="#fffccc">작성자</th>
				<td>
				<input type="text" name="writer" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th width="80" bgcolor="#fffccc">제목</th>
				<td>
				<input type="text" name="subject" required="required" class="form-control">
				</td>
			</tr>
			
			<tr>
			<th width="80" bgcolor="#fffccc">사진</th>
				<td>
				<input type="file" name="upload" class="form-control">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<textarea style="width: 500px; height: 150px;" name="content" required="required"></textarea>
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