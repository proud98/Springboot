<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>

<c:set var="root" value="${request.getContextPath()}"></c:set>

<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="${root }/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="${root }/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<form action="update" method="post">
<input type="hidden" value="${dto.num }" name="num">
<input type="hidden" value="${currentPage }" name="currentPage">
	<table class="table table-bordered" style="width: 800px;margin-left: 100px;">
		<caption><h3>상점 게시판 수정</h3></caption>
		<tr>
			<th bgcolor="orange" width="200">상품명</th>
			<td>
				<input type="text" name="sangpum" class="form-control"
					required="required" style="width: 450px;" value="${dto.sangpum }">
			</td>
			
			<th bgcolor="orange" width="150">색상</th>
			<td>
				<input type="color" name="color" class="form-control"
					required="required" style="width: 150px;" value="${dto.color }">
			</td>
		</tr>
		
		<tr>
			<th bgcolor="orange" width="200">단가</th>
			<td>
				<input type="text" name="price" class="form-control"
					required="required" style="width: 450px;" value="${dto.price }">
			</td>
			
			<th bgcolor="orange" width="150">입고</th>
			<td>
				<input type="date" name="ipgoday" class="form-control"
					required="required" style="width: 150px;" value="${dto.ipgoday }">
			</td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;">${dto.content }</textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="submitContents(this)">수정</button>
				
				<button type="button" class="btn btn-warning"
					style="width: 120px;"
					onclick="location.href='list?currentPage=${currentPage}'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "${root}/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="${root}/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>






















