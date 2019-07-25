<%@page import="java.io.File"%>
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--외부참조 + CDN END -->
<style>
	#inc_footer{
		 padding: 1em;
		 background-color: black;
		 color: rgba(255,255,255,0.9);
		 text-align: center;
		 width: 100vw;
 		 position: fixed; 
		 bottom: 0px;
 		 display: none;
	}
	#inc_footer>div>div, inc_bottom{
		border-top: 1px solid rgba(255,255,255,0.05);
	}
	.inc_TeamMemList>li>a{
		text-decoration: none;
		color: rgba(255,255,255,0.9);
		
	}
	#inc_mark_github:HOVER{cursor: pointer;}
	#inc_mark_github{
		font-size: 24px;
		animation-duration: 1s;
		animation-iteration-count: infinite;
		animation-name: click-me;
		display: inline;
	}
	#inc_mark_nav{
		position:fixed;
		right:1vw;
		animation-duration: 1s;
		animation-iteration-count: infinite;
		animation-name: click-me;
	}
	@keyframes click-me{
		0%{
			opacity : 1;
		}
		50%{
			opacity : 0.5;
		}
		100%{
			opacity : 1;
		}
	}
	#inc_githubfooter:HOVER{cursor: pointer;}
	#inc_githubfooter{
		position: fixed;
		right: 1vw;
		bottom: 25vh;
		z-index: 1000;
	}
</style>
<title></title>
</head>
<body>
<%-- footer github logo --%>
<img id="inc_githubfooter"
	src="${contextpath}/3_img/GitHub-Mark.png"
	onclick="togglefooter()">

<%-- footer contents --%>
	<footer id="inc_footer" data-position="fixed">
		<div class="row" >
			<div class="col-lg-6">
				<h3 style="margin: 0px; height: 30px;">
					Project Learn & Run
				</h3>
				<div>
					<label>Address</label>
						부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
					<div class="row">
						<div class="col-xs-2">
						</div>
						<div class="col-xs-4">
							<label>Call</label>
							051-7777-7777
						</div>
						<div class="col-xs-4">
							<label>Fax</label>
							051-7777-7778
						</div>
						<div class="col-xs-2">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="row">
					<div style="height: 30px;">
						<h3 id="inc_mark_github"
							onclick="window.open('https://github.com/Learn-N-Run/Learn-Run')">
							프로젝트 참여자
							<span id="inc_mark_nav">
								<span class="glyphicon glyphicon-arrow-left"></span>
								Click On it!
							</span>
						</h3>
					</div>
					<div class="col-xs-4">
						<label>구현1팀</label><BR>
						<ul class="inc_TeamMemList list-inline">
							<li>
								<a href="#">
								신형석
								</a>
							</li>
							<li>
								<a href="#">
								이승학
								</a>
							</li>
						</ul>
					</div>
					<div class="col-xs-4">
						<label>구현2팀</label><BR>
						<ul class="inc_TeamMemList list-inline">
							<li>
								<a href="#">
								성시현
								</a>
							</li>
							<li>
								<a href="#">
								서창현
								</a>
							</li>
						</ul>
					</div>
					<div class="col-xs-4">
						<label>구현3팀</label><BR>
						<ul class="inc_TeamMemList list-inline">
							<li>
								<a href="#">
								장영진
								</a>
							</li>
							<li>
								<a href="#">
								고태흥
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="inc_bottom" class="row">
			<h5>
				본 페이지의 해당 컨텐츠는 정식으로 서비스되지 않는 페이지입니다.
			</h5>
		</div>
	</footer>
	
	<script type="text/javascript">
	function togglefooter() {
		var footer = $('#inc_footer');
		var githubfooter = $('#inc_githubfooter') 
		if (footer.css('display') === 'none') {
			footer.toggle(500);
		}else{
			footer.toggle(500);
		}
	};
	
	
				
			
	
</script>
	
</body>
</html>