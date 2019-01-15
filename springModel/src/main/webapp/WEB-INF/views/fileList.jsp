<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/bordList.css" media="all" />

</head>
<body>
	<%
	Boolean code = false;
	String codeURL = ""; 
%>
	<%@ include file="/resources/js/header.js"%>
	
	<div class="listPage">
		<table class="list table table-hover table-bordered ">
			<h1 class="title">LIST</h1>
			<thead>
				<tr>
					<th class="nicName">글번호</th>
					<th class="title">제목</th>
					<th class="memo">내용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${fileList}" var="dto">
					<tr class="body">
						<td class="nicName">${dto.fileName}</td>
						<td class="title">${dto.filePath}</td>
						<td class="memo">${dto.fileByte}</td>				
						<td><a href="<c:url value = 'fileDownload.do?fileName=${dto.fileName}'/>" >${dto.fileName}</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>