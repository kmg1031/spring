<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>userCheck</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/login.css" media="all" />
</head>
<body>
	<div class="login">
		<form action="login.do">
			<ul>
				<li class="title">회원 확인</li>
				<li><input type="text" name="userId" id="userId" disabled="disabled" /><%=session.getAttribute("sessionId") %></li>
				<li><input type="password" name="userPw" id="userPw" placeholder="PASSWORD"/></li>
				<li><a href="delete.view">회원탈퇴</a></li>
			</ul>
		</form>
	</div>
	<script src="js/login.js"></script>
</body>
</html>