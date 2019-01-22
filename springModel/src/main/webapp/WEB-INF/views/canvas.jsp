<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Boolean code = true;
	String codeURL = "https://github.com/kmg1031/Development/blob/master/canvas.js";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>canvas BOX</title>
<link rel="stylesheet" href="/resources/css/header.css" media="all" />
<link rel="stylesheet" href="/resources/css/canvas.css" media="all" />
<link rel="stylesheet" href="/resources/css/join.css" media="all" />
<link rel="stylesheet" href="/resources/css/login.css" media="all" />
<link rel="stylesheet" href="/resources/css/list.css" media="all" />
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	media="all" />
<link rel="stylesheet" href="/resources/css/reset.css" media="all" />

</head>
<body>
	<div id="wrap">
		<%@ include file="/resources/js/header.js"%>

		<div id="box">
			<div class="canvasFrame">
				<canvas id="cnvs" width="1000" height="600"></canvas>
			</div>
		</div>

		<div id="screen">
			<button id="con1" class="btn con">HOME</button>
			<button id="con2" class="btn con">btn1</button>
			<button id="con3" class="btn con">btn2</button>
			<button id="con4" class="btn con">btn3</button>
		</div>

		<div id="bord">
			<div id="content" class="content"></div>
		</div>
		<div id="footer"></div>
	</div>
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/canvas.js"></script>
	<script>
		var bord = document.getElementById('bord');
		var content = document.getElementById('content');

		bord.addEventListener('click', bordCloseFn);

		$("#con1").on("click", function() {
			location.href = "index.jsp";
/*			
		});
		$("#con2").on("click", function() {
			$("#content").load("join.jsp", bordViewFn)

		});
		$("#con3").on("click", function() {
			$("#content").load("login.jsp", bordViewFn)

		});
		$("#con4").on("click", function() {

			$.ajax({ //ajax list get
				url : 'BordList.bo',
				data : {},
				type : 'post'
			}).done(function() {

			}).fail(function() {

			}).always(function() {
				$("#content").load("list.jsp", bordViewFn) //페이지 표시
			})

		});
*/
		function bordViewFn() {
			bord.style.display = "block";
			content.style.display = "block";
		}
		function bordCloseFn() {

			if (event.target === bord) {
				bord.style.display = "none";
			}
		}
	</script>
</body>
</html>