<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>learnRun AddCreator</title>
<style type="text/css">
	.profile_img{
		text-align: center;
	}
</style>
<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function Creatorregister(){
	var result = 1;
	var nickname = $("#name");
	var number = $("#number");
	var email = $("#email");
	var url = $("#url");
			
	if(nickname.val()==''){
		$("#nicknameErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if(number.val()==''){
		$("#numberErr").text("필수 입력 사항입니다.");
		result = 0;
	}
	if (email.val() == '') {
		$("#emailErr").text("필수 입력 사항입니다.");
		result = 0;
	} 
	if (url.val() == '') {
		$("#urlErr").text("필수 입력 사항입니다.");
		result = 0;
	}

	if(result==0){
		alert("필수 사항을 기입해주세요.");
		return false;
	}
	if($("#nicknameErr").text()!=''||$("#numberErr").text()!=''||$("#emailErr").text()!=''||$("#urlErr").text()!=''){
		alert("입력사항을 빠짐없이 기입 후 다시 시도해주세요.");
		return false;
	} 
}
</script>
</head>
<body>
<div class="container">
   <div class="mt-5 p-5 rounded" style="background-color: #f5f6f7;"> <!-- 적용할 때는 mt-5 삭제해도됨 margin-top을 크기 5만큼 준다. p-5-> padding 전체를 크기 5만큼 준다라는 뜻 -->
      <form action="AddCreatorService.do" method="post">
      <h2 class="text-center">크리에이터 신청</h2>
      <p class="text-center mb-3 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
      <div class="m-auto">
      	 <div class="row mb-4">
      		<div class="col-5 m-auto profile_img">
      			<label for="profile_img"><span class="text-danger">*</span>프로필 이미지</label>
      			<div id="profile_img"><img src="WebContent/article1/img/profile_basic.png"></div>
      			<button class="btn btn-outline-info">사진 변경</button>
      		</div>
      		<div class="col-5 m-auto">
               <label for="nickname"><span class="text-danger">*</span>닉네임</label>
               <input type="text" class="form-control" id="nickname" name="nickname">
               <span style="color: red;" id="nicknameErr"></span>
            </div>
      	</div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="id">아이디</label>
               <input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.id }">
            </div>
            <div class="col-5 m-auto">
               <label for="email"><span class="text-danger">*</span> 이메일</label>
               <input type="text" class="form-control" id="email" name="email">
               <span style="color: red;" id="emailErr"></span>
            </div>
         </div>
         <div class="row mb-4">
             <div class="col-5 m-auto">
               <label for="id">이름</label>
               <input type="text" class="form-control" id="name" name="name" readonly value="${requestScope.user.name }">
            </div>
            <div class="col-5 m-auto">
               <label for="phone"><span class="text-danger">*</span> 휴대폰번호</label>
               <input type="text" class="form-control" id="number" name="number">
               <span style="color: red;" id="numberErr"></span>
            </div>
         </div>
         <div class="row mb-4">
         	<div class="col-5 m-auto"></div>
            <div class="col-5 m-auto">
               <label for="url"><span class="text-danger">*</span> URL</label>
               <input type="text" class="form-control" id="url" name="url">
               <span style="color: red;" id="urlErr"></span>
            </div>
         </div>
         <div class="text-center mt-5">
            <button type="submit" class="btn btn-outline-info" onsubmit="return Creatorregister()">크리에이터 신청</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
         </div>
      </div>
      </form>       
   </div>
</div>
</body>
</html>