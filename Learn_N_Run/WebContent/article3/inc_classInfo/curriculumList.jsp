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
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css?v=<%=System.currentTimeMillis()%>">
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
	<div id="TH_curriculumContents">
		<div style="padding-bottom: 30px;">
			<div style="font-size: 24px; font-weight: bold; color: tomato;" >
				커리큘럼
			</div>
			<div style="font-size: 1.1em; font-weight: bold; margin: 5px 0px; ">
				제작될 클래스의 커리큘럼입니다. 일부 콘텐츠는 무료로 공개될 수 있습니다.
			</div>
			<div style="font-size: 0.9em;">
				커리큘럼은 일부 변동될 수 있으며, 콘텐츠는 순차적으로 업로드 될 수 있습니다.
			</div>
		</div>
		
		<div class="TH_curriculuminfo row">
			<img class="col-lg-3 col-xs-12" src="${contextpath}${cudto.thumbnail}">
			<div class="col-lg-9 col-xs-12">

			<p style="font-size: 1.1em; font-weight: bold; margin: 5px 0px; ">
				${cudto.major_topic}
			</p>
<c:forEach var = "suv" items="${requestScope.suv}" varStatus="status" >

				<p>
					<span class="TH_subjectNum">${status.count}</span>
					${suv.subject}
				</p>

</c:forEach>				

			</div>
		</div>
	</div>
	
</body>
</html>