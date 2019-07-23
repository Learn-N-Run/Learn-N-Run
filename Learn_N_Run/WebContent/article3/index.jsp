<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<link rel="stylesheet" href="./css/style.css">
<script src="./js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<title></title>
</head>
<body>
	<div id = "wrap">
		<%-- header--%>
		<c:import url="/1_Include/header.jsp"></c:import>
		<%--이벤트 영역 (캐러셀 - 이미지슬라이드):이미지는 하드코딩으로 연결해주기로 함--%>
		<div id ="TH_event" class = "carousel slide" data-ride = "carousel">
			<ol class ="carousel-indicators">
				<li data-target = "#TH_event" data-slide-to = "0" class="active"></li>
				<li data-target = "#TH_event" data-slide-to = "1"></li>
				<li data-target = "#TH_event" data-slide-to = "2"></li>
			</ol>
			<div id="TH_eventCarousel" class ="carousel-inner">
				<div class="item active">
					<img src="img/침영어 (0).jpg">
				</div>
				<div class= "item">
					<img src="img/침영어 (1).jpg">
				</div>
				<div class= "item">
					<img src="img/침영어 (2).jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#TH_event" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#TH_event" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		
		<%-- top5 영역 --%>
<%-- resultset값 뿌릴 때 a태그 href도 같이 지정해주시기바랍니다. --%>
		<div id="TH_top5">
			<h3>Popularly TOP 5</h3>
			
			<span>
				<img src="./img/aaa.jpg">	
			</span>
			<span>
				<img src="./img/aaa.jpg">
			</span>
			
			
			
			
		</div>
		<%-- top5 영역  끝--%>
		
		
		<%-- 카테고리 아이콘 영역 --%>
		<div id="TH_Category">
		<h3>Category</h3>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/activity.png" width="100%" height="100px">
																  <div style="width: 100%; height: 20px;">운동</div></a>
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/calligraphy.png" width="100%" height="100px">
																  <div style="width: 100%; height: 20px;">캘리그라피</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/crafts.png" width="100%" height="100px">
																 <div style="width: 100%; height: 20px;">공예</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/design.png" width="100%" height="100px">
																 <div style="width: 100%; height: 20px;">디자인</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/music.png" width="100%" height="100px">
																 <div style="width: 100%; height: 20px;">음악</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/camera.png" width="100%" height="100px">
																  <div style="width: 100%; height: 20px;">카메라, 영상</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/art.png" width="100%" height="100px">
																  <div style="width: 100%; height: 20px;" align="center">그림</div></a>
				
			</div>
			<div id = "categ">
				<a style="text-decoration: none; width: 100%;  height: 120px;" href="#" ><img alt="" src="img/food.png" width="100%" height="100px">
																  <div style="width: 100%; height: 20px;">요리</div></a>
				
			</div>
		</div>			
			
			
			
			
			<!-- 카테고리 아이콘 영역  끝-->
			
			<!-- 푸터 영역 -->
		<c:import url="/1_Include/footer.jsp"></c:import>
	</div>
</body>
</html>