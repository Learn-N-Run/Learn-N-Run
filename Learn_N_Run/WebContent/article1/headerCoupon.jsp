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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><head>
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
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Hi+Melody|Jua&display=swap" rel="stylesheet">


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


	 
</style>
<title></title>
</head>
<body>
	
	<div id="wrap">
		<header>
			<div class="logo"></div>
			<div class="search">
				<form>
					<div style="width: 80%;">
						<input type="text" class="form-control" placeholder="카테고리 + 제목">
					</div>
					<div style="width: 10%;">
						<input type="submit" class="btn btn-default" value="검색">
					</div>
				</form>
			</div>

			<section>
			<c:if test="${sessionScope.id != null }">
				<span class="btn btn-default"><a href="javascript:;" id="message_info_h">쪽지함</a></span> 
				<span class="btn btn-default"><a>LOGOUT</a></span> 
				<span class="btn btn-default"><a href="#login-box" class="login-window">내정보</a></span>
			</c:if>
			<c:if test="${sessionScope.id == null }">
				<span class="btn btn-default"> <a>JOIN</a></span> 
				<span class="btn btn-default"> <a href="#login-box" class="login-window">LOGIN</a></span>
			</c:if>
			</section>
		</header>

		<div class="list">

			<span style="width: 100%;" class="form-control"><a href="#"
				style="text-decoration: none;">LOGIN</a></span> <span style="width: 100%;"
				class="form-control"><a href="#"
				style="text-decoration: none;">JOIN</a></span>
		</div>
	</div>
	
		<!--start of 받은 쪽지함-->
	<div class="mask_h">
		<div class="message_main">
			<div class="message_top">
				<span>&nbsp;받은 쪽지함</span>
				<button type="button" class="outMessage_h hover_button_h">나가기</button>
			</div>
			<div class="message_content">
				<br>
				<!-- <button id="message_send_h">메세지 보내기</button> -->
				<div class="table_h">
					<table>
						<thead>
							<tr>
								<td width="15%">보낸 사람</td>
								<td width="60%">제 목</td>
								<td width="15%">받은 시간</td>
								<td width="10%">읽음 유무</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${requestScope.list }">
							<tr>
								<td><a id="detail_content">${list.send_user.id }</a></td>
								<td>${list.content }</td>
								<td>${list.send_time }</td>
								<c:if test="${list.read_yn == 1 }">
									<td><img src="img/check.png"></td>
								</c:if>	
								<c:if test="${list.read_yn == 0 }">
									<td><img src="img/new.png"></td>
								</c:if>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<span>[1]</span>
			</div>
			<div align="right" class="bottom_button">
				<button type="button" class="message_send_h hover_button_h">쪽지 쓰기</button>
			</div>
		</div>
		<!--end of 받은 쪽지함-->

		<!--start of 쪽지 쓰기-->
			<div class="container1_h">
				<div class="message_top">
					<span>&nbsp;쪽지 쓰기</span>
					<button type="button" class="outMessage_h hover_button_h" >나가기</button>
				</div>

				<div class="message_content">
					<form method="post" action="">
						<div class="message_send_top">
						<span>받는 사람</span> :
							<input type="text" id="real_receiver_id" name="receiver_id" placeholder="받는사람 ID">
						</div>
						<div class="message_send_content">
							<textarea class="textsize" name="content"></textarea>
						</div>
					</form>
				</div>
				<div class="bottom_button">
					<button class="send_Message_h hover_button_h">보내기</button>&nbsp;
					<button type="button" class="reset_h hover_button_h" >돌아가기</button>
				</div>
			</div>
	
		<!--end of 쪽지 보내기 -->

		<!--start of 쪽지 상세보기 -->
		<div class="container2_h">
			<div class="message_top">
				<span>&nbsp;받은 쪽지</span>
				<button type="button"class="outMessage_h hover_button_h">나가기</button>
			</div>
			<div class="message_content">
					<div class="message_send_top">
					<span>받는 사람</span> :
						<input type="text" value="las2706" readonly="readonly">
					</div>
					<div class="message_send_top">
					<span>보낸 사람</span> :
						<input type="text" id="receiver_id" value="seunghak12" readonly="readonly">
					</div>
					<div class="message_send_content">
						<textarea class="textsize" name="content" readonly>뀨??</textarea>
					</div>
			</div>
			<div class="bottom_button">
				<button class="message_delete_h hover_button_h">삭제하기</button>
				<button class="send_Message_h hover_button_h">답장하기</button>&nbsp;
				<button type="button" class ="reset1_h hover_button_h">돌아가기</button>
			</div>
		</div>
	</div>
	<!--end of 쪽지보내기 -->
</body>
</html>