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
</head>
<body>
	
	<h3>
		<font color="tomato">Category</font>
	</h3>
	<div id="TH_category">

<c:forEach items="${listMap.categoryList}" var="category">

		<div class="TH_onclickContent"
			onclick="location.href = '${contextpath}/categoryinfo.kr?category=${category.name}'">
			<img class="TH_cateimg" src="${contextpath}${category.image}">
			<p>${category.name}</p>
		</div>

</c:forEach>

<c:forEach items="${classinfo.categoryList}" var="categoryinfo">

		<div class="col-lg-1 col-xs-3 ">
			<div class="TH_onclickContent cateimg"
				onclick="location.href = '${contextpath}/categoryinfo.kr?category=${categoryinfo.name}'">
				<img class="TH_cateimg" src="${contextpath}/${categoryinfo.image}">
				<div>
					${categoryinfo.name}
				</div>
			</div>
		</div>

</c:forEach>

	</div>
</body>
</html>