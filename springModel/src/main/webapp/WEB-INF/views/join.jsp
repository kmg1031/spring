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
<title>Three.js</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/join.css" media="all" />
</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>

	<div class="join">
		<form action="join.do">

			<ul>
				<li class="title">JOIN</li>
				<li id="id">
					<input type="text" name="userId" id="userId" placeholder="ID 4~16자" />
					<input type="button" value="아이디 체크" onclick="idChecked()" />
				</li>
				<li><input type="password" name="userPw" id="userPw" placeholder="PASSWORD 4~16자" onkeyup="pwChecked()" /></li>
				<li><input type="password" name="userPwCheck" id="userPwCheck" placeholder="PASSWORD CHECK" onkeyup="pwChecked()"/></li>
				<li id="pw"><span id="pwCheck">비밀번호를 확인해주세요</span></li>
				<li><input type="text" name="userName" id="userName" placeholder="NAME 4~16자" /></li>
				<li><input type="button" value="회원가입" onclick="joinOk()" /></li>
			</ul>

		</form>
	</div>
</div>
<script src="/resources/js/join.js"></script>
</body>
</html>