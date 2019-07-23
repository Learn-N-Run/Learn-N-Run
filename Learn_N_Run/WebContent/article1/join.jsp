<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
<link href="css/join.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">

<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
$(function(){
	
	$("#name").blur(function(){
		var name = $(this).val();
		if(name ==''){
			$("#nameErr").text("필수 입력 사항입니다.");
		}else{
			var reg = /^[가-힣]{2,5}$/;
			if(!reg.test(name)){
				$("#nameErr").text("잘 못된 이름입니다.");
			}else{ $("#nameErr").text(''); }
		}
	});
	
	$("#id").blur(function(){
		var id = $(this).val();
		if(id ==''){
			$("#idErr").text("필수 입력 사항입니다.");
		}else{
			var reg = RegExp(/^[a-zA-Z0-9]{4,12}$/);
			if(!reg.test(id)){
				$("#idErr").text("아이디 형식이 맞지 않습니다.");
			}else{ $("#idErr").text(''); }
		}
	});

/* 	$("#email").blur(function(){
		var email = $(this).val();
		if(email ==''){
			$("#emailErr").text("필수 입력 사항입니다.");
		}else{
			var reg = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			if(!reg.test(id)){
				$("#emailErr").html("이메일 형식이 맞지 않습니다.");
			}else{ $("#emailErr").text(''); }
		}
	}); */
}); 


function pwdCheckFunction() {
			var pwd = $('#pwd').val();
			var pwdCkd = $('#pwdCkd').val();
			if(pwd != pwdCkd) {
				$('#pwdCheckMessage').html('입력한 비밀번호를 확인해주세요.');
			}else{
				$('#pwdCheckMessage').html('');
			}
		}
		
function register(){
	var result = 1;
	var name = $("#name");
	var id = $("#id");
	var email = $("#email");
	var pwd = $("#pwd");
			
	if(name.val()==''){
		$("#nameErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(id.val()==''){
		$("#idErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if (pwd.val() == '') {
		$("#pwdErr").text("필수 입력 사항입니다.");
		result = 0;
	} 
	if (email.val() == '') {
		$("#emailErr").text("필수 입력 사항입니다.");
		result = 0;
	}

	if(result==0){
		alert("필수 사항을 기입해주세요.");
		return false;
	}
	if($("#idErr").text()!=''||$("#pwdErr").text()!=''||$("#emailErr").text()!=''){
		alert("오류 사항을 확인 후 다시 입력해주세요.");
		return false;
	} 
}
</script>
</head>
<body>

	<div class="required_fieldin">
		<h1 style="text-align:center; margin-top:30px;"> 회원가입 </h1>
			<form class="required_field" action="join.do" method="post" onsubmit="return register()">
		<div class="mem_form_group">
			<label for="name">이름(2-5자)</label><br>
			<input type="text" class="mem_reg_name" id="name" name="name" placeholder="이름을 입력해주세요."><br>
			<span style="color: red;" id="nameErr"></span>
		</div>
		<div class="mem_form_group">
			<label for="id">아이디</label><br>
			<input type="text" class="mem_reg_id" id="id" name="id" placeholder="아이디를 입력해주세요."><br>
			<span style="color: red;" id="idErr"></span>
		</div>
		<div class="mem_form_group">
			<label for="pwd">비밀번호 (8자 이상)</label><br>
			<input onkeyup="pwdCheckFunction();" type="password" class="mem_reg_pwd" id="pwd" name="pwd" placeholder="********">
		</div>
		<div class="mem_form_group">
			<label for="pwdCkd">비밀번호 확인</label>
			<input onkeyup="pwdCheckFunction();" type="password" class="mem_reg_pwdCkd" id="pwdCkd" name="pwdCkd" placeholder="********"><br>
			<span style="color: red;" id="pwdCheckMessage"></span>
		</div>
		<div class="mem_form_group">
			<label for="email">이메일</label><br>
			<input type="email" class="mem_reg_email" id="email" name="email" placeholder="example@mail.com"><br>
			<span style="color: red;" id="emailErr"></span>
		</div>
	
		<div>
			<input type="submit" id="mem_submit" value="가입하기">
		</div>
		<div>
			<input type="submit" id="btn_login" value="로그인">
		</div>
		</form>
	</div>

</body>
</html>