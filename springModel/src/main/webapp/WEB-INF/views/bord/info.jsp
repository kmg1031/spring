<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Boolean code = false;
	String codeURL = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/info.css" media="all" />

</head>
<body>
	<div id="wrap">
		<%@ include file="/resources/js/header.js"%>
		<div id="container">
		<div class="info">
			<form action="/bord/info.view">
				<ul>
					<li class="title">info</li>
					<c:if test="${bordInfo.userId ne 'delete'}">
					<li><span>글번호 :</span><input type="text" name="no" id="no" value="${bordInfo.no}" disabled="disabled" /></li>
					<li><span>작성자 :</span><input type="text" name="userId" id="userId" value="${bordInfo.userId}" disabled="disabled" /></li>
					<li><span>제목 :</span><input type="text" name="title" id="title" value="${bordInfo.title}" /></li>
					<li><span>내용</span></li>
					<li><textarea name="memo" id="memo" style="resize: none;">${bordInfo.memo}</textarea>
					</li>
					</c:if>
					<li><input type="button" id="backBtn" value="뒤로가기" />
					<c:if test="${sessionId eq bordInfo.userId}">
						 <input	type="button" id="deleteBtn" value="삭제하기" /> 
						 <input type="button"id="updateBtn" value="수정하기" />
					</c:if>
					</li>
				</ul>
			</form>
		</div>
	</div>
	<%@ include file="/resources/js/footer.js"%>
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script>		
		$("#backBtn").click(function() {
			history.back();
		});
		$("#updateBtn").click(updateDo);
		$("#deleteBtn").click(deleteDo);

		function updateDo() {
			alert("update");
			if (title.value == "" || title.value == null) {
				alert("제목을 입력해주세요");
				title.focus();
				return;
			} else if (memo.value == "" || memo.value == null) {
				alert("내용을 작성해주세요");
				memo.focus();
				return;
			} else if (title.length > 100) {
				alert("100자까지만 입력해주세요");
				title.focus();
				return;
			} else if (memo.length > 500) {
				alert("500자까지만 입력해주세요");
				memo.focus();
				return;
			}
			bordUpdateDo();
		}
		function bordUpdateDo() {
			$.ajax({
				url : "/bord/update.do",
				data : {
					no : no.value,
					userId : userId.value,
					title : title.value,
					memo : memo.value,
					sessionId : "<%=session.getAttribute("sessionId")%>"
				},
				type : "post",
				success : function(data) {
					if(data=="1"){
						alert("수정 성공");
						location.href = "/bord/list.do";
					}else{
						alert("수정 실패");
					}
				},
				error : function(data) {
					alert("수정 실패");
				}
			});
		}
		function deleteDo() {
			alert("delete");
			$.ajax({
				url : "/bord/delete.do",
				data : {
					no : no.value,
					sessionId : "<%=session.getAttribute("sessionId")%>"
				},
				type : "post",
				success : function(data) {
					if(data=="1"){
						alert("삭제 성공");
						location.href = "/bord/list.do";
					}else{
						alert("삭제 실패");
					}
				},
				error : function(data) {
					alert("삭제 실패");
				}
			});
		}
	</script>
</body>
</html>