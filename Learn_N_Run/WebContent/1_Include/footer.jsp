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
<style type="text/css">

.hom{
	text-align: center;

}

</style>
<title></title>
</head>
<body>
<div id = "wrap">
<footer style="background-color: #000000; color: #ffffff">
		<div class = "container">
			<br>
			 <!-- class = "col-sm-n(자연수)(공간 할당)" -->	
			<div class = "row">
				<div class = "col-sm-2"  style = "text-align: center;"><h5>Copyright &copy; 2019<br><br>team 3</h5></div>
				<div class = "col-sm-4"><h4>대표자 소개</h4>
				<p><span style="font-family: 'Black Han Sans', sans-serif;">Learn & Run</span><BR> 
				     사업자 등록번호 214-98754-9874 </p>
				<p>● 부산 본점<br>
				     부산시 부산진구 동전로 역삼동 역삼빌딩 2층 21호</p>
				<p>대표전화 : 051-1234-5678<br>
				      팩스번호 : 051-1234-5678</p>
				</div>
				
				<div class = "col-sm-4"><h4 style="text-align: center;">Learn & Run</h4>
					<div class = "list-group">
						<a href = "#" class = "list-group-item hom">HOME</a>
						
					</div>
				</div>
				<div class = "col-sm-2 footitem"><h4>
					<span class= "glyphicon glyphicon-ok"></span><b><a href = "#" style="color: #ffffff; text-decoration: none;">&nbsp; 개인정보취급방침</a></b></h4>
				</div>
				<div class = "col-sm-2 footitem"><h4>
					<span class= "glyphicon glyphicon-ok"></span><b><a href = "#" style="color: #ffffff; text-decoration: none;">&nbsp; 환불정책</a></b></h4>
				</div>
			</div>
		</div>
	</footer>
</div>
</body>
</html>