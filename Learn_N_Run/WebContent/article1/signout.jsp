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

	<div class="required_fieldin">
		<h1 style="text-align:center; margin-top:30px;"> 회원탈퇴 </h1>
			<form class="required_field" action="delUserService.do" method="post" onsubmit="return register()">
		<div class="mem_form_group">
			<label for="id">아이디</label><br>
			<input type="text" class="mem_out_id" id="id" name="id" readonly="${id }"><br>
		</div>
		<div class="mem_form_group">
			<label for="pwd">비밀번호를 입력하세요.</label><br>
			<input type="password" class="mem_out_pwd" id="pwd" name="pwd" placeholder="********">
		</div>
		<div>
			<input type="submit" id="out_submit" value="탈퇴하기">
		</div>
		</form>
	</div>

</body>
</html>