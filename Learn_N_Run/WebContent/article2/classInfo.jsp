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
<title>클래스 상세보기</title>
</head>
<body>
<jsp:include page="${contextpath}/1_Include/header.jsp"></jsp:include>
<div id = "wrap">
	
	
	<section class = "sec01_c">
		<div class= "show_c">
		
			<!-- 클래스 섬네일 -->
			<section class = "thumb_c"> 
				<img src="upload/${cdto.cover_img}" width="100%" height="100%">
			</section> 
			
			<!-- 화면 줄였을 때 생기는 좌측에 보여지는 #submit영역  -->
			<section class = "submit_cc">
			
				<div class = "nick_c"><h5>By. ${cdto.creator.nickname}, ${cdto.no}</h5></div>
				<div class = "title_c">
   							${cdto.title}</div>
				<div class = "category_sec_c">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">${cdto.category.name}</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> ${cdto.detail_category}</td>
						</tr>
					</table>
				</div>
				
				<form action="">
				<table  style="width: 100%;">
					<tr>
						<td colspan="2">
							<h2 align="left">수강료 : ${cdto.tuition }</h2>
						</td>
					</tr>
					
					<tr>
						<td width="50%;">
							<div>
								<input type = "button" value = "찜하기" onclick = "location.href='jjimRegister.me?no=${cdto.no}'">
							</div>
						</td>
						<td width="50%;">
							<div>
								<input type="submit" value = "신청하기">
							</div>
						</td>
					</tr>	
				</table>
				
				<input type="hidden" name="classno" id="classnoid" value="${cdto.no}">
				<input type="hidden" name="classimg" id="classimgid" value="${cdto.cover_img}">
				<input type="hidden" name="classtitle" id="classtitleid" value="${cdto.title}">
				<input type="hidden" name="categoryname" id="categorynameid" value="${cdto.category.name}">
				<input type="hidden" name="creatornickname" id="creatornicknameid" value="${cdto.creator.nickname}">
				<input type="hidden" name="calsstuition" id="classtuitionid" value="${cdto.tuition}">
				
				
				</form>
			</section>
			<!-- 화면 줄였을 때 생기는 좌측에 보여지는 #submit영역  끝-->
			
			<!-- 클래스 상세보기 페이지마다 보여지는 고정 이미지 -->
			<section style="width: 100%; height: 500px; background-color: #fff;  background: url('img/summer2.jpg'); background-size: 100% 100%; margin-top: 15px;"></section> 
			
			<!-- 클래스의 자세한내용을 소개 해주는 영역 (핵심)-->
			<section style="width: 100%; 
							height: 500px;">
				<input type="text" class="form-control" style = "overflow:scroll; width: 100%; height: 500px; margin : 10px;" value = "${cdto.content }" readonly="readonly"></section>
		
			<!-- 크리에이터 url 영역 -->
			<section style="width: 100%; height: 100px;">
				<div>
					<h4>크리에이터 sns 및 채널</h4>
					<input type = "button" class = "btn btn-default" value = "${cdto.creator.creator_url }">
				</div>
			</section>
			
			<!-- 클래스 준비물 정보 영역 -->
			<section style="width: 100%;">
			<h4>준비물 Pakage</h4>
			<table  style="width: 100%;">
					<tr>
						<td>●) ${cdto.material_content}</td>
					</tr>
					<tr>
						<td align="center" height="200">
							<img alt="" src="upload/${cdto.material_img}" width="30%" height="100%">
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
			<div id="submit_c">
				<div class = "nick_c"><h5>By.  ${cdto.creator.nickname}</h5></div>
				<div class = "title_c">
   							${cdto.title}</div>
				<div class = "category_sec_c">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">${cdto.category.name}</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> ${cdto.detail_category}</td>
						</tr>
					</table>
				</div>
				
				<!-- 준비물 kit 표시 -->
				<table style="margin-top: 10px;">
					<tr>
						<td>준비물 Pakage</td>
					</tr>
					<tr>
						<td>●) ${cdto.material_content}</td>
					</tr>
					<tr>
						<td>
							<img alt="" src="upload/${cdto.material_img}" width="300px" height="200px">
						</td>
					</tr>
					
				</table>
				<!-- 준비물 kit 표시  끝-->
				<form action="">
				<div>
					<input type = "button" value = "찜하기" onclick = "location.href='jjimRegister.me?no=${cdto.no}'">
				</div>
				
				<div>
					<input type="submit" value = "수강료 : ${cdto.tuition}, 신청하기">
				</div>
				
				

				</form>
			</div>		
		</div>
		<!-- 페이지 우측 표시 컨텐츠 끝-->
	</section>
	
	<%
		session.setAttribute("userid", "normal");
	%>
	
</div>
<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>

</body>
</html>