<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	Boolean code = false;
	String codeURL = ""; 
%>
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
<script src="js/delete.js"></script>

</body>
</html>