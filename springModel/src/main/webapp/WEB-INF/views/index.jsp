<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	Boolean code = false;
	String codeURL = ""; 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>main</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/index.css" media="all" />
<link rel="stylesheet" href="/resources/css/skills.css" media="all" />
</head>
<body>

	<div id="wrap">
		<%@ include file="/resources/js/header.js"%>
		<div id="container">
		
			<div class="title">
				<h1 class="logo">��Ʈ������ ����Ʈ�Դϴ�</h1>
			</div>
			
			<%@ include file="/resources/js/skills.js"%>
				
			<div class="shortcut">
				<ul>
				<!--
 					<li><a href="fileList.do">���� ���</a></li>
				    <li><a href="fileUpload.view">���� ���ε�</a></li>
				 -->
				    <li><a href="bord/list.do">�Խ��� ���</a></li>
				    <li><a href="threejsBox.view">Three.js BOX</a></li>
				    <li><a href="crawler.do">���̹� ���� ũ�Ѹ�</a></li>
					<li><a href="canvas.view">ĵ���� BOX</a></li>
				</ul>
			</div>

		</div>

		<%@ include file="/resources/js/footer.js"%>
	
	</div>
</body>
</html>