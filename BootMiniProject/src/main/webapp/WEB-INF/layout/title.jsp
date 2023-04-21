<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<title>Insert title here</title>

<style>
.container {
display: flex;
justify-content: center;
align-items: center;
}
</style>

</head>
<body>

	<c:set var="root" value="<%=request.getContextPath() %>"> </c:set> <!--절대경로 -->
	
	<a href=${root }> 
		<img alt="" src="${root }/image/최고심10.jpg"> 
		<b style="color: pink;">SpringBootMybatisTiles</b>
	</a>
	
<div class="container">

<c:if test="${sessionScope.loginok==null }">
  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">로그인</button>
</c:if>

<c:if test="${sessionScope.loginok!=null }">
  <button type="button" class="btn btn-danger btn-sm" id="btnlogout">로그아웃</button>
</c:if>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">LOGIN</h4>
        </div>
        
        <div class="modal-body">
          <span class="">ID</span><input type="text" class="form-control" id="loginid">
          <span class="">PASSWORD</span><input type="text" class="form-control" id="loginpass">
        </div>
        
        
        
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnloginok">로그인</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
        
      </div>
      
    </div>
 </div>
  
</div>

<!-- 모달을 통해서 들어간 로그인버튼에 대한 ajax 스크립트 처리 -->
<script type="text/javascript">

$("#btnloginok").click(function(){
	
	//아이디 비번 읽기
	var id=$("#loginid").val();
	var pass=$("#loginpass").val();
	var root="${root}"; //ajax 로그인은 root를 읽어와서 root 포함된 매핑주소를 url에 적어줘야 함
	
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:root+"/member/login",
		data:{"id":id,"pass":pass},
		success:function(res){
			
			if(res.result=='fail'){
				alert("일치하는 정보가 없습니다");
			}else{
				location.reload();
			}	
		}
	});		
	
});

//로그아웃
$("#btnlogout").click(function(){
   var root='${root}';
   
   $.ajax({
	   type:"get",
	   url:root+"/member/logout",
	   dataType:"text",
	   success:function(res){
	      location.reload();
	   }
	})
   
})

</script>
	
</body>
</html>