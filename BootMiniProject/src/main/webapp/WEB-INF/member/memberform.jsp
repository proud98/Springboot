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
#showimg{
border: 1px solid gray;
width: 130px;
height: 160px;
}
</style>

<script type="text/javascript">
   $(function() {
      $("#btnphoto").click(function() {
         $("#myphoto").trigger("click");
      })
   })

   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader(); // 파일을 읽기 위한 FileReader 객체 생성
         reader.onload = function(e) {
            
            $("#showimg").attr("src", e.target.result);
            
         }
         reader.readAsDataURL(input.files[0]);
      }
   }
   
   function check(){
      //사진
      if($("#myphoto").val()==""){
         alert("사진을 넣어주세요.");
         return false;
      }
      
      //중복체크
      if($(".idsuccess").text()!="ok"){
         alert("아이디 중복체크를 해주세요.");
         return false;
      }
      
      //비밀번호체크
      if($(".passsuccess").text()!="ok"){
         alert("비밀번호가 일치하지 않습니다.");
         return false;
      }
   }  

</script>
</head>
<body>
	<button type="button" class="btn btn-info" onclick="location.href='list'">전체 회원 목록</button>
	
	<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()"> <!-- submit으로 넘어가기 전에 null값 체크해 줄 사용자함수 -->
		<table class="table table-bordered" style="width: 500px;">
		<caption><b>회원가입</b></caption>
			<tr>
				<td style="width: 200px;" rowspan="4" align="center">
				<input type="file" id="myphoto" name="myphoto" style="display: none;" onchange="readURL(this);">
				<button type="button" id="btnphoto" class="btn btn-info">선택</button><br>
				<img id="showimg">
				</td>
				
				<td>
				<div class="form-inline">
					<input type="text" placeholder="아이디 입력" id="loginid" name="id" class="form-control" style="width: 130px;" required="required">
					<button type="button" class="btn btn-info" id="btnidcheck">중복체크</button>&nbsp;
					<span class="idsuccess" style="width: 60px; color: green;"></span> <!--둥복체크 결과 부분  -->
				</div>
				</td>
			</tr>
			
			<tr>
				<td>
				<div class="form-inline">
					<input type="password" style="width: 120px;" class="form-control" name="pass" id="pass" placeholder="숫자 4자리" required="required">
					<input type="password" style="width: 120px;" class="form-control" id="pass2" placeholder="비번확인" required="required">&nbsp;
					<span class="passsuccess" style="width: 60px; color: green;"></span>
				
				</div>
				</td>
			</tr>
			
			<tr>
				<td>
				<input type="text" name="name" class="form-control" style="width: 200px;" placeholder="이름입력" required="required">
				</td>
			</tr>
			
			<tr>
				<td>
				<input type="email" name="email" class="form-control" style="width: 200px;" placeholder="이메일입력" required="required">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<div class="form-inline">
					<input type="text" name="hp" class="form-control" style="width: 200px;" placeholder="연락처입력" required="required">
					<input type="text" name="addr" class="form-control" style="width: 200px;" placeholder="주소입력" required="required">	
				</div>
				</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info">가입</button>
			</td>
			</tr>
		</table>
	</form>
	
<script type="text/javascript">

//입력한 아이디가 중복된 아이디인지 확인
$("#btnidcheck").click(function(){
	
	var id=$("#loginid").val(); //넘겨줘야 할 id
	//alert(id);
	
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:"idcheck",
		data:{"id":id},
		success:function(res){
			
			if(res.count==0){
				$("span.idsuccess").text("ok");
			}else{
				$("span.idsuccess").text("안됨");
			}
		}
		
	});
	
});

//아이디 입력시 idsuccess값 지우기
$("#loginid").keyup(function(){
	$("span.idsuccess").text(" ");
})


//비밀번호 일치확인
$("#pass2").keyup(function(){
	
	var p1=$("#pass").val();
	var p2=$(this).val();
	
	if(p1==p2){
		$("span.passsuccess").text("ok");
	}else{
		$("span.passsuccess").text("다시");
	}
})
</script>
</body>
</html>