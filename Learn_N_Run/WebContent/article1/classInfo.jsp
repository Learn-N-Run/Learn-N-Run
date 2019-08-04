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
	width: 100%;
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
	padding: 20px 20px 0 20px;
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

.myContent_h table{
	margin-top: 30px;
	width: 100%;
}
.myContent_h table thead{
	background: rgb(129,131,131);
	background: linear-gradient(0deg, rgba(129,131,131,1) 0%, rgba(0,0,0,1) 100%);
	font-size: 18px;
	color: white;
}
.myContent_h table thead th{
    text-align: center;
    height: 50px;
}

.myContent_h tbody td{
    padding: 10px 10px 10px 10px;
    border-bottom: 0.3px solid gray;
    text-align: center;
}

.class_qwfqwf_h{
    width: 30%;
    float: left;
    height: 150px;
    line-height: 120px;
    margin-left: 30px;
}

.class_qwfqwf_h img{
	
	width: 100%;
	height: 100%;
}

.class_qwf_h{
    float: left;
    padding: 10px 10px 10px 10px;
    line-height: 120px;
}

</style>
</head>
<body>
<jsp:include page="fincate.jsp"></jsp:include>
<jsp:include page="/1_Include/header.jsp"/>
	<div id="wrap">
			<div id="center">
				<!-- id="coupon_h" -->
				<div class="myContent_h">
					<div class="title_h">
						<p>내 수강 정보</p>
					</div>
					<table>
						<thead>
							<tr>
								<th width="60%">클래스 정보</th>
								<th width="10%">카테고리</th>
								<th width="15%">수강 신청일</th>
								<th width="15%">수강 만료일</th>
							</tr>
						</thead>
						<tbody>
						 <c:choose>
                        	<c:when test="${requestScope.MyclassList == '[]' }">
                        		<tr><td colspan="4" style="font-size: 30px; text-align: center ">구매한 수강정보가 없습니다.</td></tr>
                        	</c:when>
                     		<c:otherwise>
                          	<c:forEach var="list" items="${requestScope.MyclassList }">				
								<tr>
									<td>
										<div class="class_qwfqwf_h"><img src='img/${list.cover_img }'></div>
										<div class="class_qwf_h">${list.title }</div>
									</td>
									<td>${list.category.name }</td>
									<fmt:formatDate var="order_date" value="${list.buyer.order_date}" pattern="yyyy-MM-dd" /> 
									<td>${order_date }</td>
									<fmt:formatDate var="expiration_date" value="${list.buyer.expiration_date}" pattern="yyyy-MM-dd" />         
									<td>${expiration_date }</td>
								</tr>
							</c:forEach>
                        </c:otherwise>
	                    </c:choose>
						</tbody>
					</table>
                  <%--   <c:choose>
                        <c:when test="${requestScope.MyclassList == '[]' }">
                        	<br>
                            <h1>구매한 수강정보가 없습니다.</h1>
                        </c:when>
                        <c:otherwise>
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
										<fmt:formatDate var="order_date" value="${list.buyer.order_date}" pattern="yyyy-MM-dd" /> 
										${order_date }
									</p>
								</div>
                                <div class="myClass_expiration">
                                	<p>
                                        <span>[수강 만료일]</span><br>
                                        <fmt:formatDate var="expiration_date" value="${list.buyer.expiration_date}" pattern="yyyy-MM-dd" /> 
                                        ${expiration_date }
									</p>
								</div>
								<div style="clear: both;"></div>
							</div>
						</c:forEach>
                        </c:otherwise>
                    </c:choose> --%>
			</div>
		</div>
	</div>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>