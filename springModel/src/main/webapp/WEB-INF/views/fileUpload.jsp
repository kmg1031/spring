<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/fileUpload.css" media="all" />
</head>
<body>
<%
	Boolean code = false;
	String codeURL = ""; 
%>
	<%@ include file="/resources/js/header.js"%>
<div class="content">
	<form action="<c:url value='fileUpload.do'/>" class="" method="post"
		name="frm" id="frm" enctype="multipart/form-data">
		<ul>
			<li><input type="file" id="uploadFile" name="uploadFile" /></li>
			<li><input type="button" id="btnSubmit" name="btnSubmit" value="등록" />
				<input type="reset" value="취소" />
			</li>
		</ul>
	</form>
</div>
	<script type="text/javascript">
		var frm = document.frm
		var uploadFile = frm.uploadFile;
		var btnSubmit = frm.btnSubmit;
		btnSubmit.addEventListener("click", fileCheck);

		function fileCheck(frm) {

			var file = uploadFile.value;
			var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다.
			var bSubmitCheck = true;

			if (!file) {
				alert("파일을 선택하여 주세요!");
				return;
			}
			if (!(fileExt.toUpperCase() == "txt")) {
				alert("text 파일만 업로드 하실 수 있습니다!");
				return;
			}
			alert("파일 업로드를 시작합니다.");
			frm.submit;
		}
	</script>
</body>
</html>