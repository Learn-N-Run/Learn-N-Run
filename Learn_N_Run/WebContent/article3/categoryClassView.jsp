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
<body style="overflow-x:hidden; overflow-y:auto;"> 

<%-- header--%>
<c:import url="/1_Include/header.jsp"></c:import>
	
	<div id="wrap">

<c:import url="/article3/inc_main/category.jsp"></c:import>

		<h3>
			<font color="tomato">Class List</font>
			<font color="tomato" style="font-weight:bold; font-size: 0.7em;">
<c:if test="${param.category ne null}">
				: ${param.category}
</c:if>
			</font>
		</h3>
		<div id="TH_category_class" class="row">

<c:forEach items="${classinfo.cateClassList}" var="classlist">

			<div class="col-lg-3 col-xs-6">
				<div class="TH_onclickContent" 
					onclick="location.href = '${contextpath}/article2/classInfo.me?no=${classlist.no}'">
					${classlist.title}
					<img src="${contextpath}/${classlist.cover_img}">
				</div>
			</div>
</c:forEach>
			
		</div>


	</div>
	
<%-- footer.jsp--%>
<c:import url="/1_Include/footer.jsp"></c:import>
	
</body>
</html>