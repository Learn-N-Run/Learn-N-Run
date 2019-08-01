<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<link rel = "stylesheet" href = "css/jjim.css">
<style type="text/css">
	#wrap{
	 width: 1280px;
	 margin: 0 auto;
	}
	
	#table_c tr:nth-of-type(1)
	{ 
		background-color: pink;
		color : #ffffff;
	}
	#table_c tr>th{
		width: 300px;
	}
	#table_c{
	 border-spacing: 5px;  
	 border-collapse: separate;
	 margin : 15px; 
	}
	
	#iag_c>a>div>img{
		 transition: all 0.3s ease-in 0s;
	}
	#iag_c>a>div{
		width: 300px;
		height: 200px;
		overflow: hidden;
	}
	#iag_c>a>div:hover>img{
		transform: scale(1.1) translateZ(0px);
	}

</style>
</head>
<body>
	<div id = "wrap">
	
		<jsp:include page="header.jsp"></jsp:include>
		
		<table id = "table_c" >
			<tr>
				<th style="background-color: #fff"></th>
				<th>클래스명</th>
				<th>카테고리 및 크리에이터</th>
				<th>수강료</th>
			</tr>
			<tr>
				<td id = "iag_c">
					<a href = "#"><div><img src="img/ccc.jpg" width="100%" height="100%"></div></a>
				</td>
				<td>titlecategory ◆ creatorcategory ◆ creator</td>
				<td>켈리그라피 ◆ nickname</td>
				<td>￦???,???</td>
			</tr>
			<tr>
				<td id = "iag_c">
					<a href = "#"><div><img src="img/ceplogo.jpg" width="100%" height="100%"></div></a>
				</td>
				<td>title</td>
				<td>category ◆ creator</td>
				<td>￦???,???</td>
			</tr>
		</table>
		
		<jsp:include page="footer.jsp"></jsp:include>
	
	</div>
</body>
</html>