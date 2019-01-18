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
<title>write</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/write.css" media="all" />
</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>
	
	<div id="container">
		<form action="bordWrite.do" method="post" name="frm">
			<ul>
				<li><input type="text" name="userId" id="userId" disabled="disabled" value="<%=session.getAttribute("sessionId")%>"/></li>
				<li><input type="text" name="title" id="title" placeholder="title" /></li>
				<li><textarea rows="20" cols="20" name="memo" ></textarea></li>
				<li><input type="button" name="btnSubmit" id="btnSubmit" value="등록" /></li>
			</ul>
		</form>
	</div>
	
	<div id="footer"></div>
</div>

<script>
	var frm = document.frm;
	
	frm.btnSubmit.addEvent


</script>
</body>
</html>