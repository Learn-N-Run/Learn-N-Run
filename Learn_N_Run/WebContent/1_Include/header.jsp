<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<!-- <script src="./js/script.js"></script> -->
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<script type="text/javascript">
$(function(){
	/*받은 쪽지함에서 쪽지 작성을 눌렀을때 */
	$(".message_send_h").click(function(){
		$(".message_main").fadeOut("fast");
		$(".container1_h").fadeIn("fast");
		$("#real_receiver_id").val('');
	});

	/*쪽지 쓰기에서 돌아가기를 눌렀을때*/
	$(".reset_h").click(function(){
		$(".message_main").fadeIn("fast");
		$(".container1_h").fadeOut("fast");
	});

	/*쪽지 상세보기에서 돌아가기를 눌렀을때*/
	$(".reset1_h").click(function(){
		$(".message_main").fadeIn("fast");
		$(".container2_h").fadeOut("fast");
	});

	/*받은 쪽지함에서 컬럼한개를 눌렀을때 상세페이지 로딩*/
	$("#detail_content").click(function(){
		$(".message_main").fadeOut("fast");
		$(".container2_h").fadeIn("fast");
	});

	/*나가기 버튼을 눌렸을때, mask 없앰*/
	$(".outMessage_h").click(function(){
		$(".mask_h").css("display","none");
	});

	/*답장 버튼을 눌렀을때*/
	$(".send_Message_h").click(function(){
		var receiver_id = $("#receiver_id").val();
		$("#real_receiver_id").val(receiver_id);
		$(".container2_h").fadeOut("fast");
		$(".container1_h").fadeIn("fast");
	});

	$("#message_info_h").click(function() {
		alert("클릭함");
		$.ajax({
			type:'POST',
			url : "selectMessage.do",
			success : function(data,textStatus,jqXHR) {
				alert(data);
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }

          });

		});

		
	

});


/*메인에서 쪽지함 눌렀을때 */


</script>






<style type="text/css">



	/*쪽지 마스크 배경 색 */        
	.mask_h {
		position: fixed;
		display: none;
		z-index: 1;
		overflow: hidden;
		left : 0;
		top: 0;
		width: 100%;
		height: 100%;
		background-color: gray;
		-webkit-border-radius: 3px;
		-webkit-box-shadow: 0px 0px 20px #999;
	}

	 /*공통 버튼*/
	 .outMessage_h,.message_send_h,.reset_h,.message_delete_h,.send_Message_h,.reset1_h{
	 	font-size: 13px;
	 	font-weight: 200;
	 	width: 20%;
	 	border-radius: 5px;
		color: black;
		cursor: pointer;
		float: right;
		background: linear-gradient(to bottom , #EFFBFB, #A9F5F2);
		height: 23px;
		color: #04B4AE;
		font-weight: 700;
		border: 1px solid #A9F5F2;
		margin-left: 8px;
	 }


	  /*버튼 clear:both*/
	 .bottom_button{
 	    clear: both;
	    height: 27px;
	    padding-right: 4px;
	 }

	 /*버튼 호버시*/
 	 .hover_button_h:HOVER{
	 	background: linear-gradient(to bottom, #A9F5F2 , #EFFBFB); 
	 	color: #0B615E;
	 }

	 /*상단 title*/
	 .message_top{
	 	margin: 7px 7px 0;
	    height: 25px;
	    background-color: lightblue;
	    border-radius: 5px 5px 0 0;
	    color: white;
	 }
	 .message_top>span{
	 	height: 100%;
	    background-color: white;
	    display: inline-block;
	    border-radius: 20px 20px 0 0;
	    width: 40%;
	    color: black;
	    font-family: 'Jua', sans-serif;
	    font-weight: 200;
	    background-color: white;
	    text-align: center;
	    box-shadow: 5px 0px 7px grey;
	    letter-spacing: 3px;
	    font-size: 17px;
	 }

	 /*content영역*/
	 .message_content{
	 	min-height: 350px;
	 	border-radius: 0 5px 5px 5px;
	    margin: 0 7px 7px 7px;
	    box-shadow: 5px 5px 4px grey;
	    background: white;
	 }

	/*받은 쪽지함(메인) */
	.message_main {
	            background-color: lightblue;
	            margin: 15% auto; /* 15% from the top and centered */
	            width: 40%; /* Could be more or less, depending on screen size */  
	            border-radius: 5px;
    			border: 1px solid rgba(0,0,0,.4);
    			-webkit-box-shadow: 0 3px 9px rgba(0,0,0,.7);
    			box-shadow: 0 3px 9px rgba(0,0,0,.5);
    			transition: all 2s;                        
	 }

	 
	 /*테이블 영역[받은 쪽지함]*/
	 .table_h{
	 	width: 100%;
	 	background-color: lightgray;
	 	text-align: center;
	 }
	
	/*테이블 가운데 정렬[받은 쪽지함], 여백 띄우기*/
	 .table_h table{margin: auto; }
	 .message_main>thead{margin-top: 20px; }
	 
	 .table_h thead td{
	 	background:  linear-gradient(to bottom , #E6E6E6, #848484);
	 	color: white;
	 }
	 .table_h tbody td{
	 	height: 30px;
	 	background-color: #F2F2F2;
	 	font-size: 15px;
    	font-weight: 300;
	 }
	.table_h tbody td img{
		width: 70%; 
		height:100%;
		vertical-align: center;
	}


	 /*쪽지 보내기 */
	 .container1_h {
	 			display: none;
	 			background-color: lightblue;
	            margin: 0% auto; 
	            width: 40%; 
	            border-radius: 5px;
    			border: 1px solid rgba(0,0,0,.4);
    			-webkit-box-shadow: 0 3px 9px rgba(0,0,0,.7);
    			box-shadow: 0 3px 9px rgba(0,0,0,.5);      
	 }
	 
	 /*textarea 크기 지정*/
	 .textsize { width: 100%; height: 290px;}

	 /*받은 쪽지 상세보기*/
	 .container2_h{
	 		display: none;
	 		background-color: lightblue;
            margin: 0% auto;
            width: 40%;
            border-radius: 5px;
			border: 1px solid rgba(0,0,0,.4);
			-webkit-box-shadow: 0 3px 9px rgba(0,0,0,.7);
			box-shadow: 0 3px 9px rgba(0,0,0,.5);
	 }

	 /*메세지 보내기 ID부분*/
	 .message_send_top{ padding: 9px 5px 5px 5px; }
	 .message_send_top>span{
	 	    background: linear-gradient(to bottom , white, #E6E6E6);
		    border-radius: 5px 5px;
		    border: 0.5px solid #D8D8D8;
		    font-size: 14px;
		    padding: 1px 1px 1px 1px;
		    box-shadow: 1px 2px 1px rgba(0,0,0,.3);
	 }
	 /*쪽지 보내기 내용영역*/
	 .message_send_content{
	 	margin: 2px 15px 10px 10px;
	 }
	 
	 
	 /**********************************************************************************/
#inc_header{
	height: 100px;
	position: relative;
	vertical-align: middle;
	max-width: 1200px;
	width: 100vw;
	border-bottom: 1px double rgba(0,0,0,0.2);
}
#inc_menuList{
	content: "";
	position: absolute;
	font-size: 20px;
	font-weight: bold;
}
#inc_menuList>ul>li{
 	margin-left: 10px;
 	margin-right: 10px;
 	margin-top: 10px;
 	margin-bottom: 10px;
 	vertical-align: middle;
 	transition: all 0.5s
}
#inc_menuList>ul>li:HOVER{
	font-size:30px;
}
.inc_floating{
	position: relative;
	top: 30px;
}

/* 햄버거메뉴 */
	#inc_hamburger {
		display:none;
		position: fixed;
		float: right;
		right: 1vw;
		top: 50px;
		width: 50px;
		height: 50px;
		transform: translate(-50%, -50%);
		cursor: pointer;
		background: rgba(0,0,0,0.7);
		border-radius: 50%;
		border: none;
		outline: none;
	}
	
	#inc_hamburger span {
		position: absolute;
		width: 30px;
		height: 4px;
		top: 50%;
		left: 50%;
		background: rgba(255,255,255,0.8);
		border-radius: 2px;
		overflow: hidden;
		transition: all 0.3s linear;
	}
	
	#inc_hamburger span::before {
		content: "";
		position: absolute;
		width: 0;
		height: 100%;
		top: 0;
		right: 0;
		background: rgba(255,255,255,0.2);
		transition: all 0.3s linear;
	}
	
	#inc_hamburger span:nth-child(1) {
		animation: span-first-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger span:nth-child(2) {
		animation: span-second-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger span:nth-child(3) {
		animation: span-third-off 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on:hover span::before {
		width: 100%;
		transition: all 0.3s linear;
	}
	
	#inc_hamburger.on span:nth-child(1) {
		animation: span-first-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on span:nth-child(2) {
		animation: span-second-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	#inc_hamburger.on span:nth-child(3) {
		animation: span-third-on 0.5s ease-in-out;
		animation-fill-mode: forwards;
	}
	
	@keyframes span-first-on {
		0% {
			transform: translate(-50%, -300%);
		}
		30% {
			transform: translate(-50%, -50%);
		}
		100% {
			transform: translate(-50%, -50%) rotate(-45deg);
		}
	}
	
	@keyframes span-first-off {
		0% {
			transform: translate(-50%, -50%) rotate(-45deg);
		}
		30% {
			transform: translate(-50%, -50%) rotate(0deg);
		}
		100% {
			transform: translate(-50%, -300%);
		}
	}
	
	@keyframes span-second-on {
		0% {
			transform: translate(-50%, -50%);
		}
		25% {
			background: gray;
		}
		50% {
			transform: translate(-50%, -50%) scale(1);
		}
		100% {
			transform: translate(-150%, -50%) scale(0);
		}
	}
	
	@keyframes span-second-off {
		0% {
			transform: translate(-150%, -50%) scale(0);
		}
		25% {
			background: gray;
		}
		50% {
			transform: translate(-50%, -50%) scale(1);
		}
		100% {
			transform: translate(-50%, -50%);
		}
	}
	
	@keyframes span-third-on {
		0% {
			transform: translate(-50%, 200%);
		}
		30% {
			transform: translate(-50%, -50%);
		}
		100% {
			transform: translate(-50%, -50%) rotate(45deg);
		}
	}
	
	@keyframes span-third-off {
		0% {
			transform: translate(-50%, -50%) rotate(45deg);
		}
		30% {
			transform: translate(-50%, -50%) rotate(0deg);
		}
		100% {
			transform: translate(-50%, 200%);
		}
	}
	@media(max-width:1200px){
		#inc_hamburger{
			display: inline;
 			z-index: 1000;
		}
		#inc_menuList>ul{
			position: fixed;
			float: right;
			top: 0px;
			right: 0px;
 			background-color: rgba(255,255,255,0.8);
 			width: 200px;
 			height: 100vh;
 			z-index: 1;
 			padding-top: 100px;
		}
	}

</style>
<title></title>
</head>
<body>
	<jsp:include page="loginModal.jsp"></jsp:include>
	<header id="inc_header">
		<div class="col-xs-2" align="center">
			<a href="${contextpath}/article3/index.jsp" style="width: 100px; height: 100px;">
				<img src="img/large.png">
			</a>
		</div>
		<div class="inc_floating col-xs-10" align="left">
			<div class="col-xs-8">
				<form>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="카테고리 + 제목">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-default" style="background-color: white;">
								<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
							</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-xs-4">
				<div id="inc_menuList" class="visible-lg-block">
					<ul class="list-inline">
						<!-- 세션영역에서 유저빈의 유무 판별 --> 
						<c:choose>
							<c:when test="${null ne sessionScope.user }">
								<li>
									<a href="javascript:;" id="message_info_h"
									 style="text-decoration: none; color: black;">
										쪽지함
									</a>
								</li>
								<li>
									<a href="#"
									 style="text-decoration: none; color: black;">
										로그아웃
									</a>
								</li>
								<li>
									<a href="#"
									 style="text-decoration: none; color: black;">
										 마이페이지
									</a>
								</li>
							</c:when>
							<c:when test="${null eq sessionScope.user }">
								<li>
									<a href="#login-box" class="login-window"
									 style="text-decoration: none; color: black;">
										로그인
									</a>
								</li>
								<li>
									<a href="#"
									 style="text-decoration: none; color: black;">
										회원가입
									</a>
								</li>
							</c:when>
						</c:choose>
					</ul>
				</div>
				<button id="inc_hamburger" data-toggle="collapse" data-target="#inc_menuList" aria-expanded="false" aria-controls="#inc_menuList">
					<span></span>
					<span></span>
					<span></span>
				</button>
			</div>
		</div>
	</header>
<!-- 햄버거메뉴 -->	
<script type="text/javascript">
	var inc_menuList = document.querySelector('#inc_menuList');
	var inc_menu_ul = document.querySelector('#inc_menuList>ul');
	
	document.getElementById('inc_hamburger').addEventListener('click', function() {
		if (this.className == 'on'){
			this.classList.remove('on');
			inc_menuList.classList.add('visible-lg-block');
		}else{
			this.classList.add('on');
			inc_menuList.classList.remove('visible-lg-block');
		}});
</script>
</body>
</html>