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
		$("#coupon_h").click(function() {
			$(".coupon_modal_h").toggle();
			$.ajax({
				url:"selectCouponCount.do",
				type:"post",
				success : function(data) {
					var jsonInfo = JSON.parse(data);
					$(".coupon1_h").text(jsonInfo.sale1);
					$(".coupon2_h").text(jsonInfo.sale2);
					$(".coupon3_h").text(jsonInfo.sale3);
				}
			});
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
		height: 800px;
		background-color: lightgray;
	}
	.content_h{
			background-color: rgb(0,0,0,0.4);
			height: 1200px;
		}
		
		.category_h{
			position : fixed;
			width : 10%;
			background-color: lightblue;
		}
		
		.category_h ul{
			margin: 0; padding: 0; list-style: none;
		}
		.category_h ul li{
			background-color:black;
			padding: 10px 5px; border-bottom: 1px solid #DDD;
			border-radius: 5px 5px 5px 5px;
		}
		
		.category_h ul li:HOVER{
			background-color : gray;
			color: black;
		}
		
		.category_h ul li:ACTIVE{
			background-color : gray;
			color: black;
		} 
		
		.category_h ul a{
			font-size : 17px;
			font-weight : 500;
			color: white; text-decoration: none;
		}
		
		
		.myContent_h{
		    width: 83%;
		    height: 100%;
		    background-color: aqua;
		    margin-left: 17%;
		}
		
		.category_section_h{
			width: 20%;
			height: 100%;
		}
		
		#wrap{
			clear: both;
		}
	
	
	.coupon_modal_h{
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
		    left: 30%;
		    top: 11%;
		}
		
		.coupon_title_h{
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
		
		.coupon_modal_h table{
			border : 0.3px solid lightgray;
			width: 100%;
		}
		
		.coupon_modal_h tr{
			padding: 5px 5px 5px 10px;
		}
		
		.coupon_modal_h th{
			width: 80%;
			height: 90px;
			
			background-color: black;
		}
		
		.coupon_modal_h td{
			font-size: 20px;
			font-weight: 700;
			text-align: center;
			
		}
		
		.coupon_bottom_h{
			line-height: 40px;
			text-align: center;
			font-size: 20px;
			font-weight: 700;
		}
		
		.coupon1{
			background: url("img/5000coupon.png");
			background-size: 100% 100%;
		}
		
		.coupon2{
			background: url("img/7000coupon.png");
			background-size: 100% 100%;
		}
		
		.coupon3{
			background: url("img/10000coupon.png");
			background-size: 100% 100%;
		}
		
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="header.jsp"/>
			<div id="center">
				<div class="category_h">
						<ul>
							<a href="javascript:;"><li>내정보</li></a>
							<a href="javascript:;"><li>회원탈퇴</li></a>
							<a href="javascript:;"><li>로그아웃</li></a>
							<a href="javascript:;"><li>내 수강목록</li></a>
							<a href="javascript:;"><li>찜목록</li></a>
							<a href="javascript:;" id="coupon_h"><li>쿠폰함</li></a>
							<a href="javascript:;"><li>내 클래스</li></a>
							<a href="javascript:;"><li>찜목록</li></a>						
						</ul>
					</div>
			</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	
	<div class="coupon_modal_h">
				<div class="coupon_title_h">내 쿠폰 보유 현황</div>
				<table>
					<tr>
						<th class="coupon1"></th>
						<td class="coupon1_h"></td>
					</tr>
					<tr>
						<th class="coupon2"></th>
						<td class="coupon2_h">2개</td>
					</tr>
					<tr>
						<th class="coupon3"></th>
						<td class="coupon3_h">2개</td>
					</tr>
				</table>
				<a href="javascript:;"><div class="coupon_bottom_h">쿠폰 받으러 가기!</div></a>
			</div>
</body>
</html>