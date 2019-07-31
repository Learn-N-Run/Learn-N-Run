<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">
	.profile_img{
		text-align: center;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function registerPass() {
		if($("#pwd").val() != ${requestScope.user.pass}){
			alert("현재 비밀번호와 일치하지 않습니다.")
			return false;
		}
		if($("#newPwd").val() != $("#inewPwdCheck")){
			alert("새로운 비밀번호가 서로 일치하지 않습니다.")
			return false;
		}
		else{
			var result = confirm("정말 변경하시겠습니까?")
			if(result){
				return true;
			}else{
				return false;
			}
		}
	}


</script>
</head>
<body>
<div class="container">
   <div class="mt-5 p-5 rounded" style="background-color: #f5f6f7;"> <!-- 적용할 때는 mt-5 삭제해도됨 margin-top을 크기 5만큼 준다. p-5-> padding 전체를 크기 5만큼 준다라는 뜻 -->
       <c:if test="${sessionScope.Group == 2 }">
      <form action="modifymember1.do" method="post">
      <h2 class="text-center">회원 정보 수정</h2>
      <p class="text-center mb-3 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
      <div class="m-auto">
      	 <div class="row mb-4">
      		<div class="col-5 m-auto profile_img">
      			<label for="profile_img">프로필 이미지</label>
      			<div id="profile_img"><img src="img/${requestScope.user.profile_img }"></div>
      			<button class="btn btn-outline-info">사진 변경</button>
      		</div>
      		<div class="col-5 m-auto">
               <label for="id">닉네임</label>
               <input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.nickname }">
            </div>
      	</div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="id">아이디</label>
               <input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.id }">
            </div>
            <div class="col-5 m-auto">
               <label for="id">이름</label>
               <input type="text" class="form-control" id="name" name="name" readonly value="${requestScope.user.name }">
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="pwd"><span class="text-danger">*</span>현재 비밀번호</label>
               <input type="text" class="form-control" id="pwd" name="pwd">
            </div>
            <div class="col-5 m-auto">
               <label for="email"><span class="text-danger">*</span> 이메일</label>
               <input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email }">
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="newPwd">새 비밀번호</label>
               <input type="text" class="form-control" id="newPwd" name="newPwd">
            </div>
            <div class="col-5 m-auto">
               <label for="phone"><span class="text-danger">*</span> 휴대폰번호</label>
               <input type="text" class="form-control" id="number" name="number" value="${requestScope.user.number }">
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="newPwdCheck">새 비밀번호 확인</label>
               <input type="text" class="form-control" id="inewPwdCheck" name="newPwdCheck">
            </div>
            <div class="col-5 m-auto">
               <label for="url"><span class="text-danger">*</span> URL</label>
               <input type="text" class="form-control" id="url" name="url" value="${requestScope.user.creator_url }">
            </div>
         </div>
         <div class="text-center mt-5">
            <button type="submit" class="btn btn-outline-info" onsubmit="return registerPass()">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
         </div>
      </div>
      </form>
       </c:if>
       
       <c:if test="${sessionScope.Group == 1 }">
	       	<form action="modifymember1.do" method="post">
			      <h2 class="text-center">회원 정보 수정</h2>
			      <p class="text-center mb-3 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
			      <div class="m-auto">
			         <div class="row mb-4">
			            <div class="col-5 m-auto">
			               <label for="id">아이디</label>
			               <input type="text" class="form-control" id="id" name="id" readonly value="${requestScope.user.id }">
			            </div>
			            <div class="col-5 m-auto">
			               <label for="id">이름</label>
			               <input type="text" class="form-control" id="name" name="name" readonly value="${requestScope.user.name }">
			            </div>
			         </div>
			         <div class="row mb-4">
			            <div class="col-5 m-auto">
			               <label for="pwd"><span class="text-danger">*</span> 비밀번호</label>
			               <input type="text" class="form-control" id="pwd" name="pwd">
			            </div>
			            <div class="col-5 m-auto">
			               <label for="email"><span class="text-danger">*</span> 이메일</label>
			               <input type="text" class="form-control" id="email" name="email" value="${requestScope.user.email }">
			            </div>
			         </div>
			         <div class="row mb-4">
			            <div class="col-5 m-auto">
			               <label for="newPwd">새 비밀번호</label>
			               <input type="text" class="form-control" id="newPwd" name="newPwd">
			            </div>
						<div class="col-5 m-auto">
			               <label for="newPwdCheck">새 비밀번호 확인</label>
			               <input type="text" class="form-control" id="inewPwdCheck" name="newPwdCheck">
			            </div>
			         </div>
			         <div class="text-center mt-5">
			            <button type="submit" class="btn btn-outline-info" onsubmit="return registerPass()">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
			            <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
			         </div>
			      </div>
	      </form>
       </c:if>
   </div>
</div>
</body>
</html>