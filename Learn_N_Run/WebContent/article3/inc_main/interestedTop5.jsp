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
	.swiper-container {
		width: 100%;
		height: 100%;
		min-height: 300px;
		}
	.swiper-slide {
		text-align: center;
		font-size: 18px;
		background: rgba(255,255,255,0);
		/* Center slide text vertically */
		display: -webkit-box;
		display: -ms-flexbox;
		display: -webkit-flex;
		display: flex;
		-webkit-box-pack: center;
		-ms-flex-pack: center;
		-webkit-justify-content: center;
		justify-content: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		-webkit-align-items: center;
		align-items: center;
		}
	.inter-button{
		position: absolute;
		top: 50%;
		width: 27px;
		height: 44px;
		margin-top: -22px;
		z-index: 10;
		cursor: pointer;
		background-size: 27px 44px;
		background-position: center;
		background-repeat: no-repeat;
		}
	#inter-button-next{
		right: 10px;
		left: auto;
		}
	#inter-button-prev{
		left: 10px;
		right: auto;
		}
</style>
</head>
<body>

	<h3>
		<font color="tomato">Interested class</font>
	</h3>

	<div class="swiper-container">
		<div class="swiper-wrapper">

<c:forEach items="${listMap.interList}" var="inter">
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				${inter.title}<BR>
				${inter.interestedCount}
			</div>
</c:forEach>

		</div>
		<div class="swiper-pagination"></div>
		<div id="inter-button-next" class="inter-button">
			<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" fill="tomato">
				<path d="M4 .755l14.374 11.245-14.374 11.219.619.781 15.381-12-15.391-12-.609.755z"/>
			</svg>
		</div>
		<div id="inter-button-prev" class="inter-button">
			<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" fill="tomato">
				<path d="M20 .755l-14.374 11.245 14.374 11.219-.619.781-15.381-12 15.391-12 .609.755z"/>
			</svg>
		</div>
	</div>


	<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 3,
		spaceBetween: 30,
		slidesPerGroup: 3,
		loop: true,
		loopFillGroupWithBlank: true,
		pagination: {
		  el: '.swiper-pagination',
		  clickable: true,
			},
		navigation: {
		  nextEl: '#inter-button-next',
		  prevEl: '#inter-button-prev',
			},
		});
	</script>
			
</body>
</html>