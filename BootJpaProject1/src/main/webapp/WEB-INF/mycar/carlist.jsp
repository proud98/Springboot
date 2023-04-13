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
.box{
width: 40px;
height: 40px;
border: 1px solid gray;
border-radius: 10px;
}
</style>
</head>
<body>
	
	<h3 class="alert alert-info" style="width: 800px;">총 ${totalCount }개의 정보가 있어요 </h3>
	<button type="button" class="btn btn-info" onclick="location.href='carform'" >글쓰기</button>
	
	<table class="table table-boardered" style="width: 800px;">
	<caption><b>자동차 전체 목록</b></caption>
		<tr>
		<th width="50">번호</th>
		<th width="100">자동차명</th>
		<th width="100">색상</th>
		<th width="100">단가</th>
		<th width="150">구입일</th>
		<th width="150">등록일</th>
		<th width="150">수정/삭제</th>	
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
			<td>${i.count }</td>
			<td>${dto.carname }</td>
			<td><div class="box" style="background-color: ${dto.carcolor}"></div> </td>
			<td><fmt:formatNumber value="${dto.carprice }" /> </td>
			<td>${dto.carguip }</td>
			<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy.MM.dd"/></td>
			<td>
				<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
				<button type="button" class="del" num="${dto.num }" onclick="location.href='delete?num=${dto.num}'">삭제</button>
			</td>	
		</tr>
		</c:forEach>
	</table>
	
	<script type="text/javascript">
	$("button.del").click(function(){
		
		var num=$(this).attr("num");

		
		$.ajax({
			
			type:"get",
			dataType:"html",
			url:"delete",
			data:{"num":num},
			success:function(res){
				
				location.reload();
			}
		})
	});
	</script>
</body>
</html>