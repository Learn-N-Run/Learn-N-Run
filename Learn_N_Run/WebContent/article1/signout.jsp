<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Out</title>
<link href="css/signout.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<%
HttpSession session2 = request.getSession();
session2.setAttribute("id", "삭제해야될 세션아이디 영역");
String id = (String)session.getAttribute("id");
%>

<script>

function signout(){
	var result = 1;
	var pwd = $("#pwd");
	
	if(pwd.val() == ''){
		$("#pwdErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(result == 0 ){
		alert("비밀번호를 입력해 주세요.");
		return false;
	}
	if($("#pwdErr").text() != ''){
		alert("오류 사항을 확인 후 다시 입력해주세요.");
		return false;
	}
}
</script>

	<div class="required_fieldin">
		<h1 style="text-align:center; margin-top:30px;"> 회원탈퇴 </h1>
		<h5>비밀번호를 입력하여야 회원탈퇴가 진행됩니다.</h5>
			<form class="required_field" action="delUserService.do" method="post" onsubmit="return register()">
		<div class="mem_form_group">
			<label for="id">아이디</label><br>
			<input style="background-color: gray" type="text" class="mem_out_id" id="id" name="id" value="${id }" readonly><br>
		</div>
		<div class="mem_form_group">
			<label for="pwd">비밀번호를 입력하세요.</label><br>
			<input type="password" onkeyup="pwdCheckFunction();" class="mem_out_pwd" id="pwd" name="pwd" placeholder="********">
		</div>
		<div class="mem_form_group">
			<label for="pwdCkd">비밀번호를 한번 더 입력하세요.</label><br>
			<input type="password" onkeyup="pwdCheckFunction();" class="mem_out_pwdCkd" id="pwdCkd" name="pwdCkd" placeholder="********">
		</div>
		<span style="color: red;" id="pwdErr"></span>
		<div>
			<input type="submit" id="out_submit" value="탈퇴하기">
		</div>
		</form>
	</div>

</body>
</html>