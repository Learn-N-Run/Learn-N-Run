<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>
<script>
$(function(){
    $("#newpwd").blur(function(){
        var newpwd = $(this).val();
        if(newpwd == ''){
            $('#newpwdErr').text("필수 입력 사항입니다.");
        }else{
            var reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}/;
            if(!reg.test(newpwd)){
                $("#newpwdErr").text("새 비밀번호 형식이 바르지 않습니다.");
            }else{ $("#newpwdErr").text('');}
        }
    });
});


//비밀번호 확인
function pwdCheckFunction() {
				var newpwd = $('#newpwd').val();
				var newpwdCkd = $('#newpwdCkd').val();
				if(newpwd != newpwdCkd) {
					$('#pwdCheckMessage').html('변경할 비밀번호를 확인해주세요.');
				}else{
					$('#pwdCheckMessage').html('');
				}
			}


</script>

	<div class="conatiner">
		<div class="mt-5 p-5 rounded" style="background-color: #f5f6f7;">
			<form action="modify1.do" method="post">
			<h2 class="text-center">일반 회원정보 수정</h2>
			<p class="text-center mb-5 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">이름</div>
				<div class="col-4"><input type="text" class="form-control" id="name" name="name" readonly></div>
			</div>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">아이디</div>
				<div class="col-4"><input type="text" class="form-control" id="id" name="id" readonly></div>
			</div>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">이메일</div>
				<div class="col-4"><input type="text" class="form-control" id="email" name="email"></div>
			</div>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">
				<label for="pwd"><span class="text-danger">*</span> 현재 비밀번호</label></div>
				<div class="col-4"><input type="password" class="form-control" id="pwd" name="pwd" placeholder="********"></div>
			</div>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">
				<label for="newpwd">새 비밀번호</label></div>
				<div class="col-4"><input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwd" name="newpwd" placeholder="********"><br>
				<span style="color: red;" id="newpwdErr"></span></div>
			</div>
			<div class="row mb-4">
				<div class="col-4" style="text-align: right">
				<label for="newpwdCkd">새 비밀번호 확인</label></div>
				<div class="col-4"><input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwdCkd" name="newpwdCkd" placeholder="********"><br>
				<span style="color: red;" id="pwdCheckMessage"></span></div>
			</div>
			<div class="text-center mt-5">
           	 	<button class="btn btn-outline-info">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
           	 	<input type="reset" value="다시 입력" class="btn btn-outline-secondary">
        	</div>
		</div>
	</div>
	</form>
</body>
</html>