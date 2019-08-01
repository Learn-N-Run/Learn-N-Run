<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name ="viewport" content="width-device-width", initial-scale = "1">
<title>메인 페이지</title>
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/codingBooster.css">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Sunflower:300&display=swap" rel="stylesheet">

<style type="text/css">
	.jumbotron{
	background-image: url("img/back.png");
	background-size : cover;
	text-shadow: black 0.2em 0.2em 0.2em; 
	color: white;
	}
	
	*{
	font-family: 'Sunflower', sans-serif;
	}
	
	nav div a{
	font-size: 25px;
	margin-top: 15px;
	}
	abc{
		background-color: #ffffff;
	}
	
	
	.footitem:HOVER{
		color: #bbbbbb;
	}
	
	
	
</style>
</head>
<body>

	<!-- 만약 사용자가 로그인 했다면 userID는 로그인한 ID를 저장하고 있다. -->
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	%> 
	
	<!-- 상단 nav바  -->
	<nav style="height: 90px;">
		<div class = "cantainer-fluid">
		
			<div class = "navbar-header">
				<!-- 화면이 줄어들었을때 메뉴를 압축해서 보여주는 아이콘 생성 -->
				<button type = "button" class = "navbar-toggle collapsed" data-toggle = "collapse"
						data-target = "#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>  
				</button>
						<!-- nav바 상단 좌측에 웹페이지 로고 생성 -->
						<a class= "navbar-brand" href="index.jsp" style="font-family: 'Black Han Sans', sans-serif; font-size: 30px;">WILL DINNING</a>
						
			</div>
			
			<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
				<ul class = "nav navbar-nav">
				
					<li class = "active"><a href = "index.jsp">HOME<span class = "sr-only"></span></a></li>
					
					<li><a href="introduce.jsp">INRODUCE</a></li>
					<li><a href="menu.jsp">MENU</a></li>
					<li><a href="inform.jsp">창업 안내</a></li>
					<li><a href="review.jsp">REVIEW</a></li>
					
					
				</ul>
				
				
				<!-- 접속 메뉴 -->
				<%
					if(userID == null){
					%>
					
					<ul class = "nav navbar-nav navbar-right">
					<li class = "dropdown">
						<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown" role = "button"
						 aria-haspopup="true" aria-expend="false" style="font-size: 20px;"><span class = "glyphicon glyphicon-check"></span><span class = "caret"></span></a>
						  <ul class = "dropdown-menu">
						 	<li><a href="login.jsp" style="font-size: 20px;">로그인</a></li>
						 	<li><a href="join.jsp" style="font-size: 20px;">회원가입</a></li>
						 </ul>
					</li>
				</ul>
					<%	
					}
					else{
						%>
						<ul class = "nav navbar-nav navbar-right">
						<li class = "dropdown">
						<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown" role = "button"
						 aria-haspopup="true" aria-expend="false" style="font-size: 20px;"><span class = "glyphicon glyphicon-ok"></span><span class = "caret"></span></a>
						  <ul class = "dropdown-menu">
						 	<li><a href="modify.jsp" style="font-size: 20px;">정보수정</a></li>
						 	
						 	<li><a href="logoutAction.jsp" style="font-size: 20px;">로그아웃</a></li>
						 </ul>
					</li>
				</ul>
						<%
					}
				%>
				
				<!-- 접속하기 메뉴 끝 -->
				
			</div>
		</div>
	</nav> <!-- 상단 nav바 끝 -->
	
	<!--가운데 영역 (content) -->
	<!-- container 회색 배경 -->
	
		<!-- <div class = "jumbotron">
		text center 글자 가운데
				<h1 class = "text-center" >웹 페이지 소개</h1>
				<p class = "text-center">위 웹페이지 소개를 위한 사이트입니다. 다양한 컨텐츠를 이용하여 페이지를 꾸미겠습니다.</p>
				<p class = "text-center"><a class = "btn btn-primary btn-lg" href = "#" role = "button">컨텐츠보기</a></p>
		</div> -->
		
		<!-- 이미지 슬라이더 -->
		<div class = "container">
		<div class = "container wide">
		<div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
			<ol class = "carousel-indicators">
				<li data-target = "#myCarousel" data-slide-to = "0" class="active"></li>
				<li data-target = "#myCarousel" data-slide-to = "1"></li>
				<li data-target = "#myCarousel" data-slide-to = "2"></li>
			</ol>
			<div class = "carousel-inner">
				<div class= "item active">
					<img style = "width: 2000px; height: 500px;" src="img/aaa.jpg">
				</div>
				<div class= "item">
					<img style = "width: 2000px; height: 500px;" src="img/bbb.jpg">
				</div>
				<div class= "item">
					<img style = "width: 2000px; height: 500px;" src="img/ccc.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
		<!-- 이미지 슬라이더 끝 -->
		
		<hr>
		<!-- modal불러내는 영역 -->
		<div class = "row">
			<div class = "col-md-6">
				<h4>이달의 신메뉴!</h4>
				<p>WILL DINNING만의 레시피로 만든 <br>
				    새로운 메뉴를 알아보세요!</p>
				<BR>
				<p><a class = "btn btn-default" data-target = "#modal" data-toggle="modal">자세히 알아보기</a></p>
			</div>
			<div class = "col-md-6">
				
				<h4><b>영업 시간</b></h4>
				
				<p>● 월 ~ 목 : AM10:00 ~ PM08:00</p>
				<p>○ 금 ~ 일 : AM12:00 ~ PM05:00</p>
				<p>★  휴무일 : 매주 2째 주, 4째주 일요일, 공휴일</p>
				<p>☆ BREAK TIME(월~목) : PM03:00~PM04:30 </p>
			</div>
		</div>
		<!-- modal불러내는 영역 끝 -->
		<hr>
		
		<!-- 최신 소식 알림판 -->
		<div class = "panel panel-primary" style="border-color: #000000; ">
			<div class = "panel-heading" style="background-color: #000000;">
				<h3 class = "panel-title"><span class = "glyphicon glyphicon-pencil"></span>
				&nbsp;&nbsp; 최신 소식~!</h3>
			</div>
			<table class= "table">
						<thead>
							<tr>
								<th>게시자 명</th>
								
								<th>소식 내용</th>
								<th>등록 날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>박수수</td>
							
								<td><a data-target = "#modal" data-toggle="modal">6월 이 달의 신메뉴가 출시 되었습니다!</a></td>
								
								<td>2019/06/01</td>
							</tr>
							<tr>
								<td>박수수</td>
								<td><a>WILL DINNING 부산 2호점 오픈!!!</a></td>
								<td>2018/12/31</td>
							</tr>
							<tr>
								<td>박수수</td>
								<td>WILL DINNING의 새로운 직원을 구합니다. 자세한 내용은 페이지의 인재채용을 참고해주세요~</td>
								<td>2018/05/21</td>
							</tr>
						</tbody>
					</table>
		</div><!-- 최신 소식 알림판 끝 -->
		
		
	</div><!-- content영역 끝 -->
	</div>
	
	
	
	<!-- 푸터 영역 -->
	<footer style="background-color: #000000; color: #ffffff">
		<div class = "container">
			<br>
			 <!-- class = "col-sm-n(자연수)(공간 할당)" -->	
			<div class = "row">
				<div class = "col-sm-2"  style = "text-align: center;"><h5>Copyright &copy; 2019</h5><h5>서 창 현(S. C. H)</h5></div>
				<div class = "col-sm-4"><h4>대표자 소개</h4>
				<p><span style="font-family: 'Black Han Sans', sans-serif;">WILL DINNING</span><BR> 
				     사업자 등록번호 214-98754-9874 </p>
				<p>● 부산 본점<br>
				     부산시 부산진구 동전로 역삼동 역삼빌딩 2층 21호</p>
				<p>대표전화 : 051-1234-5678<br>
				      팩스번호 : 051-1234-5678</p>
				</div>
				<div class = "col-sm-2"><h4 style="text-align: center;">가이드 메뉴</h4>
					<div class = "list-group">
						<a href = "introduce.jsp" class = "list-group-item">INTRODUCE</a>
						<a href = "menu.jsp" class = "list-group-item">MENU</a>
						<a href = "review.jsp" class = "list-group-item">REVIEW</a>
					</div>
				</div>
				<div class = "col-sm-2"><h4 style="text-align: center;">SNS</h4>
					<div class = "list-group">
						<a href = "https://www.facebook.com/" class = "list-group-item">페이스북</a>
						<a href = "https://www.youtube.com/" class = "list-group-item">YOUTUBE</a>
						<a href = "https://www.instagram.com/?hl=ko" class = "list-group-item">Instagram</a>
					</div>
				</div>
				<div class = "col-sm-2 footitem"><h4>
					<span class= "glyphicon glyphicon-ok"></span><b><a href = "#" style="color: #ffffff; text-decoration: none;">&nbsp; 개인정보취급방침</a></b></h4>
				</div>
				<div class = "col-sm-2 footitem"><h4>
					<span class= "glyphicon glyphicon-ok"></span><b><a href = "#" style="color: #ffffff; text-decoration: none;">&nbsp; 이용약관</a></b></h4>
				</div>
				<div class = "col-sm-2 footitem"><h4>
					<span class= "glyphicon glyphicon-ok"></span><b><a href = "#" style="color: #ffffff; text-decoration: none;">&nbsp; 인재채용</a></b></h4>
				</div>
			</div>
		</div>
	</footer> <!-- 푸터 영역 끝 -->
	
	<!-- modal (버튼을 눌렀을 때 생기는 일종의 팝업 창) 구성 -->
	<div  class = "row">
		<div  class = "modal" id = "modal" tabindex="-1">
			<div class = "modal-dialog">
				<div class = "modal-content" style="width: 800px; height: 500px">
					<div class = "modal-header">
					이 달의 신메뉴
					<button class = "close" data-dismiss="modal">&times;</button>
					</div>
					<div class = "modal-body" style = "text-align: center; font-size: 20px;">
						* 햄 치즈 또띠아!<br>
						####################################################<br>
						####################################################<br><br>
						<img src = "img/ddoddo.jpg" id = "imagepreview" style="width :500px; height:300px;">
					</div>
				</div>
			</div>
		</div>
	</div> <!-- modal 구성 끝 -->
	
	<!-- 외부에서 스트립트 문장 가져오기 jquery 소스 가져오기 외부에서-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	
	<!-- js폴더안에 bootstrap.js파일 가져오기 -->
	<script src="js/bootstrap.js"></script>
	
</body>
</html>