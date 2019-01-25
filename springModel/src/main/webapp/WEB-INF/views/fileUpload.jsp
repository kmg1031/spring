<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Boolean code = false;
	String codeURL = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/fileUpload.css" media="all" />
</head>
<body>

	<div id="wrap">
		<%@ include file="/resources/js/header.js"%>
		<div id="container">
			<div class="content">
				<form action="<c:url value='fileUpload.do'/>" class="" method="post"
					name="frm" id="frm" enctype="multipart/form-data">
					<ul>
						<li><input type="file" id="uploadFile" name="uploadFile" /></li>
						<li><input type="button" id="btnSubmit" name="btnSubmit"
							value="등록" /> <input type="reset" value="취소" /></li>
					</ul>
				</form>
			</div>
		</div>
		<%@ include file="/resources/js/footer.js"%>
	</div>

	<script>
		var frm = document.getElementById("frm");
		var uploadFile = document.getElementById("uploadFile");
		var btnSubmit = document.getElementById("btnSubmit");
		btnSubmit.addEventListener("click", fileCheck);

		function fileCheck() {

			var file = uploadFile.value;
			var fileExt = file.substring(file.lastIndexOf('.') + 1); //파일의 확장자를 구합니다
			var bSubmitCheck = true;

			if (!file) {
				alert("파일을 선택하여 주세요!");
				return;
			}
			if (!(fileExt.toUpperCase() == "TXT")) {
				alert("text 파일만 업로드 하실 수 있습니다!");
				return;
			}
			alert("파일 업로드를 시작합니다.");
			frm.submit();
		}
	</script>
</body>
</html>