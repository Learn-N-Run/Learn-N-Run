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
	<form action="">
		
	</form>
	<table id="TH_allReplyList" class="table table-hover">
		<tbody>
			<tr>
			
				<td onclick="location.href=''">
					<div class="TH_replyProfile">
						<img class="col-xs-6" src="${contextpath}/article3/img/Loading.svg">
						<div class="col-xs-6">
							<h5>이름</h5>
							<h6>시간</h6>
						</div>
					</div>
					<div class="TH_replyContent">
						<p>로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는 없나로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는 없나로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는 없나로렘단축키단축키같은건 이클립스는 없나로렘단축키단축키같은건 이클립스는 없나로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는 없나로렘단축키같은건 이클립스는</p>
						<p>없나로렘단축키같은건 이클립스는 없나</p>
						<p>LoremLoremLoremLoremLoremLoremLoremLoremLorem</p>
					</div>
				</td>
					
			</tr>
		</tbody>
		<tfoot>
			
			
		</tfoot>
	</table>
	
</body>
</html>