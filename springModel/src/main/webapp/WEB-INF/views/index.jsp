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
					<li><a href="join.view">회원가입</a></li>
					<li><a href="login.view">로그인</a></li>
					<% }else{ %>
					<li><a href="userCheck.view">회원관리</a></li>
					<li><a href="logout.do">로그아웃</a></li>
					<% } %>
					<li><a href="">메뉴</a></li>
				</ul>
			</div>	
		</div>

		<div id="container">
			
			<div class="title">
				<img src="/resources/img/bord_wood.jpg" alt="나무벽" />
				<h1 class="logo"></h1>
			</div>
			<!-- 업데이트 예정 -->
			<div class="search"><input type="text"  /></div> 
			
			<div class="shortcut">
				<ul>
				    <li><a href="fileList.do">파일 목록</a></li>
				    <li><a href="fileUpload.view">파일 업로드</a></li>
				    <li><a href="threejsBox.view">Three.js BOX</a></li>
				    <li><a href="crawler.do">네이버 웹툰 크롤링</a></li>
					<li><a href="canvas.view">캔버스 BOX</a></li>
				</ul>
			</div>
						

		</div>

		<div id="footer"></div>
		

	</div>


</body>
</html>