var xhr=new XMLHttpRequest();
var userPw = document.getElementById("userPw");

function deleteOk() {

	if (userPw.value == null || userPw.value == "") {
		alert("비밀번호을 확인해주세요");
		userPw.focus();
		return false;
	}
	
	var data ="&userPw="+userPw.value;
	var url = "delete.do";

	xhr.open("post", url);
	xhr.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded;charset=utf-8")
	xhr.onreadystatechange = deleteOkFn;
	xhr.send(data);

}

function deleteOkFn(){
	
	if (xhr.status == 200 && xhr.readyState == 4) {
	
		var result=xhr.responseText;
		
		if(result=="1"){
			alert("탈퇴 성공")
			location.href="index.view";
			
		}else{
			alert("탈퇴 실패")
			userPw.value="";
			userPw.focus();			
		}
	}	
}