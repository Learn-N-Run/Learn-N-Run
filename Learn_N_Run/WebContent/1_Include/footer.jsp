<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
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
 		 z-index: 100;
	}
	#inc_footer>div>div, inc_bottom{
		border-top: 1px solid rgba(255,255,255,0.05);
	}
	.inc_TeamMemList>li>a{
		text-decoration: none;
		color: rgba(255,255,255,0.9);
	}
	.inc_git_anchor{transition: all 0.5; color: white;}
	.inc_git_anchor:HOVER{cursor: pointer; color: tomato;}
	#inc_href_people{
		font-size: 24px;
	}
	#inc_href_prjoect{
		position:fixed;
		right:1vw;
	}
 	#inc_githubfooter:HOVER{background: tomato;}
	#inc_githubfooter{
		background: rgba(0,0,0,0.9);
		max-width: 50px;
		max-height: 50px;
		position: fixed;
		right: 1vw;
		bottom: 25vh;
		z-index: 1000;
  		border: 1px solid rgba(0,0,0,0);		 
		border-radius: 100%;
		display: block;
	    transition: all 0.5s;
	    animation-name: visiblemark;
	    animation-duration: 1s;
	    
	}
	@keyframes visiblemark{
		from{opacity: 0;}
		to{opacity: 1;}
	}
	
	.textLauncherIcon{
		position: fixed !important;
		bottom: 17vh !important; 
		right: 1vw !important;
		width: 50px !important;
		height: 50px !important;
	}
	.textLauncherIcon:HOVER{
		background: tomato !important;
		transition: all 0.5s !important;
		
	}
	.jeJOWG *, .cZHGZB *{
		display: none !important;
	}
</style>
<title></title>
</head>
<body>
<div style="content: ''; height: 200px;">&nbsp;</div>
<%-- aside.jsp include --%>
<c:import url="/1_Include/inc_aside.jsp"></c:import>

<%-- footer github logo --%>
	<a href="javascript:togglefooter()">
		<img id="inc_githubfooter"
			 src="${contextpath}/3_img/GitHub-Mark-Light-64px.png">
	</a>
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
							<span id="inc_href_people" class="inc_git_anchor" onclick="window.open('https://github.com/orgs/Learn-N-Run/people')">
								프로젝트 참여자
							</span>
							<span id="inc_href_prjoect" class="inc_git_anchor" onclick="window.open('https://github.com/Learn-N-Run/Learn-Run')">
								(GitHub 페이지로 이동)
							</span>
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
		<div id="inc_bottom" class="row" align="center">
			<h5>
				본 페이지의 해당 컨텐츠는 정식으로 서비스되지 않는 페이지입니다.
			</h5>
		</div>
	</footer>
	
<script type="text/javascript">
function togglefooter() {
	$('#inc_footer').toggle(500)
};
</script>
</body>
</html>