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
<!--JQUERY(1EA), swiper(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<!--외부참조 + CDN END -->

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
	.pop-button{
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
	#pop-button-next{
		right: 10px;
		left: auto;
		}
	#pop-button-prev{
		left: 10px;
		right: auto;
		}
	.swiper-slide{
		border: 1px solid;
	}
</style>
	<title>Learn & Run</title>
</head>
<body>
	<h3>
		<font color="tomato">Popular class</font>
	</h3>

	<div class="swiper-container">
		<div class="swiper-wrapper">

<c:forEach items="${listMap.popList}" var="pop">
			<div class="swiper-slide" onclick="alert('classNo=${pop.classNo}')">
				${pop.title}<BR>
				${pop.topRankCount}
			</div>
</c:forEach>

		</div>
		<div class="swiper-pagination"></div>
		<div id="pop-button-next" class="pop-button">
			<svg width="24" height="24" xmlns="http://www.w3.org/2000/svg" fill-rule="evenodd" clip-rule="evenodd" fill="tomato">
				<path d="M4 .755l14.374 11.245-14.374 11.219.619.781 15.381-12-15.391-12-.609.755z"/>
			</svg>
		</div>
		<div id="pop-button-prev" class="pop-button">
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
		  nextEl: '#pop-button-next',
		  prevEl: '#pop-button-prev',
			},
		});
	</script>
	
</body>
</html>