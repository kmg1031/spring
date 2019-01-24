var xhr=new XMLHttpRequest();
var userId = document.getElementById("userId");
var userPw = document.getElementById("userPw");
var re = /^[a-zA-Z0-9]{4,16}$/;


function loginOk() {

	if (re.test(userId.value)) {
		alert("아이디를 확인해주세요");
		userId.focus();
		return false;
	} else if (re.test(userPw.value)) {
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
	xhr.onreadystatechange = loginOkFn;
	xhr.send(data);

}

function loginOkFn(){
	
	if (xhr.status == 200 && xhr.readyState == 4) {
	
		var result=xhr.responseText;
		
		if(result=="1"){
			alert("로그인 성공")
			location.href="index.view";
			
		}else{
			alert("로그인 실패")
			userPw.value="";
			userId.focus();			
		}
	}	
}