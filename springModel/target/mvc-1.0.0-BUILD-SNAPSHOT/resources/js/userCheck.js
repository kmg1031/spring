var xhr=new XMLHttpRequest();
var userId = document.getElementById("userId");
var userPw = document.getElementById("userPw");

function userCheckOk() {
	
	if (userPw.value == null || userPw.value == "") {
		alert("비밀번호을 확인해주세요");
		userPw.focus();
		return false;
	}
	
	var data = "userId=" + userId.value;
	data += "&userPw="+userPw.value;
	var url = "login.do";

	xhr.open("post", url);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=utf-8")
	xhr.onreadystatechange = userCheckOkFn;
	xhr.send(data);

}

function userCheckOkFn(){
	
	if (xhr.status == 200 && xhr.readyState == 4) {
	
		var result=xhr.responseText;
		
		if(result=="1"){
			location.href="info.view";
		}else{
			alert("비밀번호을 확인해주세요")
			userPw.value="";
			userPw.focus();			
		}
	}	
}