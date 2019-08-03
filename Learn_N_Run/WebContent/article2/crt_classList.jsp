<%@page import="java.util.*"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="css/crt_classList.css?badsd">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<!-- header 부분 -->
<jsp:include page="${contextpath}/1_Include/header.jsp"></jsp:include>

<!-- 페이지 전체를 감싸는 div 영역 -->
<div id="wrap">

<form action="crt_classList.me" method="post">

   <!-- 첫번째 section영역 -->
	<div class = "sec01">
		<h4 style="font-weight: bold; color: #3c3c3c; font-size: 20px;"> 나의 클래스 </h4>
		
			<div class="allClass">
				
				<!-- DB와 연결하여 table에서 class 이미지 경로값, 클래스 명을 가져 오기 -->		
<%-- <%
	List crt = (ArrayList)request.getAttribute("memberList");
		for(int i=0; i<crt.size(); i++){
			MemberBean m = (MemberBean)crt.get(i);
%>		 --%>	
				<div>
					<div id="class_image">
   						<img src="" alt="">
   					</div>
							
					<div id="class_name">
						<div class="class_name_1">클래스명</div>
						<div class="class_name_2"></div>
					</div>
							
					<div id="class_btn">
						<button type="button" class="class_btn_1" onclick="">
							<i class='fa fa-ellipsis-h' style='font-size:23px'></i>
						</button>
					</div>
				</div>
<%-- <%
		}
%>	 --%>			
				<!-- 클래스 생성버튼 -->			
				<div id="class_create">
					<input type="submit" id="btn_create" value="+ 새로운 클래스 생성하기">
				</div>
			</div>
	</div> 
	
</form>	

	<div class="sec02">
		<h4 style="font-weight: bold; color: #3c3c3c; font-size: 20px;"> 도움말 </h4>
		<div class="notice">	
			<div>
				<a href="index.jsp">
					<p class="notice1_1">크리에이터가 되는 방법&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></p>
					<p class="notice1_2">
					저희 페이지가 처음이신가요? Learn&Run에서 크리에이터가 되는 방법을 소개해드리겠습니다. 
					</p>
				</a>
			</div>
			
			<div>
				<a href="index.jsp">
					<p class="notice2_1">클래스 제작은 어떻게 이루어지나요?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;>></p>
					<p class="notice2_2">
					클래스 제작 순서와 Learn&Run 페이지에서 제공하는 지원들을 알려드립니다.
					저희만의 특별함을 느껴보세요.
					</p>
				</a>
			</div>	
		</div>			
	</div> <!-- sec02끝나는 부분 -->
	<%

		session.setAttribute("id", "admin1");
	%>
	
	해야 할 것 <br>
	1. delete 버튼 기능 구현<br>
	
	
</div><!-- 전체 영역 끝나는 부분 -->

<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>
</body>
</html>