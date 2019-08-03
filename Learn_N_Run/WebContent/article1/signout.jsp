<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
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
   var pwd = $("#pwd");
   
   if(pwd.val() == ''){
      $("#pwdErr").text("비밀번호를 입력해 주세요.");
      result = 0;
   }
   if(result == 0 ){
      alert("비밀번호를 입력해야 탈퇴가 진행됩니다.");
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
      <h6 style="text-align:center; color: red;">모든정보가 삭제됩니다.</h6>
         <form class="required_field" action="delUserService.do" method="post" onsubmit="return signout()">
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