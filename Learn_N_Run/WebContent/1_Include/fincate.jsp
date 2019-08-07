<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function menu_toggle(){
		$("#ul_h").toggle(2000);
	}
	
	$(document).on("click","#logout_h", function() {
		var result = confirm("정말 로그아웃하시겠습니까?");
		if(result){
			location.href="logout.do";	
		}else{
			return false;
		}
	});
</script>
<title></title>
<style>
		.category_h{
				top : 130px;
			    height: 800px;
			    position: fixed;
			    width: 10%;
		}
		
		.category_h ul{
			margin: 0; padding: 0; list-style: none;
		}
		.category_h ul li{
			padding: 20px 5px;
		    border-bottom: 1px solid #DDD;
		    border-radius: 5px 5px 5px 5px;
			text-align: right;
		}
		.category_h ul a{
		    font-size: 17px;
		    font-weight: 500;
		    color: gray;
		    text-decoration: none;
		}
		.category_h ul li:HOVER{
		    background: url('img/category.png');
   			background-size: 100% 100%;
			color: white;
		}
		
		.category_h ul li:ACTIVE{
			background: url("img/category.png");
   			background-size: 100% 100%;
			color: white;
		} 
		#menu_toggle{
			display: block;
			text-align: center;
			width: 50px;
			height: 50px;
			background: url('img/updown.png');
			background-size: 100% 100%;
		}

</style>
</head>
<body>
		<div class="category_h">
			<ul id="ul_h">
				<a href="getUserInfo.do"><li>내정보</li></a>
				<a href="getMyClassInfo.do"><li>내 수강목록</li></a>
				<a href="/Learn_N_Run/article2/jjim.me"><li>찜 목록</li></a>
				<a href="javascript:;" id="coupon_h"><li>쿠폰함</li></a>
				<c:if test="${sessionScope.Group == 1 }">
				<a href="AddCreator.jsp"><li>크리에이터 지원</li></a>	
				</c:if>
				<c:if test="${sessionScope.Group == 2 }">
				<a href="crt_getAllClassList.me" ><li>내 클래스</li></a>
				</c:if>
				<a href="javascript:;" id="logout_h"><li>로그아웃</li></a>
				<a href="${contextpath }/article1/signout.jsp"><li>회원탈퇴</li></a>
			</ul>
			<a id="menu_toggle" href="javascript:;" onclick="menu_toggle()"></a>			
		</div>
		<jsp:include page="couponEx.jsp"></jsp:include>
</body>
</html>