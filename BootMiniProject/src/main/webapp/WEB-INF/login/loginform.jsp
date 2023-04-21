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
	<div>
		<form action="loginprocess" method="post">
			<table class="table table-bordered" style="width: 300px;">
			<caption><b>로그인</b></caption>
				<tr>
					<td>
					<input type="text" name="id" class="form-control" placeholder="ID 입력" required="required" autofocus="autofocus" value="${sessionScope.saveok==null?'':sessionScope.myid }">
					</td>
				</tr>
				
				<tr>
					<td>
					<input type="password" name="pass" class="form-control" placeholder="PASSWORD 입력" required="required">
					</td>
				</tr>
				
				<tr>
					<td>
					<input type="checkbox" name="cbsave" ${sessionScope.saveok==null?"":"checked" }>아이디 저장&nbsp;
					<button type="submit" class="btn btn-info">로그인</button>
					</td>
				</tr>
			
			</table>
		
		</form>
	</div>
</body>
</html>