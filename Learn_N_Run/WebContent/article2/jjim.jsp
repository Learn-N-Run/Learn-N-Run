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
<link rel = "stylesheet" href = "${contextpath }/article2/css/jjim.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<title></title>

</head>
<body>
	<jsp:include page="/1_Include/header.jsp" />
	<div id = "wrap">
	
	
	
	
	<div class="title_h">
		<p>찜 목록</p>
	</div>
		<table id = "table_c" >
			<tr>
				
				<th colspan="2" width="58%;">클 래 스 정 보</th>
				<th width="20%;">카 테 고 리 및 크 리 에 이 터</th>
				<th width="12%;" >수 강 료 </th>
				<th width="10%;" ></th>
				
			</tr>
			<c:if test="${cv == '[]'}">
				
					<tr>
						<td colspan="5" align="center">찜 목록을 추가해주세요</td>
					</tr>
				
			</c:if>
			<c:forEach var = "cv" items="${requestScope.cv}">
			
				<tr>
				<td id = "iag_c">
					<a href = "/Learn_N_Run/article2/classInfo.me?no=${cv.classinfo.no}"><div><img src="${contextpath}${cv.classinfo.cover_img}" width="100%;" height="100%;"></div></a>
				</td>
					<td>${cv.classinfo.title }</td>
					<td align="center">${cv.classinfo.category.name } ★ ${cv.user.nickname}</td>
					<fmt:formatNumber var="tuition" value = "${cv.classinfo.tuition}" pattern="###,###"/>
					<td>￦ ${tuition}</td>
					<td align="center"><button class = "deljjim_c" onclick="location.href = '/Learn_N_Run/article2/deleteJjim.me?no=${cv.no}'">찜 해제</button></td>
				</tr>
			</c:forEach>
			
		</table>
		
		<c:if test="${cv != '[]'}">
			<h4 align="center">※ 찜한 클래스를 구매하고 싶다면 클래스 커버이미지를 클릭한 후 클래스 페이지에서 신청해주세요</h4>
		</c:if>
	
	</div>
	<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>
