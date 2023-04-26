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
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
			상품명: ${dto.sangpum }
			</td>
			
			<td>
			컬러: ${dto.color }
			</td>
		</tr>
		
		<tr>			
			<td>
			가격: <fmt:formatNumber value="${dto.price }" type="currency" />
			</td>
			
			<td>
			입고일: ${dto.ipgoday }
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			${dto.content }
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<button class="btn btn-info" onclick="location.href='updateform?num=${dto.num }&currentPage=${currentPage}'">수정</button>
			<button class="btn btn-info" onclick="location.href='delete?num=${dto.num }&currentPage=${currentPage}'">삭제</button>
			<button class="btn btn-info" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			</td>
		</tr>
	</table>
	
<script type="text/javascript">
$("#delete").click(function(){
	
	var num=$(this).attr("num");
	
	$.ajax({
		
		type:"get",
		url:"delete",
		dataType:"html",
		data:{"num":num},
		success:function(){
			
			
		}
	});
	
});

</script>	
</body>
</html>