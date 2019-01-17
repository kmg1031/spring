<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/index.css" media="all" />
</head>
<body>

	<div id="wrap">
		<div id="header">
			<div class="gnb">
				<ul>
					<% if(session.getAttribute("sessionId")==null){ %>
					<li><a href="join.view">ȸ������</a></li>
					<li><a href="login.view">�α���</a></li>
					<% }else{ %>
					<li><a href="userCheck.view">ȸ������</a></li>
					<li><a href="logout.do">�α׾ƿ�</a></li>
					<% } %>
					<li><a href="">�޴�</a></li>
				</ul>
			</div>	
		</div>

		<div id="container">
			
			<div class="title">
				<img src="/resources/img/bord_wood.jpg" alt="������" />
				<h1 class="logo"></h1>
			</div>
			<!-- ������Ʈ ���� -->
			<div class="search"><input type="text"  /></div> 
			
			<div class="shortcut">
				<ul>
				    <li><a href="fileList.do">���� ���</a></li>
				    <li><a href="fileUpload.view">���� ���ε�</a></li>
				    <li><a href="threejsBox.view">Three.js BOX</a></li>
				    <li><a href="crawler.do">���̹� ���� ũ�Ѹ�</a></li>
					<li><a href="canvas.view">ĵ���� BOX</a></li>
				</ul>
			</div>
						

		</div>

		<div id="footer"></div>
		

	</div>


</body>
</html>