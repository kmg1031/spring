<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Boolean code = false;
	String codeURL = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/list.css" media="all" />
</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>
	<div id="container">
	<div class="listPage">
		<div class="list">
			<table class="list table table-hover table-bordered ">
				<h1 class="title">LIST</h1>
				<thead>
					<tr>
						<th class="no">글번호</th>
						<th class="userId">글쓴이</th>
						<th class="title">제목</th>
						<th class="memo">내용</th>
					</tr>
				</thead>
				<c:if test="${pageDTO.pageNow ne -1}">
					<tbody>
						<c:forEach items="${bordList}" var="dto">
							<tr class="body">
								<td class="no">${dto.no}</td>
								<td class="userId">${dto.userId}</td>
								<td class="title">${dto.title}</td>
								<td class="memo">${dto.memo}</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<c:if test="${pageDTO.pageNow eq -1}">
					<tr>
						<td class="list-empty" colspan="4">게시글이 없습니다</td>
					</tr>
				</c:if>
				<input type="button" id="writeBtn" value="글쓰기" />
			</table>
		</div>
		<c:if test="${pageDTO.pageNow ne -1}">
			<div class="page">
				<c:if test="${pageDTO.pageNow!=1}">
					<a value="1">[<<]</a>
					<a value="${pageDTO.pageNow-1}">[<]</a>
				</c:if>

				<c:forEach begin="${pageDTO.pageStart}" end="${pageDTO.pageEnd}"
					var="page">

					<c:choose>
						<c:when test="${pageDTO.pageNow eq page}">
							<span>${page}</span>
						</c:when>
						<c:otherwise>
							<a value="${page}">[${page}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${pageDTO.pageNow!=pageDTO.pageMax}">
					<a value="${pageDTO.pageNow+1}">[>]</a>
					<a value="${pageDTO.pageMax}">[>>]</a>
				</c:if>

			</div>
		</c:if>
	</div>
	</div>	
	<%@ include file="/resources/js/footer.js"%>
	
</div>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$("#writeBtn").click(function() {
			location.href = "write.view";
		})

		$(".list").on("click", "tr.body", function(e) {
					e.stopPropagation()
					location.href = "/bord/info.do?no="	+ $(this).children(".no").text();
				})

		$(".page a").on("click", function() {
			event.preventDefault();
			location.href = "/bord/list.do?page=" + $(this).attr('value');
		});
	</script>
</body>
</html>