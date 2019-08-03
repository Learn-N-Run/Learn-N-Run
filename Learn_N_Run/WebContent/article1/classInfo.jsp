<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
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
	}
	
	<style type="text/css">
.content_h {
	
}

.myContent_h {
	width: 83%;
	margin-left: 17%;
}

.category_section_h {
	width: 20%;
	height: 100%;
}

#wrap {
	clear: both;
}

.coupon_modal_h {
	background-color: white;
	position: fixed;
	display: none;
	z-index: 1;
	overflow: hidden;
	left: 0;
	top: 0;
	width: 300px;
	height: 350px;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: 0px 0px 20px #999;
	left: 33%;
	top: 10%;
}

.coupon_title_h {
	width: 100%;
	height: 40px;
	text-align: center;
	font-size: 20px;
	font-weight: 700;
	border-bottom: 0.5px solid lightgray;
	background-color: black;
	color: white;
	line-height: 40px;
}

.coupon_modal_h table {
	border: 0.3px solid lightgray;
	width: 100%;
}

.coupon_modal_h tr {
	padding: 5px 5px 5px 10px;
}

.coupon_modal_h th {
	width: 80%;
	height: 90px;
	background-color: black;
}

.coupon_modal_h td {
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}

.coupon_bottom_h {
	line-height: 40px;
	text-align: center;
	font-size: 20px;
	font-weight: 700;
}

.coupon1 {
	background: url("img/5000coupon.png");
	background-size: 100% 100%;
}

.coupon2 {
	background: url("img/7000coupon.png");
	background-size: 100% 100%;
}

.coupon3 {
	background: url("img/10000coupon.png");
	background-size: 100% 100%;
}

.title_h {
	height: 100px;
	padding: 30px 20px 10px 30px;
	background-color: black;
}

.title_h>p {
	font-size: 30px;
	color: white;
}

.myClass_content_h {
	padding: 20px 20px 20px 20px;
	font-size: 18px;
}

.myClass_img {
	float: left;
	width: 30%;
	height: 250px;
}

.myClass_img img {
	width: 100%;
	height: 100%;
}

.myClass_title {
	float: left;
	width: 100%;
	height: 170px;
	text-align: center;
	overflow: hidden;
	border: 0.3px solid lightgray;
}

.myClass_category {
	float: left;
	width: 100%;
	height: 80px;
	text-align: center;
	border: 0.3px solid lightgray;
}

.myClass_buyTime {
	float: left;
	width: 20%;
	height: 250px;
	text-align: center;
	border: 0.3px solid lightgray;
}

.myClass_expiration {
	float: left;
	width: 20%;
	height: 250px;
	text-align: center;
	border: 0.3px solid lightgray;
}

.myClass_title_category {
	width: 30%;
	height: 250px;
	float: left;
	text-align: center;
	border: 0.3px solid lightgray;
}

.myClass_content_h span {
	font-size: 20px;
	color: lightgray;
	text-align: center;
}

.myClass_buyTime p {
	margin-top: 50%;
}

.myClass_expiration p {
	margin-top: 50%;
}
</style>
</head>
<body>
<jsp:include page="cateEx.jsp"></jsp:include>
<jsp:include page="${contextpath }/1_Include/header.jsp"/>
	<div id="wrap">
			<div id="center">
				<!-- id="coupon_h" -->
				<div class="myContent_h">
					<div class="title_h">
						<p>내 수강 정보</p>
					</div>
					<c:if test="${requestScope.MyClassList == null }">
						<h1>구매한 수강정보가 없습니다.</h1>
					</c:if>
					
					<c:if test="${requestScope.MyclassList != null }">
						<c:forEach var="list" items="${requestScope.MyclassList }">
							<div class="myClass_content_h">
								<div class="myClass_img">
									<img src="img/${list.cover_img }">
								</div>
								<div class="myClass_title_category">
									<div class="myClass_title">
										<span>[수강명]</span> <br> <br> ${list.title }
									</div>
									<div class="myClass_category">
										<span>[카테고리명]</span><br> <br>${list.category.name }
									</div>
								</div>
								<div class="myClass_buyTime">
									<p>
										<span>[수강 신청일]</span><br>
									</p>
								</div>
								<div class="myClass_expiration">${list.order_date }
									<p>
										<span>[수강 만료일]</span><br>${list.expiration}
									</p>
								</div>
								<div style="clear: both;"></div>
							</div>
						</c:forEach>
					</c:if>
					
			</div>
		</div>
	</div>
<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>
</body>
</html>