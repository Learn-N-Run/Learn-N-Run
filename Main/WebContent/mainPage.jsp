<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/mainPage.css"> <!--  -->

<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet"> <!-- 폰트 썻는데 맘에 안들면 바꾸셔도 되고 안해도 되고요 -->

<title>메인페이지</title>

</head>
<body>
	<div id = "wrap"> <!-- 전체 페이지 감싸는 div 태그 -->
		
		<!-- header 부분 -->
		<jsp:include page="header.jsp"></jsp:include>
	
	
		<!--이미지 슬라이드(캐러셀) 섹션 영역 -->
		<section class = "sec01">
	
		<div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
			<ol class = "carousel-indicators">
				<li data-target = "#myCarousel" data-slide-to = "0" class="active"></li>
				<li data-target = "#myCarousel" data-slide-to = "1"></li>
				<li data-target = "#myCarousel" data-slide-to = "2"></li>
			</ol>
			<div class = "carousel-inner">
				<div class= "item active">
					<img style = "width: 100%; height: 350px;" src="img/aaa.jpg">
				</div>
				<div class= "item">
					<img style = "width: 100%; height: 350px;" src="img/bbb.jpg">
				</div>
				<div class= "item">
					<img style = "width: 100%; height: 350px;" src="img/ccc.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		</section>
		<!--이미지 슬라이드 섹션 영역 끝 -->
		
		<br><br>
		
		<!-- top5 영역 -->
		<section class = "sec2">
		<h3 style="font-family: 'Gugi', cursive;">잉끼 TOP5</h3>
		</section>
		<section class = "sec02">
			<div  id = "one">
			<a href = "#" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="img/ccc.jpg" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>카테고리 * 닉넴</h6></div>
				<div id = "one_div">TITLE12345678912345678912345678912345678912345678997979879846151116</div>
			</a>
			</div>
			<div  id = "one">
			<a href = "#" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="img/ccc.jpg" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>카테고리 * 닉넴</h6></div>
				<div id = "one_div">TITLE12345678912345678912345678912345678912345678997979879846151116</div>
			</a>
			</div>
			<div  id = "one">
			<a href = "#" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="img/ccc.jpg" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>카테고리 * 닉넴</h6></div>
				<div id = "one_div">TITLE12345678912345678912345678912345678912345678997979879846151116</div>
			</a>
			</div>
			<div  id = "one">
			<a href = "#" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="img/ccc.jpg" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>카테고리 * 닉넴</h6></div>
				<div id = "one_div">TITLE12345678912345678912345678912345678912345678997979879846151116</div>
			</a>
			</div>
			<div  id = "one">
			<a href = "#" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="img/ccc.jpg" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>카테고리 * 닉넴</h6></div>
				<div id = "one_div">TITLE12345678912345678912345678912345678912345678997979879846151116</div>
			</a>
			</div>
		</section>
		<!-- top5 영역  끝-->
		
		<br><br><br>
		
		<!-- 카테고리 아이콘 영역 -->
		<section class = "sec3">
		<h3 style="font-family: 'Gugi', cursive;" >클래스별 카테고리</h3>
		</section>
		<section class = "sec03"> 
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
		</section>
			<!-- 카테고리 아이콘 영역  끝-->
			
			<!-- 푸터 영역 -->
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
</body>
</html>