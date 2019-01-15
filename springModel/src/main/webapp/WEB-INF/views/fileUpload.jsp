<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
</head>
<body>

<form action="<c:url value='fileUpload.do'/>" class="" method="post" enctype="multipart/form-data" >
	<input type="file" id="uploadFile" name="uploadFile"  />
	<input type="submit" value="등록"  />
	<input type="reset" value="취소"  />
</form>


</body>
</html>