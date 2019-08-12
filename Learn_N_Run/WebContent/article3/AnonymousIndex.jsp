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
<!--외부참조(script.js, style.css) START LINE -->
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css">
	<script src="${contextpath}/article3/js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
	<title>Learn & Run</title>
<style type="text/css">
	#TH_AnonymousMain{
		padding: 20px;
		background-image: URL("${contextpath}/3_img/메인.jpeg");
		background-repeat: no-repeat;
		background-position: top;
		background-position: right;
		height: 105vh;
		font-stretch: 
	}
	#TH_AnonymousMain h1{
		color: rgba(255,255,255,0.8);
		text-shadow: 2px 2px 3px rgba(0,0,0,0.5);
		transition: all 1s;
		opacity: 0;
	}
	#TH_AnonymousMain>h3, #TH_AnonymousMain>h4{
		color: rgba(255,255,255,0.8);
		text-shadow: 2px 2px 3px rgba(0,0,0,0.8);
		transition: all 1s;
		opacity: 0;
	}
	#TH_signUPNOW{
		text-shadow: none;
	}
	#TH_signUPNOW{
		
	}		 
	.TH_mainContact>a{
		opacity: 0;
		transition: all 1s;
		text-decoration: none;
		color: tomato;
		font-size: 20px;
		font-weight: bold;
	}
	.TH_mainContact>a:HOVER{
		opacity: 1;
		text-decoration: none;
		font-size: 20px;
		font-weight: bold;
	}
	
</style>
<script type="text/javascript">
window.onload= function(){
	document.querySelector('#TH_AnonymousMain>h1').style.opacity = '1';
	setTimeout(function(){
		document.querySelector('#TH_AnonymousMain>h3').style.opacity = '1';
	}, 1000);
	setTimeout(function(){
		document.querySelector('#TH_AnonymousMain>h4').style.opacity = '1';
	}, 2000);
	setTimeout(function(){
		document.querySelectorAll('.TH_mainContact>a')[0].style.opacity = '1';
		document.querySelectorAll('.TH_mainContact>a')[1].style.opacity = '1';
	}, 3000);
	
}
</script>
</head>
<body style="overflow: hidden;">
<c:import url="/1_Include/header.jsp"></c:import>
	<div id="wrap">
		<div id="TH_AnonymousMain" class="jombotron">
			<h1>회원이신가요?</h1>
			<h3>회원이 아니시면
				<br>
				 지금 바로 
				<a id="TH_signUPNOW" href="${contextpath}/article1/join.jsp" 
					 style="text-decoration:none;
							text-shadow: 2px 2px 3px tomato;
							color: tomato">
				회원가입</a>해보세요!~
			</h3>
			<h4>저희 Learn_N_Run에서는 여러분에게 필요한<br>
				 많은 정보가 여러분을 기다리고 있습니다.</h4>
			<div class="TH_mainContact row">
				<a href="#login-box" class="login-window col-xs-3">
					<span class="glyphicon glyphicon-check"></span>
					로그인
				</a>
				<a href="${contextpath}/article1/join.jsp" class="col-xs-4">
					<span class="glyphicon glyphicon-edit"></span>
					회원가입
				</a>
			</div>
		</div>
	</div>
<c:import url="/1_Include/footer.jsp"></c:import>
</body>
</html>