<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--프로젝트경로선언--%>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextpath }/article2/css/crt_classList.css?fbq">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	
	$(function(){
		$(".toggle1").hide();
		$('.class_btn_1').click(function(){
			var index = $(".class_btn_1").index(this);
			$(".toggle1:eq("+index+")").toggle();
			$(".toggle1:not(.toggle1:eq("+index+"))").hide();
		});
	})
	
	
	function delete_class(g){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href="crt_deleteClass.me?no="+g;
			return true;
		}else{
			return false;
		}
	} 




</script>
</head>
<body>

<!-- header 부분 -->

<jsp:include page="/1_Include/header.jsp" />
<!-- 페이지 전체를 감싸는 div 영역 -->
<div id="wrap">

<form action="/Learn_N_Run/article2/crt_classList.me" method="post">

   <!-- 첫번째 section영역 -->
	<div class = "sec01">
		<h4 style="font-weight: bold; color: tomato; font-size: 20px;"> 나의 클래스 </h4>
		
			<div class="allClass">
				
				<!-- DB와 연결하여 table에서 class 이미지 경로값, 클래스 명을 가져 오기 -->		
			<c:forEach var="classList" items="${classList}">
				<input type="hidden" id="classList_val" name="no" value="${classList.no }">
				<div>
					<div id="class_image">
   						<img src="upload/${classList.cover_img }" alt="">
   					</div>
							
					<div id="class_name">
							<div class="class_name_1">클래스명</div>
						<a href="crt_curriCulumInfo.me?no=${classList.no}">	
							<div class="class_name_2">${classList.title }</div>
						</a>
					</div>
							
					<div id="class_btn">
						<button type="button" class="class_btn_1" id="class_btn1">
							<i class='fa fa-ellipsis-h' style='font-size:23px'>	</i>
						</button>
						<div class="toggle1">
							<a href="#" onClick="delete_class(${classList.no})">삭제하기</a>
						</div>
					</div>
				</div>
			</c:forEach>
						
				<!-- 클래스 생성버튼 -->			
				<div id="class_create">
					<input type="submit" id="btn_create" value="+ 새로운 클래스 생성하기">
				</div>
			</div>
	</div> 
	
</form>	

	<div class="sec02">
		<h4 style="font-weight: bold; color: tomato; font-size: 20px;"> 도움말 </h4>
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
</div><!-- 전체 영역 끝나는 부분 -->
<jsp:include page="/1_Include/fincate.jsp"></jsp:include>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>