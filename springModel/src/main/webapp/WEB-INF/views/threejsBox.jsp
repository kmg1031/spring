<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>.
<%
	Boolean code = true;
	String codeURL = "https://github.com/kmg1031/Development/blob/master/threejsBox.js";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Three.js</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/threejsBox.css" media="all" />
</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>
	<div id="container">
		<script src="/resources/js/three.min.js"></script>
		<script src="/resources/js/threejsBox.js"></script>
	</div>
	<%@ include file="/resources/js/footer.js"%>
</div>
</body>
</html>