<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/crt_classList.css?badsd">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>

<!-- header 부분 -->
<jsp:include page="header.jsp"></jsp:include>

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

		session.setAttribute("id", "cba");
	%>
	
	해야 할 것 <br>
	1. delete 버튼 기능 구현<br>
	
	
</div><!-- 전체 영역 끝나는 부분 -->

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>