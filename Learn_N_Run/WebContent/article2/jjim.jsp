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
	<link rel="stylesheet" href="./css/jjim.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<title></title>
</head>
<body>
	<jsp:include page="${contextpath}/1_Include/header.jsp"></jsp:include>
	<div id = "wrap">
	
	<section id="sec05">
 	<ul id="side_bar">
 			<label>카테고리 분류</label>
			<li class="list"><a>개인정보수정</a></li>
			<li class="list"><a>내클래스</a></li>
			<li class="list"><a>클래스수강목록</a></li>
			<li class="list"><a>찜목록</a></li>
			<li class="list"><a>쪽지함</a></li>
			<li class="list"><a>댓글관리</a></li>
			<li class="list"><a>로그아웃</a></li>
			<li class="list"><a>회원탈퇴</a></li>
			<li class="list"><a>쿠폰함</a></li>
		</ul>
 	</section>
	
	
		
		<table id = "table_c" >
			<tr>
				<th style="background-color: #fff"></th>
				<th>클래스명</th>
				<th>카테고리 및 크리에이터</th>
				<th>수강료 </th>
				<th></th>
			</tr>
			<tr>
				<td id = "iag_c">
					<a href = "#"><div><img src="img/ccc.jpg" width="100%" height="100%"></div></a>
				</td>
				<td>titlecategory ◆ creatorcategory ◆ creator</td>
				<td>켈리그라피 ◆ nickname</td>
				<td>￦???,???</td>
				<td align="center"><button>찜 해제</button></td>
			</tr>
			<tr>
				<td id = "iag_c">
					<a href = "#"><div><img src="img/ceplogo.jpg" width="100%" height="100%"></div></a>
				</td>
				<td>title</td>
				<td>category ◆ creator</td>
				<td>￦???,???</td>
				<td align="center"><button>찜 해제</button></td>
			</tr>
			
			<tr>
			</tr>
		</table>
		
		
	
	</div>
	<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>
</body>
</html>