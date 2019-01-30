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
						<input type="text" class="form-control" id="bookCood" name="bookCood" placeholder="�ڵ�" />
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
		var bookCood = document.frm.bookCood;
		var userId = document.frm.userId;

		$("#backBtn").click(function() {
			history.back();
		});
		$checkInBtn.click(function() {
			if (!check())
				return false;
			$.ajax({
				url : "/book/checkIn.do",
				type : "post",
				data : {
					"bookCood" : bookCood.value,
					"userId" : userId.value,
				},
				done : function(data) {
					alert("����");
				},
				fail : function(data) {
					alert("����");
				}
			});
		});

		$checkOutBtn.click(function() {
			if (!check())
				return false;
			$.ajax({
				url : "/book/checkOut.do",
				type : "post",
				data : {
					"userId" : userId.value,
				},
				done : function(data) {
					alert("����");
				},
				fail : function(data) {
					alert("����");
				}
			});
		});

		function check() {
			var coodPattern = /^[a-zA-Z0-9]{40}$/;

			if (!coodPattern.test(bookCood.value)) {
				alert("�ڵ� ������ ���� �ʽ��ϴ�")
				return false;
			}
			if (!userId.test(bookCood.value)) {
				alert("���̵� ������ ���� �ʽ��ϴ�")
				return false;
			}
			return true;
		}
	</script>

</body>
</html>