<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 상세보기</title>
<link rel = "stylesheet" href = "css/bootstrap.css">
<link rel = "stylesheet" href = "css/classInfo.css">
</head>
<body>
<div id = "wrap">
	<jsp:include page="header.jsp"></jsp:include>
	
	<section>
		<div class= "show">
		
			<!-- 클래스 섬네일 -->
			<section class = "thumb"> 
				<img src="img/ccc.jpg" width="100%" height="100%">
			</section> 
			
			<!-- 화면 줄였을 때 생기는 좌측에 보여지는 #submit영역  -->
			<section class = "submit_a">
			
				<div class = "nick"><h5>By. 닉넴</h5></div>
				<div class = "title">
   							titletitletitletitletitletitletitletitletitletitletitletit
   							letitletitletitletitletitletitletitletitletitletitletitletitle
   							titletitletitletitletitletitletitletitletitletitletitletitletit
   							letitletitletitletitletitletitletitletitletitletitletitletitletit
   							letitletitletitletitletitletitletitletitletitletitletitletitletitle
   							titletitletitletitletitletitletitletitletitletitletitletitletitletitl
   							etitletitletitletitletitletitletitletitletitletitletitletitletitletitl
   							etitletitletitletitletitletitletitletitletitletitletitletitletitletitleti
   							tletitletitletitletitletitletitle</div>
				<div class = "category_sec">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">카테고리</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> #점심메뉴 #무슨요리</td>
						</tr>
					</table>
				</div>
				
				<table  style="width: 100%;">
					<tr>
						<td colspan="2">
							<h2 align="left">수강료 : ?????</h2>
						</td>
					</tr>
					
					<tr>
						<td width="50%;">
							<div class="btn-group" data-toggle="buttons" style="width: 100%;" >
 								<label class="btn btn-default bnt"  style="width: 100%;">
    								<input type="checkbox" autocomplete="off"><h4>찜하기</h4>
    							</label>
							</div>
						</td>
						<td width="50%;">
							<div>
								<a href = "#"><button class = "bbb btn btn-default" style="width: 100%;"><h4>신청하기</h4></button></a>
							</div>
						</td>
					</tr>	
				</table>
			</section>
			<!-- 화면 줄였을 때 생기는 좌측에 보여지는 #submit영역  끝-->
			
			<!-- 클래스 상세보기 페이지마다 보여지는 고정 이미지 -->
			<section style="width: 100%; height: 500px; background-color: #fff;  background: url('img/class_class.PNG'); background-size: 100% 100%; "></section> 
			
			<!-- 클래스의 자세한내용을 소개 해주는 영역 (핵심)-->
			<section style="width: 100%; 
							height: 500px;">
				<input type="text" class="form-control" style = "overflow:scroll; width: 100%; height: 500px; margin : 10px;" value = "상세내용" readonly="readonly"></section>
		
			<!-- 크리에이터 url 영역 -->
			<section style="width: 100%; height: 100px;">
				<div>
					<h4>크리에이터 sns 및 채널</h4>
					<input type = "button" class = "btn btn-default" value = "Creator URL">
				</div>
			</section>
			
			<!-- 클래스 준비물 정보 영역 -->
			<section style="width: 100%;">
			<h4>준비물 Pakage</h4>
			<table  style="width: 100%;">
					<tr>
						<td>●) Pakage Name</td>
					</tr>
					<tr>
						<td align="center" height="300">
							<img alt="" src="img/junbi.png" width="30%" height="100%">
						</td>
					</tr>
			</table>
			</section>
			
			<!-- 클래스 상세보기 댓글 추가해야 함-->
			
			<!-- 비슷한 카테고리 영역 부분 -->
			<section style="width: 100%; height: 250px; border: 10px dotted;"><h1>동일한 카테고리 영상 표시영역</h1></section> 
			
		</div>
		
		<!-- 페이지 우측 표시 컨텐츠 -->
		<div>
			<div id="submit">
				<div class = "nick"><h5>By. 닉넴</h5></div>
				<div class = "title">
   							titletitletitletitletitletitletitletitletitletitletit
   							letitletitletitletitletitletitletitletitletitletitletitletitlet
   							itletitletitletitletitletitletitletitletitletitletitletitletitle
							titletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitl
							etitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitl
							etitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitletitle</div>
				<div class = "category_sec">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">카테고리</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> #점심메뉴 #무슨요리</td>
						</tr>
					</table>
				</div>
				
				<!-- 준비물 kit 표시 -->
				<table style="margin-top: 10px;">
					<tr>
						<td>준비물 Pakage</td>
					</tr>
					<tr>
						<td>●) Pakage NAME</td>
					</tr>
					<tr>
						<td>
							<img alt="" src="img/junbi.png" width="100%" height="100%">
						</td>
					</tr>
					
				</table>
				<!-- 준비물 kit 표시  끝-->
			
				<div class="btn-group" data-toggle="buttons" >
 					<label class="btn btn-default bnt" >
    					<input type="checkbox" autocomplete="off">찜하기
    				</label>
				</div>
				
				<div>
					<a href = "#"><button class = "bbb btn btn-default" style="width: 100%;"><h3>수강료 : ??????<br><br>신청하기</h3></button></a>
				</div>
			</div>		
		</div>
		<!-- 페이지 우측 표시 컨텐츠 끝-->
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</div>

</body>
</html>