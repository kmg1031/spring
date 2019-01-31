<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>layout</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" media="all" />
<link rel="stylesheet" href="/resources/css/layout/reset.css"media="all" />
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
			<form name="frm" id="frm">
					<div class="form-group">
						<label>ȸ�� ���̵�</label>
						<input type="text" class="form-control" id="userId" name="userId" placeholder="ȸ�� ���̵�" />
					</div>
					<div class="form-group">
						<label>�ڵ�</label>
						<input type="text" class="form-control" id="bookCode" name="bookCode" placeholder="�ڵ�" />
					</div>
					<input type="button" class="btn btn-default" id="backBtn" value="�ڷΰ���" />
					<input type="button" class="btn btn-default" id="checkIn" name="checkIn" value="���� �ݳ�" />
					<input type="button" class="btn btn-default" id="checkOut" name="checkOut" 	value="���� �뿩" />
			</form>
		</div>

		<%@ include file="/resources/js/footer.js"%>

	</div>
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script>
		var $checkOutBtn = $("input#checkOut");
		var $checkInBtn = $("input#checkIn");
		var bookCode = document.frm.bookCode;
		var userId = document.frm.userId;

		$("#backBtn").click(function() {
			history.back();
		});
		
		$checkOutBtn.click(function() {
			if (!check()){
				return false;
			}
			if(!stateCheck()){
				alert("�뿩 ���� �����Դϴ�");
				return false;
			}
				
			$.ajax({
				url : "/book/checkOut.do",
				type : "post",
				data : {
					"bookCode" : bookCode.value,
					"userId" : userId.value
				},
				success : function(data){
					if(data=="1") {
						alert("�뿩 ó���Ǿ����ϴ�");
					}else{
						alert("�뿩 ����");
					}
				},
				fail : function(data){
					alert("�뿩 ����");
				}
			});
		});

		$checkInBtn.click(function() {
			if (!check()){
				return false;
			}
			if(stateCheck()){
				alert("�ش� ������ �뿩 �̷��� �����ϴ�");
				return false;
			}
			$.ajax({
				url : "/book/checkIn.do",
				type : "post",
				data : {
					"bookCode" : bookCode.value,
					"userId" : userId.value
				},
				success : function(data){
					if(data=="1") {
						alert("�ݳ��Ͽ����ϴ�");
					}else{
						alert("�ݳ� ����");
					}
				},
				fail : function(data){
					alert("�ݳ� ����");
				}
			});
		});

		
		function check(){
			var CodePattern = /^[a-zA-Z0-9]{40}$/;
			var namePattern = /^[a-zA-Z0-9]{1,100}$/;
			if(!CodePattern.test(bookCode.value)){
				alert("�ڵ� ����")
				return false;
			}
			if(!namePattern.test(userId.value)){
				alert("����� ���ڸ� �Է� �����մϴ�")
				return false;
			}
			return true;
		}
		
		function stateCheck(){
			var result;
			$.ajax({
				url : "/book/stateCheck.do",
				type : "POST",
				async: false,
				data : {
					"bookCode" : bookCode.value,
				},
				success : function(data){
					result = data;
				},
				fail : function(data){
					alert("�ٽ� �õ����ּ���");
				}
			});
			return result=='true';
		}
		
	</script>

</body>
</html>