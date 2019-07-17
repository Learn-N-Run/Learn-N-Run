<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<!-- <script src="./js/script.js"></script> -->
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<style type="text/css">
#inc_header{
	height: 100px;
	position: relative;
	vertical-align: middle;
	max-width: 1200px;
	width: 100vw;
	border-bottom: 1px double rgba(0,0,0,0.2);
}
#inc_menuList{
	font-size: 15px;
	font-weight: bold;
	text-align: right;
	float: left;
}
#inc_menuList>ul>li{
 	margin-left: 10px;
 	margin-right: 10px;
 	vertical-align: middle;
 	transition: all 0.5s
}
#inc_menuList>ul>li:HOVER{
/* 	animation-duration: 0.5s; */
/* 	animation-name: inc_menuHOVER; */
	font-size:30px;
}

.inc_floating{
	position: relative;
	top: 30px;
}



</style>
<title></title>
</head>
<body>
	<header id="inc_header">
		<div class="col-xs-2" align="center">
			<a href="${contextpath}/article3/index.jsp" style="width: 100px; height: 100px;">
				<img src="img/large.png">
			</a>
		</div>
		<div class="inc_floating col-xs-10" align="left">
			<div class="col-xs-8">
				<form>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="카테고리 + 제목">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default" style="background-color: white;">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-xs-4" align="right">
				<div id="inc_menuList" class="visible-lg-inline">
					<ul class="list-inline">
						<li>
							<a href="#"
							 style="text-decoration: none; color: black;">
								로그아웃
							</a>
						</li>
						<li>
							<a href="#"
							 style="text-decoration: none; color: black;">
							 마이페이지
							</a>
						</li>
						<li>
							<a href="#"
							 style="text-decoration: none; color: black;">
							로그인
							</a>
						</li>
						<li>
							<a href="#"
							 style="text-decoration: none; color: black;">
							회원가입
							</a>
						</li>
					</ul>
				</div>
				<div id="inc_hamburger" class="visible-xs-inline visible-sm-inline visible-md-inline">
					<span class="glyphicon glyphicon-menu-hamburger"
							style="font-size: 25px;">
					</span>
				</div>
			</div>
		</div>
	</header>
</body>
</html>