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
	<h2 class="alert alert-info">총 ${count }명의 회원이 있습니다</h2><br>
	<table class="table table-bordereds" style="width: 800px;">
	<caption><b>전체 회원 명단</b></caption>
		<tr style="background-color: #ffccc">
		<th style="width: 70px;">번호</th>
		<th style="width: 200px;">이름</th>
		<th style="width: 100px;">아이디</th>
		<th style="width: 200px;">핸드폰</th>
		<th style="width: 200px;">주소</th>
		<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count}</td>
				<td><img src="../photo/${dto.photo }" width="80"> &nbsp; ${dto.name }</td>
				<td>${dto.id }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td><input type="checkbox" class="del" name="num" num="${dto.num }"> </td>
			</tr>
		</c:forEach>
	
	<tr>
		<td colspan="7" align="right">
		<button type="button" class="btn btn-info" id="btnmemberdel">삭제</button>
		</td>
	</tr>	
	</table>
	
<script type="text/javascript">

//전체선택(allcheck)
$("#allcheck").click(function(){
	
	//체크값 얻기
	var chk=$(this).is(":checked");
	
	//전체체크값 개별 체크박스에 전달 
	$(".del").prop(":checked", chk);
	
});


$("#btnmemberdel").click(function(){
	
	var cnt=$(".del:checked").length;
	
	if(cnt==0){
		alert("한 명 이상의 회원을 선택하세요");
		return; //종료
	}
	
	$(".del:checked").each(function(i,elt){
		
		var num=$(this).attr("num");
		
		//삭제ajax
		$.ajax({
			
			type:"get",
			url:"delete",
			dataType:"html",
			data:{"num":num},
			success:function(){
				
				alert("삭제되었습니다");
				location.reload();
			}
		});
		
	});
	
	
});	
</script>	
	
</body>
</html>