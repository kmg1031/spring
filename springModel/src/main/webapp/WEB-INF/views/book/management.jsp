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
<title>layout</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/book/form.css" media="all" />

</head>
<body>

<div id="wrap">

	<%@ include file="/resources/js/header.js"%>
	
	<div id="container">
		<div class="">
			<form name="frm" id="frm">
					<div class="form-group">
						<label>코드</label>
						<input type="text" class="form-control" id="bookCode" name="bookCode" placeholder="코드" />
					</div>
					<div class="form-group">
						<label>도서명</label>
						<input type="text" class="form-control" id="bookName" name="bookName" placeholder="도서명"/>
					</div>
					<div class="form-group">
						<label>저자</label>
						<input type="text" class="form-control" id="author" name="author" placeholder="저자"/>
					</div>
					<input type="button" class="btn btn-default" id="backBtn" value="뒤로가기" />
					<input type="button" class="btn btn-default" id="addInfo" name="addInfo" value="도서 등록" />
			</form>
		</div>
	</div>
	
	<%@ include file="/resources/js/footer.js"%>
	
</div>
<script src="/resources/js/jquery-3.3.1.min.js" ></script>
<script>

	var $addInfoBtn = $("input#addInfo");
	var bookCode = document.frm.bookCode;
	var bookName = document.frm.bookName;
	var bookAuthor = document.frm.author;
	
	$("#backBtn").click(function() {
		history.back();
	});
	$addInfoBtn.click(function() {
		if(!check())return false;
		$.ajax({
			url : "/book/addInfo.do",
			type : "post",
			data : {
					"bookCode" : bookCode.value,
					"bookName" : bookName.value,
					"bookAuthor" : bookAuthor.value
					},
			success : function(data){
				if(data=="1") {
					alert("등록 성공");
				}else{
					alert("등록 실패");
				}
			},
			fail : function(data){
				alert("등록 실패");
			}
		});
	});
	
	function check(){
		var CodePattern = /^[a-zA-Z0-9]{40}$/;
		var namePattern = /^[a-zA-Z0-9]{1,100}$/;
		if(!CodePattern.test(bookCode.value)){
			alert("코드 오류")
			return false;
		}
		if(!namePattern.test(bookName.value)){
			alert("영어와 숫자만 입력 가능합니다")
			return false;
		}
		if(!namePattern.test(bookAuthor.value)){
			alert("영어와 숫자만 입력 가능합니다")
			return false;
		}
		return true;
	}
	
</script>

</body>
</html>