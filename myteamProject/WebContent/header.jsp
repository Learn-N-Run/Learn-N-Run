<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/bootstrap.css">

<script type="text/javascript">
function show() {
	$(".list").slideToggle("normal");
	
}


</script>

<style type="text/css">

	header{
	padding : 10px;

	height: 120px;
	}

	header>div{
	float : left;
	}
	
	form>div{
	float : left;
	margin-left: 5px;
	margin-top: 30px;
	}
	
	header>section>span{
		float : right;
		margin-right: 10px;
		margin-top: 30px;
	}
	
	

	.logo{
		margin-top : 10px;
		width: 18%;
		height : 100px;
		background:  url("img/large.png");
		background-repeat: no-repeat;
		background-size: 100% 50%;
	}
	
	
	
	.list{
	display: none;
	}
	
	.search{
	width: 400px;
	}
	
	.view>img{
		margin-top: 25px; 
		margin-left: 8px;
		width: 50px; 
		height: 42px;
		display: none;
		
	}
	
	
	
	 @media (max-width: 1280px) {
	#wrap{
		width: 100%;
	}
	
	
	
}

	 @media (max-width: 968px) {
	#wrap{
		width: 100%;
	}
	
	.search{
		width:380px;
	}
	
	header>section{
		float : left;
	}
	
	.logo{
		margin-top : 10px;
		
		background:  url("img/small.png");
		background-repeat: no-repeat;
		background-size: 100% 50%;
	}
	
	
}

	 @media (max-width: 724px) {
	#wrap{
		width: 100%;
	}
	.search{
		width:280px;
	}
	header>section{
		display: none;
	}
	.view>img{
		display: block;
	}
	
}
	
</style>

</head>
<body>
<div id = "wrap">
	<header>
		<div class ="logo">
	
	
		</div>
			
			<div class = "search">
				<form>
					<div style="width: 80%;">
						<input type = "text" class = "form-control" placeholder ="카테고리 + 제목">
					</div>
					<div style="width: 10%;">
						<input type = "submit" class = "btn btn-default" value = "검색">
					</div>
				</form>
			</div>
			
			<div class = "view" style="float: right;" >
				<img alt="" src="img/list.png" onclick="show()">
			</div>
			
			
			
		<section>
			<span class = "btn btn-default">
				<a>JOIN</a>		
			</span>
			<span class = "btn btn-default">
				<a>LOGIN</a>
			</span>	
		</section>
		
	</header>
	
	<div class = "list">
		
		<span style="width: 100%;" class = "form-control"><a href = "#" style="text-decoration: none;">LOGIN</a></span>
		<span style="width: 100%;" class = "form-control"><a href = "#" style="text-decoration: none;">JOIN</a></span>
		
	</div>
	
</div>
	
	<!-- 외부에서 스트립트 문장 가져오기 jquery 소스 가져오기 외부에서-->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- js폴더안에 bootstrap.js파일 가져오기 -->
	<script src="js/bootstrap.js"></script>	
	
</body>
</html>