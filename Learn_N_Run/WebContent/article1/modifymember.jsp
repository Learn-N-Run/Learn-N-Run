<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<div class="container">
   <div class="mt-5 p-5 rounded" style="background-color: #f5f6f7;"> <!-- 적용할 때는 mt-5 삭제해도됨 margin-top을 크기 5만큼 준다. p-5-> padding 전체를 크기 5만큼 준다라는 뜻 -->
      <form>
      <h2 class="text-center">회원 정보 수정</h2>
      <p class="text-center mb-5 text-muted"><span class="text-danger">*</span>는 필수 입력 사항입니다.</p>
      <div class="m-auto">
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="id">아이디</label>
               <input type="text" class="form-control" id="id" name="id" readonly>
            </div>
            <div class="col-5 m-auto">
               <label for="id">이름</label>
               <input type="text" class="form-control" id="name" name="name" readonly>
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="pwd"><span class="text-danger">*</span> 비밀번호</label>
               <input type="text" class="form-control" id="pwd" name="pwd">
            </div>
            <div class="col-5 m-auto">
               <label for="email"><span class="text-danger">*</span> 이메일</label>
               <input type="text" class="form-control" id="email" name="email">
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="newPwd">새 비밀번호</label>
               <input type="text" class="form-control" id="newPwd" name="newPwd">
            </div>
            <div class="col-5 m-auto">
               <label for="phone"><span class="text-danger">*</span> 휴대폰번호</label>
               <input type="text" class="form-control" id="phone" name="phone">
            </div>
         </div>
         <div class="row mb-4">
            <div class="col-5 m-auto">
               <label for="newPwdCheck">새 비밀번호 확인</label>
               <input type="text" class="form-control" id="inewPwdCheck" name="newPwdCheck">
            </div>
            <div class="col-5 m-auto">
               <label for="url"><span class="text-danger">*</span> URL</label>
               <input type="text" class="form-control" id="url" name="url">
            </div>
         </div>
         <div class="text-center mt-5">
            <button class="btn btn-outline-success">회원 수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="다시 입력" class="btn btn-outline-secondary">
         </div>
      </div>
      </form>
   </div>
</div>
</body>
</html>