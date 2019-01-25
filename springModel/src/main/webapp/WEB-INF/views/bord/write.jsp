<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
	if(session.getAttribute("sessionId")==null){
		%>
		<script>
			alert("로그인 후 이용바랍니다");
			location.href = "/index.view";
		</script>
		<%	
	}
	Boolean code = false;
	String codeURL = ""; 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<link rel="stylesheet" href="/resources/css/layout/reset.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/wrap.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/container.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/footer.css" media="all" />
<link rel="stylesheet" href="/resources/css/write.css" media="all" />
</head>
<body>
<div id="wrap">
	<%@ include file="/resources/js/header.js"%>
	<div id="container">
	<div class="write">
		<form action="write.do" method="post" name="frm">
			<ul>
				<li><span>작성자 </span><input type="text" name="userId" id="userId" disabled="disabled" value="<%=session.getAttribute("sessionId")%>"/></li>
				<li><span>제목 </span><input type="text" name="title" id="title" placeholder="title" /></li>
				<li><span>내용 </span><textarea  name="memo"  style="resize: none;" ></textarea></li>
				<li>
					<input type="button" id="backBtn" value="뒤로가기" />
					<input type="button" name="btnSubmit" id="btnSubmit" value="등록" />
				</li>
			</ul>
		</form>
	</div>
	</div>
	<%@ include file="/resources/js/footer.js"%>
</div>

<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script>
	var frm = document.frm;
	var userId = frm.userId;
	var title = frm.title;
	var memo = frm.memo;
	var xhr = new XMLHttpRequest;
	frm.btnSubmit.addEventListener("click", bordWrite);
	
	$("#backBtn").click(function() {
		history.back();
	});
	
	function bordWrite(){
		
		if(title.value=="" || title.value == null){
			alert("제목을 입력해주세요");
			title.focus();
			return;
		}else if(memo.value == "" || memo.value == null){
			alert("내용을 작성해주세요");
			memo.focus();
			return;
		}else if(title.length>100){
			alert("100자까지만 입력해주세요");
			title.focus();
			return;
		}else if(memo.length>500){
			alert("500자까지만 입력해주세요");
			memo.focus();
			return;
		}
		bordWriteDo();
	}
	
	function bordWriteDo(){
		
		$.ajax({
			url : "/bord/write.do",
			data : {
				userId : userId.value,
				title : title.value,
				memo : memo.value
			},
			type : "post",
			success : function (data){
				alert("등록 성공");
				location.href = "/bord/list.do";
			},
			error : function (data){
				alert("등록 실패");
			}
		});
	}
	

</script>
</body>
</html>