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
<title>login</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/login.css" media="all" />

</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>

<div class="login">
		<form action="login.do">
			<ul>
				<li class="title">LOGIN</li>
				<li><input type="text" name="userId" id="userId" placeholder="ID" /></li>
				<li><input type="password" name="userPw" id="userPw" placeholder="PASSWORD"/></li>
				<li><input type="button" value="로그인" onclick="loginOk()" /></li>
			</ul>
		</form>
	</div>
	<%@ include file="/resources/js/footer.js"%>
	</div>
<script src="/resources/js/login.js"></script>
</body>
</html>