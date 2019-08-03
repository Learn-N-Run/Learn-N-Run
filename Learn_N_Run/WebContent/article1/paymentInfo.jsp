<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<c:set var="classNo" value="${param.classno }"></c:set>
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
<title></title>
<style>
	#wrap{
		width: 1200px;
		margin : 0 auto;
	}
	#center{
	}
	
	

.content_h {
	max-width:800px;
	margin: 0 auto;
    height: 950px;
	border: 0.3px solid gray;
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


.content_wrap_h .deliver_h{
	height: 300px;
	border-bottom: 0.5px solid lightgray;
	margin-bottom: 20px;
}

.content_wrap_h .deliver_1_h{
	height: 230px;
	border-bottom: 0.5px solid lightgray;
}

.deliver_h>h4{
	font-size: 25px;
	font-weight: 700;
	margin-bottom: 20px;
	border-bottom: 0.5px solid lightgray;
    padding-bottom: 20px;
}

.content_wrap_h{
	padding: 30px 30px 30px 30px;
}


.tuition_h{
    height: 190px;
    border-bottom: 0.5px solid lightgray;
}

.deliver_h .section_h{
	font-size: 17px;
}

.deliver_h .section_h input{
	width: 100%;
	height: 40px;
	padding : 5px 5px 5px 15px;
}

.tuition_h>h4{
	font-size: 25px;
	font-weight: 700;
	margin-top:40px;
	margin-bottom: 10px;
}

.tuition_h table{
	width:100%;
}

.tuition_h tr{
	margin-top: 10px;
}

.tuition_h th{
    width: 40%;
    font-size: 17px;
    text-align: left;
    padding: 7px 7px 7px 7px;
    font-weight: 500;
}

.tuition_h td{
	width: 40%;
    font-size: 17px;
    text-align: right;
    padding: 7px 7px 7px 7px;
    font-weight: 500;
}

.table_h{
	margin: 15px 30px 30px 30px;
}

.last_pay{
	margin: 20px 20px 20px 20px
}

.last_pay button{
	width: 100%;
	height: 50px;
	background-color: black;
	color: white;
	font-size: 20px;
}

.ex_h{
	color: gray;
	font-size: 15px;
	padding-left: 10px;
}

.section_h th{
	width: 20%;
	height: 100px;
}

.section_h img{
	width: 100%;
	height: 100%;
}

.section_h span{
	font-weight: 700;
	
}

.section_1_h{
    display: inline-block;
    width: 50%;
    float: left;
    height: 210px;
}

.section_2_h{

    margin-bottom: 10px;
    display: inline-block;
    float: left;
    width: 50%;
}

.section_2_h span{
	padding-left: 25px;
	font-size: 17px;
}

.section_2_h p{
	padding-left: 30px;
	font-size: 17px;
}

.table_1_h th{
	width: 78%;
    height: 70px;
    text-align: right;
    font-size: 33px;
}

.table_1_h td{
	width: 100%;
    height: 70px;
    font-size: 30px;
    padding-left: 20px;
}
</style>
</head>
<body>
<jsp:include page="${contextpath}/1_Include/header.jsp"/>
	<div id="wrap">
			<div id="center">
				<div class="content_h">
			<!-- content 제목 부분 -->
			<div class="title_h">
				<p>구매 목록 확인</p>
			</div>
			
			<div class="content_wrap_h">
			
				<!-- 배송 정보 입력창 부분 -->
				<section class="deliver_h">
					<h4>구매 목록</h4>
					<div class="section_h">
						<div class="section_1_h">
							<img src="img/${requestScope.cover_img }">
						</div>
						<div class="section_2_h">
							<span>1. [온라인 수강권]</span>
						</div>
						<div class="section_2_h">
							<p>${requestScope.title }</p>
						</div>
					</div>
					
				</section>
				
				<section class="deliver_1_h">
					<div class="section_h">
						<div class="section_1_h">
							<img src="img/${requestScope.material_img }">
						</div>
						<div class="section_2_h">
							<span>2. [준비물]</span>
						</div>
						<div class="section_2_h">
							<p>${requestScope.material_content }</p>
						</div>
					</div>
				</section>
				<div>
					<table>
						<tbody>
							<tr class="table_1_h">
								<th align="right">총 금액 : </th>
								<td align="left"> ${tuition}</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div>
<pre>
   [유의사항]
	1. 본인이 구매하려고 하시는 목록이 정확한지 확인후에 '다음버튼'을 클릭하세요
	2. 한번 결재된 이후에는 환불하기가 번거롭습니다. 주의하시고 결재해주세요.
	3. 다른 문의사항이 있으시면 우측하단에 문의하기 버튼을 누르세요. 빠른 시일 내에 답변드리겠습니다.
</pre>
				</div>
				
				<div class="last_pay">
					<button type="button"><a href="payment.do?classno=${classNo}">다음으로</a></button>
				</div>
			</div>
		</div>
</div>
	</div>
<jsp:include page="${contextpath}/1_Include/footer.jsp"></jsp:include>
</body>
</html>