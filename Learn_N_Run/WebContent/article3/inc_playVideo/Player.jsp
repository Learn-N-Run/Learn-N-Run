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
#TH_viewVideo{
	padding: 20px;
	box-shadow: 5px 5px 5px rgba(0,0,0,0.2),
				-5px -5px 5px rgba(0,0,0,0.2),
				5px -5px 5px rgba(0,0,0,0.2),
				-5px 5px 5px rgba(0,0,0,0.2);
	height: 60vh;
}
</style>
</head>
<body>

	
	<div id="TH_viewVideo" id="wrap" >
		<h3>
			<font color="tomato">커리큘럼 시청</font>
		</h3>
	
		<div class="col-lg-9">
		
				<video style="max-width: 40vw; height: auto; display: inline;" poster="${contextpath}${subject_list[0].coverimg}" controls="controls" >
	<c:forEach items="${subject_list}" var="sb">
					<source src="${contextpath}${sb.url}">
	</c:forEach>
				</video>
				
		</div>
		<div class="col-lg-3">&nbsp;
		<table class="table table-hover">
			<tbody>
	
	<c:forEach items="${subject_list}" var="sb">
				
				<tr>
					<td>
						<a href="/Learn_N_Run/article3/getcurrivideo.kr?subjectno=${sb.subjectno}"
							style="text-decoration: none; font-weight: bold; color: tomato;">
							${sb.subject}.${sb.topic}
						</a>
					</td>
				</tr>
				
	</c:forEach>
	
			</tbody>
		</table>
		
		
		
		</div>
	
	</div>

</body>
</html>