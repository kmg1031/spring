<%@ page pageEncoding="UTF-8"%>
<div id="header">
	<div class="overEvent"></div>
	<div class="gnb">
		<ul>
			<% if(session.getAttribute("sessionId")==null){ %>
			<li><a href="join.view">회원가입</a></li>
			<li><a href="login.view">로그인</a></li>
			<% }else{ %>
			<li><a href="logout.do">로그아웃</a></li>
			<% } %>
			<li><a href="https://github.com/kmg1031/spring">github</a></li>
			<li class="home" ><a href="/index.view"><img src="/resources/img/home-48px.png" alt="home" /></a></li>			
		</ul>
	</div>
</div>
<script>
/*
	var overEvent = document.getElementsByClassName("overEvent")[0];
	var gnb = document.getElementsByClassName("gnb")[0];
	
	function gnbUp(){
		gnb.style.top = "0";
	}
	function gnbDown(){
		gnb.style.top = "-70px";
	}

	window.addEventListener("scroll", function(){
		if(window.scrollY == 0){
			gnbUp();
		}else{
			gnbDown();
		}
	});

	overEvent.addEventListener("mouseover", gnbUp);
	
	overEvent.addEventListener("mouseout", function(){
		if(window.scrollY != 0){
			gnbDown();
		}
	});
	
*/
</script>