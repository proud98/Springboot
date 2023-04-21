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

<script type="text/javascript">

$(function(){
	
	//사진수정버튼 눌렀을때 newphoto를 클릭한 효과
	$("#btnnewphoto").click(function(){
		$("#newphoto").trigger("click");
	})
	
	$("#newphoto").change(function(){
		
		var num=$(this).attr("num");
		//alert(num);
		
		//FormData 생성
		var form=new FormData();
		form.append("photo",$("#newphoto")[0].files[0]); //선택한 사진 한개만 추가
		form.append("num",num);
		
		console.dir(form);
		
		$.ajax({
			
			type:"post",
			dataType:"text",
			url:"updatephoto",
			processData:false, //fromdata는 기본설정이 true로 되어있어서.. false로 바꿔줘여함.....
			contentType:false, //역시 true가 기본값으로 성정되어 있어서 false로..
			data:form,
			success:function(){
				
				location.reload();
			}
		});
		
	});

	$("#update").click(function(){
		
		var name=$("#name").val();
		var email=$("#email").val();
		var hp=$("#hp").val();
		var addr=$("#addr").val();
		
		$.ajax({
			
			type:"get",
			dataType:"html",
			url:"up",
			data:{"name":name,"email",email,"hp":hp,"addr":addr},
			success:function(){
				
				location.reload();
			}
			
		
		});
		
		
		
	});
	
});

</script>
</head>
<body>
	<div style="margin: 200px;">
	<form>
	<input type="hidden" name="num" value="${dto.num }">	
		<table class="table table-bordered">
			<c:forEach var="dto" items="${list }">
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.id }">
				<tr>
					<td style="width: 250px" align="center" rowspan="5">
					<img alt="" src="../photo/${dto.photo }" width="230" border="1"><br>
					<input type="file" id="newphoto" style="display: none;" num="${dto.num }"> <!-- 수정 할 때 호출하려고 num 같이 넣어줌 -->
					<button type="button" class="btn btn-info" id="btnnewphoto" >사진수정</button>
					</td>
					
					<td style="width: 300px;">회원명: ${dto.name }</td>
					
					<td style="width: 150px; vertical-align: middle;" align="center" rowspan="5" >
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#updateInfo">수정</button>
					<button type="button" class="btn btn-info" onclick="location.href=''">삭제</button>
					</td>
					
				</tr>

				<tr>
					<td style="width: 300px;">아이디: ${dto.id }</td>
				</tr>
				
				<tr>			
					<td style="width: 300px;">연락처: ${dto.hp }</td>
				</tr>
				
				<tr>	
					<td style="width: 300px;">이메일: ${dto.email }</td>
				</tr>
				
				<tr>	
					<td style="width: 300px;">주소: ${dto.addr }</td>
				</tr>
			
					<div class="container">
					
					  <!-- Modal -->
					  <div class="modal fade" id="updateInfo" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">회원정보 수정</h4>
					        </div>
					        
					        <div class="modal-body">
					        <input type="hidden" name="num" value="${dto.num }">
					          <span class="">이름</span><input type="text"  value="${dto.name }" class="form-control"  id="name">
					          <span class="">이메일</span><input type="text" value="${dto.email }" class="form-control" id="email">
					          <span class="">연락처</span><input type="text" value="${dto.hp }" class="form-control" id="hp">
					          <span class="">주소</span><input type="text" value="${dto.addr }" class="form-control" id="addr"> 
					        </div>
					         
					        <div class="modal-footer">
					        <button type="button" class="btn btn-default" data-dismiss="modal" id="update" num="${dto.num }">수정</button>
					        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					        
					      </div>
					      
					    </div>
					 </div>
					  
					</div>
		
			</c:if>	
			</c:forEach>
		
		</table>
	</form>
	</div>
	
		
</body>
</html>