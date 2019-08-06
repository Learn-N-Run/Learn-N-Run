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
	#TH_inter-button-next{
		right: 10px;
		left: auto;
		}
	#TH_inter-button-prev{
		left: 10px;
		right: auto;
		}
</style>
	<title>Learn & Run</title>
</head>
<body class="TH_widthOverHidden">

	<h3>
		<font color="tomato">Interested class</font>
	</h3>

	<div id="TH_inter-swiper-container" class="swiper-container">
		<div class="swiper-wrapper">

<c:forEach items="${listMap.interList}" var="inter">

			<div class="swiper-slide TH_onclickContent" onclick="location.href='article2/classInfo.me?no=${inter.classNo}'">
				<div class="thumbnail">
					<img src=" "
						 alt=" ">
					<div class="caption">
					<h6>${inter.title}</h6>
					<p>${inter.interestedCount}</p>
					</div>
				</div>
			</div>
			
</c:forEach>

		</div>
		<div class="swiper-pagination"></div>
		<a id="TH_inter-button-prev" class="left carousel-control" href="#TH_event" data-slide="prev" style="color: tomato !important; background-image: none !important;">
			<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
		<a id="TH_inter-button-next"  class="right carousel-control" href="#TH_event" data-slide="next" style="color: tomato !important; background-image: none !important;">
			<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	
<script>
    var swiper = new Swiper('#TH_inter-swiper-container', {
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
			nextEl: '#TH_inter-button-next',
			prevEl: '#TH_inter-button-prev',
			},
		});
</script>

</body>
</html>