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
<!--JQUERY(1EA), swiper(2EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--외부참조 + CDN END -->
<style type="text/css">
	#inter-button-next{
		right: 10px;
		left: auto;
		}
	#inter-button-prev{
		left: 10px;
		right: auto;
		}
</style>
	<title>Learn & Run</title>
</head>
<body>

	<h3>
		<font color="tomato">Interested class</font>
	</h3>

	<div class="swiper-container">
		<div class="swiper-wrapper">
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>
			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>

<c:forEach items="${listMap.interList}" var="inter">

			<div class="swiper-slide onclickContent" onclick="alert('classNo=${inter.classNo}')">
				<div class="col-xs-4">
					<div class="thumbnail">
						<img src=" "
							 alt=" ">
						<div class="caption">
						<h6>${inter.title}</h6>
						<p>${inter.interestedCount}</p>
						</div>
					</div>
				</div>
			</div>
			
</c:forEach>

		</div>
		<div class="swiper-scrollbar"></div>
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
		scrollbar: {
		  el: '.swiper-scrollbar',
		  hide: true,
			},
		navigation: {
		  nextEl: '#inter-button-next',
		  prevEl: '#inter-button-prev',
			},
		});
	</script>

</body>
</html>