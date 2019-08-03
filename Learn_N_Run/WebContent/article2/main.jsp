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
<title>Learn & Run</title>
<style type="text/css">
#wrap {
	margin: 0 auto;
	width: 1280px;
}

.introduce {
	height: 600px;
	background: url("img/ccc.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
}

@media ( max-width : 1124px) {
	.introduce {
		background-size: 100% 100%;
	}
}

@media ( max-width : 724px) {
	.introduce {
		background-size: 100% 100%;
	}
}
</style>
</head>
<body>

	<jsp:include page="${contextpath}/1_Include/header.jsp"></jsp:include>
	<div id="wrap">
		<section class="introduce"></section>
	</div>
	<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>



</body>
</html>