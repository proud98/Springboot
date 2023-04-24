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
				
				<br>
				
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
</body>
</html>