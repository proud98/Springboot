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
.day{
color: gray;
margin-left: 50px;
margin-right: 30px;
font-size: 0.7em;
}

.amod,.adel{
cursor: pointer;
font-size: 0.5em;
color: gray;
}
</style>

<script type="text/javascript">
//댓글 ajax
$(function(){
	
	//사용자함수 list 호출
	list();
		
	//num값은 전역 변수로 
	num=$("#num").val();
	
	//loginok와 myid도 세션에서 가져오기
	loginok="${sessionScope.loginok}"; //로그인중이면 yes로 직힘
	myid="${sessionScope.myid}";
	
	//alert(loginok+","+myid+","+num);
	
	//insert
	$("#btnansweradd").click(function(){
		
		var content=$("#content").val();
		
		//null값 체크 (공백 포함 댓글 작성 안하면)
		if(content.trim().length==0){
			alert("댓글을 입력 해");
			return;
		}
		
		$.ajax({
			
			type:"post",
			dataType:"text",
			url:"ainsert",
			data:{"num":num,"content":content},
			success:function(){
				//alert("성공");
				
				//사용자함수 list 또 호출
				list();
				
				//입력값 지워두기(입력창 초기화)
				$("#content").val("");
			}
			
		});
		
		
	});
	
	//수정 폼 띄우기
	$(document).on("click",".amod",function(){
		idx=$(this).attr("idx");
		
	//alert(idx);
	$.ajax({
	
		type:"get",
		dataType:"json",
		url:"updateform",
		data:{"idx":idx},
		success:function(res){
			
			$("#update_content").text(res.content);	
			
		}	
		
	})
	
	});
	
	
	//수정처리
	$(document).on("click","#btnupdate",function(){
		
		var content=$("#update_content").val();
		//alert(idx);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"update",
			data:{"idx":idx,"content":content},
			success:function(){
				
				list();
				
				location.reload();
			}
			
		})
			
		
	});
	
	
	//삭제
	$(document).on("click",".adel",function(){
		
		var idx=$(this).attr("idx");
		
		//alert(idx);
		
		$.ajax({
			
			type:"get",
			url:"adelete",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				
				//사용자함수 list 또 호출
				list();
				
				
			}
		});
	})
	
	
});


	

//list 사용자 함수
function list(){
	
	var num=$("#num").val();
	
	$.ajax({
		
		type:"get",
		dataType:"json", //return값이 있으면 json
		url:"alist",
		data:{"num":num},
		success:function(res){
			
			$("span.acount").text(res.length); //res로 부터 몇 개의 값이 넘어왔는지..댓글 수...
			
			var s="";
			
			$.each(res,function(i,dto){
				
				s+="<b>"+dto.name+"</b>:&nbsp;"+dto.content;
				s+="<span class='day'>"+dto.writeday+"</span>";
				
				if(loginok=='yes' && myid==dto.myid){
					s+="<span class='glyphicon glyphicon-erase amod' idx='"+dto.idx+"' data-toggle='modal' data-target='#amodal'></span>"; //수정
					s+="&nbsp;&nbsp;";
					s+="<span class='glyphicon glyphicon-remove adel' idx='"+dto.idx+"'></span>"; //삭제
				}
				
				s+="<br>";
			})
			
			$(".alist").html(s);
			
		}
	})
}


</script>
</head>
<body>
	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
				<h3>
				<b>${dto.subject }</b>&nbsp; 조회: ${dto.readcount }
				<span style="color: gray; float: right; font-size: 14px;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy.MM.dd HH:mm"/> </span>
				</h3>
				
				<span>작성자: ${dto.name } (${dto.myid})</span>	
				
				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
					<a href="download?clip=${dto.uploadfile }" style="color: gray;">
						<span class="glyphicon glyphicon-download-alt"></span>&nbsp;<b style="font-size: 12pt; color: gray;">${dto.uploadfile}</b>
					</a>
					</span>
				</c:if>
				
			</td>
		</tr>
		
		<tr>
			<td>
				<c:if test="${bupload==true }">
					<h3>업로드 파일은 이미지</h3>
					<img alt="" src="../photo/${dto.upload }" style="max-width: 200px;">
				</c:if>
				
				<pre>${dto.content }</pre>
				
				<br><br><br>
				
				<!-- 댓글 -->
				<b>댓글 <span class="acount"></span></b>	
			</td>
		</tr>
		
		<tr>
			<td>
			<div class="alist"></div>
			
			<c:if test="${sessionScope.loginok!=null }">
				<div class="aform">
				<input type="hidden" id="num" value="${dto.num }">
				
					<div class="form-inline">
						<input type="text" class="form-control" style="width: 500px;" placeholder="댓글을 입력하세요"  id="content">
						<button type="button" class="btn btn-info" style="width: 60px;" id="btnansweradd">등록</button>
					</div>
				</div>
			</c:if>
			</td>
		</tr>
		
		<!-- 버튼 -->
		<tr>
			<td align="left">
				<!--글쓰기는 로그인 중 일때만 뜨게하기  -->
				<c:if test="${sessionScope.loginok!=null }">
					<button type="button" class="btn btn-info" onclick="location.href='form'">글쓰기</button>
				</c:if>
				<!-- 자기글만 보이게 -->
				<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid }">
					<button type="button" class="btn btn-info" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button type="button" class="btn btn-info" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
				</c:if>
				<button type="button" class="btn btn-info" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			</td>
		</tr>
	
	</table>
	
	<div class="modal fade" id="amodal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content" style="margin-top: 160px; width: 400px;">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">댓글 수정</h4>
				</div>

				<div class="modal-body" style="padding: 20px;">
					<textarea type="text" id="update_content" style="width: 355px; height: 200px; padding: 10px; border: none; outline: none; resize: none;"></textarea>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" style="border: 1px solid #CBB6D9;" data-dismiss="modal" id="btnupdate">수정</button>
				</div>
			</div>

		</div>
	</div>
	
</body>
</html>