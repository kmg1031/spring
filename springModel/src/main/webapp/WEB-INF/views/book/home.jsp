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
<title>book home</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/book/home.css" media="all" />

</head>
<body>

<div id="wrap">

	<%@ include file="/resources/js/header.js"%>
	
	<div id="container">
		<div class="bookHome">
		<ul>
			<li><a href="/book/list.do">도서 목록</a></li>
			<li><a href="/book/service.view">대여 / 반납</a></li>
			<li><a href="/book/management.view">도서 추가</a></li>
		</ul>
		</div>
	</div>
	
	<%@ include file="/resources/js/footer.js"%>
	
</div>

</body>
</html>