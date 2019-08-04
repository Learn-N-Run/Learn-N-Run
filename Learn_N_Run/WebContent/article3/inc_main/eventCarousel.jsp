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
	<title></title>
</head>
<body>
	
		<h3>Event</h3>
		<div id ="TH_event" class ="carousel slide" data-ride ="carousel">
			<ol class ="carousel-indicators">
				<li data-target = "#TH_event" data-slide-to = "0" class="active"></li>
				<li data-target = "#TH_event" data-slide-to = "1"></li>
				<li data-target = "#TH_event" data-slide-to = "2"></li>
			</ol>
			<div id="TH_eventCarousel" class ="carousel-inner">
				<div class="item active">
					<img src="${contextpath}/article3/img/침영어 (0).jpg">
				</div>
				<div class= "item">
					<img src="${contextpath}/article3/img/침영어 (1).jpg">
				</div>
				<div class= "item">
					<img src="${contextpath}/article3/img/침영어 (2).jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#TH_event" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#TH_event" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	
	
	
</body>
</html>