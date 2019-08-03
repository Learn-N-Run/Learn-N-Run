<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<link rel="stylesheet" href="./css/style.css">
<script src="./js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<script type="text/javascript">

	$(function() {
		$("#buyClass_h").click(function() {
			location.href="buyClassInfo.do?classno=2";
		});
	});
</script>
<title></title>
<style>
	#wrap{
		width: 1200px;
		margin : 0 auto;
	}
	#center{
		height: 800px;
		background-color: lightgray;
	}
</style>
</head>
<body>
<jsp:include page="${contextpath}/1_Include/header.jsp"/>
	<div id="wrap">
			<div id="center">
				<a href="event.do">이벤트 페이지로 이동</a>
				<a href="getMyClassInfo.do">내 수강목록 페이지 이동</a>
				<button type="button" id="buyClass_h">구매하기</button>
				<a href="getUserInfo.do">내 정보 수정페이지로 이동</a>
			</div>
	</div>
<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>
		
</body>
</html>