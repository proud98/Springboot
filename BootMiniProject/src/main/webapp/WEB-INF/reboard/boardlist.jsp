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
	
	<div class="searcharea" style="width: 800px;">
	<!--검색창  -->
		<form action="list" class="form-inline">
			<div>
				<select name="searchcolum" class="form-control" style="width: 150px;">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
				</select>
				
				<input type="text" name="searchword" class="form-control" style="width: 300px;" placeholder="검색어를 입력하세요">
				<button type="submit" class="btn btn-info">검색</button>
			</div>
		</form>
	
	</div>
	
	<div style="margin: 30px 30px;">
		<table class="table table-bordered" style="width: 800px;">
		<caption><b>Spring 게시판</b>
			<span style="float: right;">
			<button type="button" class="btn btn-default" onclick="location.href='form'">글쓰기</button>
			</span>
		</caption>
			
			<tr bgcolor="#fffcc" align="center">
				<td width="80"><b>번호</b></td>
				<td width="340"><b>제목</b></td>
				<td width="140"><b>작성자</b></td>
				<td width="150"><b>작성일</b></td>
				<td width="80"><b>조회</b></td>
			</tr>
			
			<c:if test="${totalCount==0 }">
				<tr>
				<td colspan="5" align="center"><b>등록 된 글이 없습니다</b> </td>
				</tr>
			</c:if>
			
			<c:if test="${totalCount>0 }">
				<c:forEach var="dto" items="${list }">
					<tr>
						<td align="center">${no }</td>
						<c:set var="no" value="${no-1 }"/> 
						
						<td>
						
						<c:forEach begin="1" end="${dto.relevel }">
							&nbsp;&nbsp; 
						</c:forEach>
						
						
						<c:if test="${dto.relevel>0 }">  
							<img alt="" src="../photo/re.png">
						</c:if>
						
						
						<a href="content?num=${dto.num }$currentPage=${currentPage }">${dto.subject }</a>
						
						
						<c:if test="${dto.photo!='no' }">
							<img alt="" src="../photo/photoimg.png" style="width: 15px;">
						</c:if>
						</td>
						
						<td>${dto.name }</td>
						<td> <fmt:formatDate value="${dto.writeday }" pattern="yyyy.MM.dd"/> </td>
						<td>${dto.readcount }</td>
					</tr>
				</c:forEach>
			</c:if>
		
		</table>
		
		<c:if test="${totalCount>0 }">
			<div style="width: 800px; text-align: center;" class="container">
				<ul class="pagination"> 
				
					<c:if test="${startPage>1 }">
					<li>
					<a href="list?currentPage=${startPage-1 }">이전</a>
					</li>
					</c:if>
					
					<c:forEach var="pp" begin="${startPage }" end="${endPage }">
						<c:if test="${pp==currentPage }">
						<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
						</li>
						</c:if>
						
						<c:if test="${currentPage!=pp }">
						<li>
						<a href="list?currentPage=${pp }">${pp }</a>
						</li>
						</c:if>
					</c:forEach>
					
					<c:if test="${endPage<totalPage }">
					<li>
					<a href="list?currentPage=${endPage+1 }">다음</a>
					</li>
					</c:if>
				
				</ul>
			
			</div>
		
		</c:if>
	
	</div>
</body>
</html>