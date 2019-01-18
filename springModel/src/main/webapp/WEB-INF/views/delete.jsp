<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Boolean code = false;
	String codeURL = ""; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/login.css" media="all" />

</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>

	<div class="login">
		<form action="delete.do">
			<ul>
				<li class="title">LOGIN</li>
				<li><input type="text" name="userId" id="userId" placeholder="ID" /></li>
				<li><input type="password" name="userPw" id="userPw" placeholder="PASSWORD"/></li>
				<li><input type="button" value="로그인" onclick="loginOk()" /></li>
			</ul>
		</form>
	</div>
	<div id="footer"></div>
</div>

<script src="/resources/js/delete.js"></script>

</body>
</html>