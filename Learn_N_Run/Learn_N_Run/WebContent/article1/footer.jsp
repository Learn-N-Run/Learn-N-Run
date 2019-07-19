<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<!-- <script src="./js/script.js"></script> -->
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<title></title>
</head>
<body>
<div id = "wrap">
<footer style="background-color: #000000; color: #ffffff; text-align: center;">
		<div class = "container">
			<div class = "row">
				<h4>Project : Learn & Run</h4>
				<div class="col-xs-4">
					● 사업자 등록번호 <BR> 
				    214-98754-9874
				</div>
				<div class="col-xs-4">
					● 부산 본점<br>
					부산시 부산진구 동전로 역삼동 역삼빌딩 2층 21호
				</div>
				<div class="col-xs-4">
					대표전화 : 051-1234-5678<br>
					팩스번호 : 051-1234-5678
				</div>
				<h5>Copyright 2019</h5>
				
				<div>
					<h4>아이티윌부산 Iot반 3조</h4>
					<ul class="list-inline">
						<li>성시현</li>
						<li>서창현</li>
						<li>장영진</li>
						<li>이승학</li>
						<li>신형석</li>
						<li>고태흥</li>
						<li>나중에 고치자</li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
</div>
</body>
</html>