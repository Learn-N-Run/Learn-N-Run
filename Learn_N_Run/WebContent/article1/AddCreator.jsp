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
function replaceAll(str, searchStr, replaceStr) {
	  return str.split(searchStr).join(replaceStr);
	}

$(function(){
	//닉네임 확인
	$("#nickname").blur(function(){
		var nickname = $(this).val();
		if(nickname ==''){
			$("#nicknameErr").text("필수 입력 사항입니다.");
		}else{ 
			$("#nicknameErr").text(''); }
		});
	
	//url 확인
	$("#url").blur(function(){
		var urlname = $(this).val();
		if(urlname ==''){
			$("#urlErr").text("필수 입력 사항입니다.");
		}else{ 
			$("#urlErr").text(''); }
		});
	
/* 	//휴대폰 확인
	$("#number").blur(function(){
		var number = $(this).val();
		if(number ==''){
			$("#numberErr").text("필수 입력 사항입니다.");
		}else{ 
			var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
			if(!reg.test(number)){
				$("#numberErr").text("올바른 핸드폰 번호를 입력해주세요.");
			}else{ $("#numberErr").text(''); }
		}
	}); */
	
	//파일크기 유효성
	
	//이메일 유효성
	 $("#email").blur(function(){
			var email = $(this).val();
			if(email ==''){
				$("#emailErr").text("필수 입력 사항입니다.");
			}else{
	            var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	            if(!reg.test(email)){
	                $("#emailErr").text("이메일 형식이 맞지 않습니다.");
				}else{ $("#emailErr").text(''); }
			}
		}); 
});

function Creatorregister(){
	var result = 1;
	var nickname = $("#nickname");
	var number = $("#number");
	var email = $("#email");
	var url = $("#url");
	var preview = $("#preview");
			
	if(nickname.val()==''){
		$("#nicknameErr").text("닉네임을 입력하세요.");
		result = 0;
	}
	if(number.val()==''){
		$("#numberErr").text("전화번호를 입력하세요.");
		result = 0;
	}
	if (email.val() == '') {
		$("#emailErr").text("이메일을 입력하세요.");
		result = 0;
	} 
	if (url.val() == '') {
		$("#urlErr").text("url주소를 입력하세요.");
		result = 0;
	}
	if (preview.attr("src") == '') {
		$("#profile_imgErr").text("파일을 입력하세요.");
		result = 0;
	}

	if(result==0){
		alert("필수 사항을 기입해주세요.");
		return false;
	}
	if($("#nicknameErr").text()!=''||$("#numberErr").text()!=''||$("#emailErr").text()!=''||$("#urlErr").text()!='' || $("#profile_imgErr").text()!=''){
		alert("입력사항을 빠짐없이 기입 후 다시 시도해주세요.");
		return false;
	} 
	number = number.val().replace(/-/g,""); // '-' 문자 제거
	$("#number").val(number); //제거 후 다시 number값으로 저장
}

function readIMAGE(input){ //input type="file"태그를 매개변수로 전달받아서

	if(input.files && input.files[0]){
		//FileReader객체 생성
		var reader = new FileReader();
		//지정한 img태그에 File안에 있는 내용을 읽어 들인다.
		reader.readAsDataURL(input.files[0]);
		//파일을 모두 읽어 들였다면
		reader.onload = function(ProgressEvent){
			//읽어들인 File객체 정보는 매개변수로 넘어오는
			//ProgressEvent객체 내부의 target속성에 JSON데이터 형식으로 저장되어 있다.
			//또한 JSON객체 데이터 내부에는 result속성에 읽어들인 File정보가 저장되어 있다.
			$('#preview').attr('src', ProgressEvent.target.result);
			$("#profile_imgErr").text(''); 
		}
	}
	
}
</script>
</head>
<body>
<jsp:include page="/1_Include/header.jsp"/>
	<div id="wrap">
<div class="container">
   <div class="mt-5 p-5 rounded" style="background-color: #f5f6f7;"> 
      <form action="AddCreatorService.do" method="post" enctype="multipart/form-data" onsubmit="return Creatorregister()">
      <h2 class="text-center">크리에이터 신청</h2>
      <p class="text-center mb-3 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
      <div class="m-auto">
      	 <div class="row mb-4">
      		<div class="col-5 m-auto profile_img">
      			<label for="profile_img"><span class="text-danger">*</span>프로필 이미지</label>
      			<div id="profile_img" style="margin-bottom:10px">
      				<img style="width:200px; height:250px;" id="preview" src="">
      				<input type="file" accept="image/*" id="profile_img" name="profile_img" onchange="readIMAGE(this);">
      				<span style="color: red;" id="profile_imgErr"></span>
      			</div>
      		</div>
      	</div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="id">아이디</label>
               <input type="text" class="form-control" id="id" name="id" readonly value="${sessionScope.id}">
            </div>
            <div class="col-5 m-auto">
               <label for="email"><span class="text-danger">*</span> 이메일</label>
               <input type="text" class="form-control" id="email" name="email" placeholder="example@mail.com">
               <span style="color: red;" id="emailErr"></span>
            </div>
         </div>
         <div class="row mb-4">
             <div class="col-5 m-auto">
               <label for="name">이름</label>
               <input type="text" class="form-control" id="name" name="name" readonly value="${sessionScope.name}">
            </div>
            <div class="col-5 m-auto">
               <label for="number"><span class="text-danger">*</span> 핸드폰번호</label>
               <input type="text" class="form-control" id="number" name="number" placeholder="010-1234-5678(숫자만 입력하세요.)">
               <span style="color: red;" id="numberErr"></span>
            </div>
         </div>
         <div class="row mb-4">
         	<div class="col-5 m-auto">
               <label for="nickname"><span class="text-danger">*</span>닉네임</label>
               <input type="text" class="form-control" id="nickname" name="nickname">
               <span style="color: red;" id="nicknameErr"></span>
            </div>
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
</div>
<jsp:include page="/1_Include/fincate.jsp"></jsp:include>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>