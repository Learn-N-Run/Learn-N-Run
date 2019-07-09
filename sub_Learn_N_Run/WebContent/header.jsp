<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="context"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css?ver=<%=System.currentTimeMillis()%>"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css?ver=<%=System.currentTimeMillis()%>"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet" href="css/style.css?ver=<%=System.currentTimeMillis()%>">
<title></title>
</head>
<body>
	<header>
		<div id="TH_header-wrap">
			<span id="TH_main-logo">
				<img src="img/uh.jpg" width="auto" height="50px">
			</span>
			<ul class="nav nav-pills">
				<li>
					<span class="glyphicon glyphicon-search"></span>
				</li>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${not empty sessionScope.user_id}"> --%>
						<li>
							내 정보
						</li>
						<li>
							쪽지함
						</li>
						<li>
							로그아웃
						</li>
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
						<li>
							로그인
						</li>
						<li>
							회원가입
						</li>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
			</ul>
		</div>
	</header>
</body>
</html>