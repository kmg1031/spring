<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Boolean code = false;
	String codeURL = ""; 
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>book list</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/book/list.css" media="all" />
</head>
<body>

<div id="wrap">

	<%@ include file="/resources/js/header.js"%>
	
	<div id="container">
	<div class="listPage">
	
<!-- 		<div class="search">
			<select>
				<option value="code">코드</option>
				<option value="name">도서명</option>
				<option value="author">저자</option>
			</select>
			<input type="text" id="keyword" name="keyword" />
			<input type="text" id="searchBtn" name="searchBtn" />
		</div>
 -->		
		<table class="list table table-hover table-bordered ">
			<h1 class="title">BOOK LIST</h1>
			<thead>
				<tr>
					<th class="nicName">책 코드</th>
					<th class="title">제목</th>
					<th class="memo">저자</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookList}" var="dto">
					<tr class="body">
						<td class="nicName">${dto.bookCode}</td>
						<td class="title">${dto.bookName}</td>
						<td class="memo">${dto.bookAuthor}</td>
						<td>
							<c:if test="${dto.bookState}">대여 가능</c:if>
							<c:if test="${!dto.bookState}">대여 불가</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button class="btn btn-default" id="backBtn">뒤로가기</button>
		</div>
	</div>
	<%@ include file="/resources/js/footer.js"%>
</div>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
$("#backBtn").click(function() {
	history.back();
});
</script>

</body>
</html>