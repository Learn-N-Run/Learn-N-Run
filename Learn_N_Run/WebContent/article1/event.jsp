<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:choose>
	<c:when test="${coupon1Register == 1}">
		<script>
			window.alert("축하합니다! 쿠폰함에서 쿠폰을 확인하세요!")
		</script>
	</c:when>
	<c:when test="${coupon1Register == 0 }">
		<script>
			window.alert("이미 쿠폰을 받으셨습니다! 본 쿠폰은 한계정당 1회만 받을 수 있습니다.")
		</script>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${coupon3Register == 1}">
		<script>
			window.alert("축하합니다! 쿠폰함에서 쿠폰을 확인하세요!")
		</script>
	</c:when>
	<c:when test="${coupon3Register == 0 }">
		<script>
			window.alert("이미 쿠폰을 받으셨습니다! 본 쿠폰은 한계정당 1회만 받을 수 있습니다.")
		</script>
	</c:when>
	<c:when test="${coupon3Register == -1 }">
		<script>
			window.alert("크리에이터 지원후 쿠폰을 받으실수 있습니다!")
		</script>
	</c:when>
</c:choose>
<%!public int getRandom(){
	int random = 0;
	random = (int) Math.floor((Math.random() * (99999 - 10000 + 1))) + 10000;
	return random;
} %>
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
	$(function () {
		//이메일 인증 보내기
		$("#emailCheck_h").click(function() {
			alert("이메일 발송시까지 1~3분 소요될수 있습니다.");
			$.ajax({
				url : "coupon1.do",
				type : "post",
				data : {
					emailReceiver_h : $("#emailReceiver_h").val(),
					code_check : $("#code_check").val()
				},
				dataType : "text",
				success : function(data) {
					alert("이메일 을 보내드렸습니다,\n 인증번호를 입력후 쿠폰받기를 눌러주십시오")
					
				},error : function() {
					alert("이메일을 확인하십시오")
				}
			});
		});
			
		$("#receive_coupon1_h").click(function() {
			alert($("#code_check").val() + $(".EmailNumber_h").val() )
			if( $("#code_check").val() == $(".EmailNumber_h").val() ){
				location.href="coupon1_register_h.do";
			}else{
				alert("인증번호를 확인하세요!");
			}
		});
		
		$(".btn_Email2").click(function() {
			location.href="coupon3.do";
		});	
		
		
		$("button[data-toggle='sns_share']").click(function(e) {
			e.preventDefault();
			
			var _this = $(this);
			var sns_type = _this.attr('data-service');
			var href = "http://localhost:8180/Learn_N_Run/article1/event.jsp";
			var title = _this.attr('data-title');
			var loc = "";
			var img = $("meta[name='og:image']").attr('content');
			
			if( ! sns_type || !href || !title) return;
			
			if( sns_type == 'facebook' ) {
				loc = '//www.facebook.com/sharer/sharer.php?u='+href+'&t='+title;
			}
			else if ( sns_type == 'twitter' ) {
				loc = '//twitter.com/home?status='+encodeURIComponent(title)+' '+href;
			}else if ( sns_type == 'naver' ) {
				loc = "http://share.naver.com/web/shareView.nhn?url="+encodeURIComponent(href)+"&title="+encodeURIComponent(title);
			}
			else {
				return false;
			}
			
			window.open(loc);
			return false;
		})
	});
	
	
</script>
<title></title>
<style>
	#wrap{
		width: 1200px;
		margin : 0 auto;
	}
	#center{
		height: 4000px;
	}
	
	
	.event_wrap{
		margin : 100px auto;
		background-image: url('img/event2.png');
		width: 90%;
		height: 1200px;
		background-size: 100% 100%;
		margin: 0 auto;
		ar
	}

	.event_wrap1{
		background-image: url('img/event1.png');
		width: 90%;
		height: 1200px;
		background-size: 100% 100%;
		margin: 0 auto;
	}

	.event_wrap2{
		margin: 50px 50px 50px 50px;
		background-image: url('img/event3.png');
		width: 90%;
		height: 1200px;
		background-size: 100% 100%;
		margin: 0 auto;
	}

	.rightEmail{
		text-align: center;
		padding-top: 800px;
	}

	.input_Email{
		width: 25%;
	    margin-left: 30px;
	    height: 30px;
	    background-color: white;
	    font-size: 20px;
	    padding-left: 10px;
	    border: 0.5px solid #5F4C0B;
	    border-radius: 7px 7px;
	    color: goldenrod;
	}

	.btn_Email{
		width: 13%;
	    height: 35px;
	    border-radius: 7px 7px;
	    background: linear-gradient(45deg, white, transparent);
	    font-weight: 700;
	    color: white;
	    cursor: pointer;
	}

	.share_event{
		text-align: center;
    	padding-top: 130px;
	}

	.share_event button{
		background-color: transparent;
	    height: 27px;
	    color: floralwhite;
	    font-size: 1.0em;
	    padding: 0 50px;
	    border-radius: 3px 3px;
        box-shadow: 6px 0px 6px 0px #48350a, 6px 0px 15px rgba(23, 13, 2, 0.4);
        cursor: pointer;
	}

	.share_event button:active{
		outline: none;
		border: none;
	}

	.btn_Email:active {
	    outline: none;
	    border: none;
	}

	.share_event button:hover{
		background-color: #4F380B;
		box-shadow: 0px 5px 0px 5px #48350a,, 0px 0px 0px rgba(23, 13, 2, 0.4);
		border-color: #4F380B;
	}

	.btn_Email:hover{
		background: linear-gradient(45deg,  transparent, white);
	}

	.event_allWrap{
		margin: 30px auto;
		padding: 30px 30px 30px 30px;
		border : 1px solid black;
		width: 85%;
		}

	.rightEmail2{
		text-align: center;
		padding-top: 720px;
	}

	.btn_Email2{
		width: 16%;
	    height: 50px;
	    border-radius: 7px 7px;
	    background: linear-gradient(45deg, green, transparent);
	    font-weight: 700;
	    color: white;
	    font-size: 20px;
	    cursor: pointer;
	}

	.btn_Email2:hover{
		background: linear-gradient(45deg, transparent, green);
	}

	.event_title>p{
		height: 50px;
		line-height: 50px;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 0.5px solid gray;
		font-size: 20px;

	}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/1_Include/header.jsp"/>
			<div id="center">
				<div class="event_allWrap">
			<div class="event_title">
				<p>[EVENT] 1. 오픈 이벤트</p>
			</div>
			<div class="event_wrap1">
				<div class="rightEmail">
					<input type="text" class="input_Email" id="emailReceiver_h" name="email" value="${requestScope.user_email }" readonly="readonly">
					<button type="button" class="btn_Email" id="emailCheck_h">인증 요청</button>
					 <input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>" />
					<input type="text" class="input_Email EmailNumber_h" name="rightNum">
					<button type="button" id = "receive_coupon1_h" class="btn_Email">쿠폰 받기</button>
				</div>
				<div class="share_event">
					<button type="button" data-toggle="sns_share"  data-service="twitter" data-title="Learn&Run 오픈이벤트">twitter 공유하기</button>
					<button type="button" data-toggle="sns_share"  data-service="facebook" data-title="Learn&Run 오픈이벤트">FaceBook 공유하기</button>
					<button type="button" data-toggle="sns_share"  data-service="naver" data-title="Learn&Run 오픈이벤트">Naver Blog 공유하기</button>
				</div>
			</div>
		</div>
		<div class="event_allWrap">
			<div class="event_title">
				<p>[EVENT] 2. 댓글 이벤트</p>
			</div>
			<div class="event_wrap">
			</div>
		</div>
		<div class="event_allWrap">
			<div class="event_title">
				<p>[EVENT] 3. 크리에이터 지원 이벤트</p>
			</div>
			<div class="event_wrap2">
				<div class="rightEmail2">
					<button type="button" class="btn_Email2">쿠폰 받기</button>
				</div>
			</div>
		</div>
			</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>