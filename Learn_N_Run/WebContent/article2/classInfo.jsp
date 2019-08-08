<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--페이지인코딩 --%>
<%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<link rel="stylesheet" href="./css/style.css">
<script src="./js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel = "stylesheet" href = "${contextpath}/article2/css/classInfo.css">
<link rel = "stylesheet" href = "css/bootstrap.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->

<title>클래스 상세보기</title>
</head>
<body style="overflow-x: hidden;">
<jsp:include page="/1_Include/header.jsp" />

<div id = "wrap">
	
	
	<section class = "sec01_c">
	
		<div class= "show_c">
		
			<!-- 클래스 섬네일 -->
			<section class = "thumb_c"> 
				<img src="${contextpath}${cudto.classinfo.cover_img}" width="100%" height="100%">
			</section>
			<hr>
			
			
			
			<!-- 화면 줄였을 때 중앙에 보여지는 #submit영역  -->
			<section class = "submit_cc">
			
				<div class = "nick_c">By. ${cudto.classinfo.creator.nickname}</div>
				<hr>
				<div class = "title_c">
   							${cudto.classinfo.title}</div>
   							
   				<hr>
   				
				<div class = "category_sec_c">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">${cudto.classinfo.category.name}</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> ${cudto.classinfo.detail_category}</td>
						</tr>
					</table>
				</div>
				
				<hr>
				
				<table  style="width: 100%;">
				
				<c:if test="${bcheck == -1 }">
					<tr>
						<td colspan="2">
							<fmt:formatNumber var="tuition" value = "${cudto.classinfo.tuition}" pattern="###,###"/>
							<h2 align="left">
								수강료 : ￦ ${tuition}
							</h2>
						</td>
					</tr>
					</c:if>
					
					<tr>
					<c:if test="${bcheck == -1}">
						<td width="50%;">
							<div>
								<button class = "jjimnsubmit_c" onclick = "location.href='/Learn_N_Run/article2/jjimRegister.me?no=${cudto.classinfo.no}'" >찜하기</button>
							</div>
						</td>
						<td width="50%;">
							<button class = "jjimnsubmit_c" onclick = "location.href = '/Learn_N_Run/article1/buyClassInfo.do?classno=${cudto.classinfo.no}'">신청하기</button>
						</td>
					</c:if>
					<c:if test="${bcheck == 1}">
						<td width="50%;">
							<div>
								<button class = "jjimnsubmit_c" onclick = "location.href = '/Learn_N_Run/article2/jjimRegister.me?no=${cudto.classinfo.no}'" >찜하기</button>
							</div>
						</td>
						<td width="50%;">
							<button class = "jjimnsubmit_c" onclick = "location.href = '/Learn_N_Run/article3/getcurrivideo.kr?no=${cudto.classinfo.no}'">강의 듣기</button>
						</td>
					</c:if>
					</tr>	
				</table>
				
				<input type="hidden" name="classno" id="classnoid" value="${cudto.classinfo.no}">
				<input type="hidden" name="classimg" id="classimgid" value="${cudto.classinfo.cover_img}">
				<input type="hidden" name="classtitle" id="classtitleid" value="${cudto.classinfo.title}">
				<input type="hidden" name="categoryname" id="categorynameid" value="${cudto.classinfo.category.name}">
				<input type="hidden" name="creatornickname" id="creatornicknameid" value="${cudto.classinfo.creator.nickname}">
				<input type="hidden" name="calsstuition" id="classtuitionid" value="${cudto.classinfo.tuition}">
				
			</section>
			<!-- 화면 줄였을 때 중앙에 보여지는 #submit영역  끝-->
			
			<!-- 클래스 상세보기 페이지마다 보여지는 고정 이미지 -->
			<section style="margin-bottom : 15px; width: 100%; height: 350px; background-color: #fff;  background: url('img/class_class.PNG'); background-size: 100% 100%; margin-top: 15px;"></section> 
			<hr>
			<!-- 클래스 소개글 ~ -->
			<section class = "intro_c">
				<h3 style="font-size: 24px; font-weight: bold; color: tomato;">
				클래스 소개글</h3><br>
				<font class = "font_c" >&nbsp; ${cudto.classinfo.content} </font>
			</section>
			<hr>
			<!-- 커리큘럼 소개 영역 -->
<jsp:include page="/article3/inc_classInfo/curriculumList.jsp"/>
			
			<hr>
			
			<!-- 크리에이터 url 영역 -->
			<section style="width: 100%; height: 100px;">
				<div>
					<h3 style="font-size: 24px; font-weight: bold; color: tomato;">
					크리에이터 sns 및 채널</h3>
					<button onclick="location.href = '${cudto.classinfo.creator.creator_url}'" class = "btn btn-default">크리에이터 URL 및 CHANNEL</button>
				</div>
			</section>
			
			<hr>
			
			<!-- 클래스 준비물 정보 영역 -->
			
			<section style="width: 100%;">
			<h3 style="font-size: 24px; font-weight: bold; color: tomato;">
			준비물 Pakage</h3>
			
			<table  style="width: 100%;">
					
					<tr>
						<td height="200">
							<img alt="" src="${contextpath}${cudto.classinfo.material_img}" width="30%" height="85%">
						</td>
					</tr>
					
					<tr>
						<td style = "font-size: 25px;"> ${cudto.classinfo.material_content}</td>
					</tr>
			</table>
			</section>
			
			<hr>
			
			
			
			<!-- 비슷한 카테고리 영역 부분 -->
			<section style="margin-top: 50px;">
				<h3 style="font-size: 24px; font-weight: bold; color: tomato;">
				동일한 카테고리 클래스
				</h3>
			</section>
			
			<section class = "sec02_c">
			
			<c:forEach var = "catev" items="${requestScope.catev}">
			<div  id = "one_c">
			<a href = "/Learn_N_Run/article2/classInfo.me?no=${catev.classinfo.no}" style="text-decoration: none;">
				<div style="width: 100%; height: 150px; overflow : hidden;"><img alt="" src="${contextpath}${catev.classinfo.cover_img}" width="100%" height="100%"></div>
				<div style="width: 100%; height: 20px;"><h6>${catev.classinfo.category.name } * ${catev.classinfo.creator.nickname}</h6></div>
				<div id = "one_div_c">${catev.classinfo.title }</div>
			</a>
			</div>
			</c:forEach>
			
			</section> 
			<hr>
			
			<section>
<jsp:include page="/article3/inc_classInfo/community.jsp"/>
			</section>
			<hr>
			
			
			
		</div>
		
		
		
		<!-- 페이지 우측 표시 컨텐츠 -->
		<div>
			<div id="submit_c">
				<div class = "nick_c"><h5>By.  ${cudto.classinfo.creator.nickname}</h5></div>
				<div class = "title_c">
   							${cudto.classinfo.title}</div>
				<div class = "category_sec_c">
					<table style="border-spacing: 5px;  border-collapse: separate;">
						<tr>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 100px;">${cudto.classinfo.category.name}</td>
							<td style="background-color: #000; color: #fff; text-align: center;  margin : 4px 5px;  border-radius: 5%;  width: 200px;"> ${cudto.classinfo.detail_category}</td>
						</tr>
					</table>
				</div>
				
				<!-- 준비물 kit 표시 -->
				
				<table style="margin-top: 10px;">
					<tr>
						<td>준비물 Pakage</td>
					</tr>
					<tr>
						<td>
							<img src="${contextpath}${cudto.classinfo.material_img}" width="260px" height="auto">
						</td>
					</tr>
					<tr>
						<td>${cudto.classinfo.material_content}</td>
					</tr>
				</table>
				
				<!-- 준비물 kit 표시  끝-->
				<c:if test="${bcheck == -1}">
				<div>
					<button class = "jjimnsubmit_c" onclick = "location.href='/Learn_N_Run/article2/jjimRegister.me?no=${cudto.classinfo.no}'">찜하기</button>
				</div>
				<div>
					<button class = "jjimnsubmit_c" onclick = "location.href ='/Learn_N_Run/article1/buyClassInfo.do?classno=${cudto.classinfo.no}'" > 수강료 : ￦ ${tuition} <br> 신청하기</button>
				</div>
				</c:if>
				<c:if test="${bcheck == 1}">
				<div>
					<button class = "jjimnsubmit_c" onclick = "location.href='/Learn_N_Run/article2/jjimRegister.me?no=${cudto.classinfo.no}'">찜하기</button>
				</div>
				<div>
					<button class = "jjimnsubmit_c" onclick = "">강의 듣기</button>
				</c:if>
				
				
			</div>		
		</div>
		<!-- 페이지 우측 표시 컨텐츠 끝-->
	</section>
	
	
</div>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>

</body>
</html>