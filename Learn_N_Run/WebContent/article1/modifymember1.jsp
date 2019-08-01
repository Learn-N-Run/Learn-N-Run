<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jquery 사용 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
   //비밀번호 갱신 숨김
   $("#check").hide();
   
   //기존 비밀번호 체크
   $("#pwd").blur(function(){
      var pwd = $(this).val();
      if(pwd ==''){
         $("#pwd").text("필수 입력 사항입니다.");
      }else{
         $.ajax({
            type: "post",
            async: false,
            url: "${contextPath}/me/pwdCheck.me", //비밀번호 체크하는 것 만들어야함
            data: {pwd : pwd},
            success: function(data){
               if(data == 0){
                  $("#pwdErr").text("비밀번호가 틀립니다.");
               }else{
                  $("#pwdErr").text('');
               }
            },
            error: function(){
               alert("서버 내부 에러가 발생했습니다.");
            }
         });
      }
   });
   
   //새로운 비밀번호 확인
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
   
   //새로운 비밀번호 체크 확인
   $("#newpwdCkd").blur(function(){
      var pwd2 = $("#newpwdCkd").val();
      if(pwd2 ==''){
         $("#pwdCheckMessage").text("필수 입력 사항입니다.");
      }else{
         if($("#newpwd").val() != pwd2){
            $("#pwdCheckMessage").text("비밀번호 확인이 맞지 않습니다.");
         }else{  $("#pwdCheckMessage").text(''); }
      }
   });
   
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
   
   //이름 확인
   $("#name").blur(function(){
      var name = $(this).val();
      if(name ==''){
         $("#nameErr").text("필수 입력 사항입니다.");
      }else{
         var reg = /^[가-힣]{2,5}$/;
         if(!reg.test(name)){
            $("#nameErr").text("정확한 이름을 입력하세요.");
         }else{ $("#nameErr").text(''); }
      }
   });
   
});

//비밀번호 확인
function pwdCheckFunction() {
   var pwd = $("#pwd").val();
   if(pwd==''){
      alert("기존 비밀번호를 입력해주세요.");
   }
   else if($("#pwdErr").text() !=''){
      alert("기존 비밀번호가 다릅니다.");
   }else{
      $("#check").show();
   }
}
   
function modify(){
   var result = 1;
   var pwd = $("#pwd");
   var newpwd = $("#newpwd");
   var email = $("#email");
   
   if(pwd.val()==''){
      $("#pwdErr").text("필수 입력 사항입니다.");
      result = 0;
   }
   if(email.val()==''){
      $("#emailErr").text("필수 입력 사항입니다.");
      result = 0;
   }
   if(newpwd.val()=='') {
      $("#newpwd").val(pwd.val()); //신규 비밀번호 값이 비워져있을 경우 무조건 기존 비밀번호의 값 셋팅
   } 
   
   if(result==0){
      alert("필수 사항을 기입해주세요.");
      return false;
   }
   
   if($("#pwd").text()!=''||$("#newpwd").text()!=''||$("#newpwdCkd").text()!=''||$("#email").text()!=''){
      alert("오류 사항을 확인 후 다시 입력해주세요.");
      return false;
   } 
   
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
		}
	}
	
}

</script>
<style type="text/css">
	#profile_img{
		    height: 300px;
    		text-align: center;
	}
	#preview{
		width: 100%;
		height: 100%;
	}
	#wrap {
	width: 1200px;
	margin: 0 auto;
}
.content_h {
	max-width: 800px;
	margin: 0 auto;
	height: 1050px;
	border: 0.3px solid gray;
}
</style>
</head>
<body style="background-color: #f5f6f7;">
	<div id="wrap">
		<jsp:include page="/1_Include/header.jsp" />
		<div id="center">
   <div class=".content_h">
      <h2 class="text-center">회원정보 수정</h2>
      <p class="text-center mb-5 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
      	<c:if test="${sessionScope.Group == 2 }">
		      <form action="modifymember1.do" method="post" enctype="multipart/form-data">
		      <div class="m-auto">
		      	<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">프로필 이미지</div>
	        		 <div class="col-4">
						<div id="profile_img" style="margin-bottom:10px"><img id="preview" src="img/${requestScope.user.profile_img }"><input type="file" accept="image/*" name="profile_img" onchange="readIMAGE(this);"></div>
					</div>
	    		</div>
	    		<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">아이디</div>
	        		 <div class="col-4"><input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.id }"></div>
	    		</div>
		      	<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">이름</div>
	        		 <div class="col-4"><input type="text" class="form-control" id="name" name="name" readonly value="${requestScope.user.name }"></div>
	    		</div>
    			<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">닉네임</div>
	        		 <div class="col-4"><input type="text" class="form-control" id="nickname" name="nickname" value="${requestScope.user.nickname }"></div>
	    		</div>
	    		<div class="row mb-4">
			         <div class="col-4" style="text-align: right">이메일</div>
			         <div class="col-4"><input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email }">
			            <span style="color: red;" id="emailErr"></span>
			         </div>
	      		</div>
	    		<div class="row mb-4">
			         <div class="col-4" style="text-align: right">
			            <label for="pwd"><span class="text-danger">*</span> 현재 비밀번호</label>
			         </div>
			         <div class="col-4">
			            <input type="password" class="form-control" id="pwd" placeholder="********"> <!-- name="pwd"지움, DB에는 신규 비밀번호 값만 들어감 -->
			            <span style="color: red;" id="pwdErr"></span>
			         </div>
			         <div><input type="button" id="pwdCheck" value="비밀번호 변경" onclick="pwdCheckFunction()"></div>
	     		 </div>
			      <div id="check">
			         <div class="row mb-4">
			            <div class="col-4" style="text-align: right">
			               <label for="newpwd">새 비밀번호</label>
			            </div>
			            <div class="col-4">
			               <input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwd" name="newpwd" placeholder="********">
			               <span style="color: red;" id="newpwdErr"></span>
			            </div>
			         </div>
			         <div class="row mb-4">
			            <div class="col-4" style="text-align: right">
			               <label for="newpwdCkd">새 비밀번호 확인</label>
			            </div>
			            <div class="col-4"><input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwdCkd" name="newpwdCkd" placeholder="********">
			               <span style="color: red;" id="pwdCheckMessage"></span>
			            </div>
			         </div>
			      </div>
	    		<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">전화번호</div>
	        		 <div class="col-4"><input type="text" class="form-control" id="number" name="number" value="${requestScope.user.number }"></div>
	    		</div>
	    		<div class="row mb-4">
	        		 <div class="col-4" style="text-align: right">URL</div>
	        		 <div class="col-4"><input type="text" class="form-control" id="url" name="url" value="${requestScope.user.creator_url }"></div>
	    		</div>
		 		<div class="text-center mt-5">
	                 <button class="btn btn-outline-info">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
	                 <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
          		</div>
		      </div>
		      </form>
       </c:if>
       
       <c:if test="${sessionScope.Group == 1 }">
       	<form action="modifymember1.do" method="post" onsubmit="return modify()"> <!-- onsubmit을 이용해서 modify() return값이 true일때만 form 진행 -->
	      <div class="row mb-4">
	         <div class="col-4" style="text-align: right">이름</div>
	         <div class="col-4"><input type="text" class="form-control" id="name" name="name" readonly value="${requestScope.user.name }"></div>
	      </div>
	      <div class="row mb-4">
	         <div class="col-4" style="text-align: right">아이디</div>
	         <div class="col-4"><input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.id }"></div>
	      </div>
	      <div class="row mb-4">
	         <div class="col-4" style="text-align: right">이메일</div>
	         <div class="col-4"><input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email }">
	            <span style="color: red;" id="emailErr"></span>
	         </div>
	      </div>
	      <div class="row mb-4">
	         <div class="col-4" style="text-align: right">
	            <label for="pwd"><span class="text-danger">*</span> 현재 비밀번호</label>
	         </div>
	         <div class="col-4">
	            <input type="password" class="form-control" id="pwd" placeholder="********"> <!-- name="pwd"지움, DB에는 신규 비밀번호 값만 들어감 -->
	            <span style="color: red;" id="pwdErr"></span>
	         </div>
	         <div><input type="button" id="pwdCheck" value="비밀번호 변경" onclick="pwdCheckFunction()"></div>
	      </div>
	      <div id="check">
	         <div class="row mb-4">
	            <div class="col-4" style="text-align: right">
	               <label for="newpwd">새 비밀번호</label>
	            </div>
	            <div class="col-4">
	               <input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwd" name="newpwd" placeholder="********">
	               <span style="color: red;" id="newpwdErr"></span>
	            </div>
	         </div>
	         <div class="row mb-4">
	            <div class="col-4" style="text-align: right">
	               <label for="newpwdCkd">새 비밀번호 확인</label>
	            </div>
	            <div class="col-4"><input type="password" onkeyup="pwdCheckFunction();" class="form-control" id="newpwdCkd" name="newpwdCkd" placeholder="********">
	               <span style="color: red;" id="pwdCheckMessage"></span>
	            </div>
	         </div>
	      </div>
	      <div class="text-center mt-5">
	                 <button class="btn btn-outline-info">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
	                 <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
          </div>
      </form>
      </c:if>
   </div>
   </div>
   <jsp:include page="footer.jsp"></jsp:include>
   </div>
   <jsp:include page="cateEx.jsp"></jsp:include>
</body>
</html>