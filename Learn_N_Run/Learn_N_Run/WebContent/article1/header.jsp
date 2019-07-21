<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<c:set var="result" value="${requestScope.result }"/>
<c:if test="${result==0 }">
	<script>alert("비밀번호가 틀립니다.")</script>
</c:if>
<c:if test="${result==-1 }">
	<script>alert("아이디가 틀립니다.")</script>
</c:if>
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
	
	$(".login-window").click(function() {
		
		var loginBox = $(this).attr('href');

		$(loginBox).fadeIn(300);
		
		var popMargTop = ($(loginBox).height() + 24) / 2; 
		var popMargLeft = ($(loginBox).width() + 24) / 2; 
		
		$(loginBox).css({ 
			'margin-top' : -popMargTop,
			'margin-left' : -popMargLeft
		});
		
		$('body').append('<div id="mask"></div>');
		$('#mask').fadeIn(300);
		
		return false;
	});
	
	$('div').on('click','a.close_h, #mask' ,function() { 
	  $('#mask , .login-popup').fadeOut(300 , function() {
		$('#mask').remove();  
	}); 
	return false;
});
	
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
</script>

<link href="css/header.css" rel="stylesheet">
	<!-- header에들어가는 모든 css모음. -->


<title></title>
</head>
<body>
	<h1>확인입니다222.</h1>
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
							<c:if test="${sessionScope.id != null }">
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
							</c:if>
							<c:if test="${sessionScope.id == null }">
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
							</c:if>
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
	<!-- end of header -->
	
	<!-- 햄버거 메뉴 -->
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
	
	<script src="js/channelio.js"></script>
	<!-- channelioAPI 불러옴 -->
	
    <div id="login-box" class="login-popup">
    	
		<form class="form_h" action="login.do" method="post">
			<a class="close_h">EXIT</a>
	        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
	            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
	            <g class="ears">
	                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
	                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
	            </g>
	            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
	            <g class="eyes">
	                <!-- left eye and eyebrow-->
	                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
	                <circle cx="44" cy="55" r="3" fill="#000" />
	                <!-- right eye and eyebrow -->
	                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
	                <circle cx="76" cy="55" r="3" fill="#000" />
	            </g>
	            <g class="muzzle">
	                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
	                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
	                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
	            </g>
	            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
	        </svg>
	        <input class="H_inputText" id="H_login_id" name="userid" type="text" placeholder="email">
	        <input class="H_inputText" id="H_login_pass" name="userpass" type="password" placeholder="Password">
	        <input type="submit" class="H_submit" value="Let's log in!">
	        <a href="#" class="H_join">Join us!</a>
	        <script src="js/ryan.js"></script>
	    </form>
   </div>
	<!-- 로그인 팝업 -->	

</body>
</html>