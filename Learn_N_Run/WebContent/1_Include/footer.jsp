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
<title></title>
</head>
<body>
	<div id = "wrap">
		<footer style="padding: 1em; background-color: black; color: rgba(255,255,255,0.9); text-align: center;">
			<div class="row" >
				<div class="col-lg-6" style="border-top: 1px solid rgba(255,255,255,0.05)">
					<h3>
						Project Learn & Run
					</h3>
					<div>
						<label>Address</label>
							부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
						<label>Call</label>
							051-7777-7777<br>
						<label>Fax</label>
							051-7777-7778<br>
					</div>
				</div>
				<div class="col-lg-6" style="border-top: 1px solid rgba(255,255,255,0.05)">
					<div class="row">
						<h3>
							프로젝트 참여자
						</h3>
						<div class="col-xs-4">
							<label>구현1팀</label><BR>
							<ul class="list-inline">
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									신형석
									</a>
								</li>
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									이승학
									</a>
								</li>
							</ul>
						</div>
						<div class="col-xs-4">
							<label>구현2팀</label><BR>
							<ul class="list-inline">
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									성시현
									</a>
								</li>
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									서창현
									</a>
								</li>
							</ul>
						</div>
						<div class="col-xs-4">
							<label>구현3팀</label><BR>
							<ul class="list-inline">
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									장영진
									</a>
								</li>
								<li>
									<a href="#"
										style="text-decoration: none; color: rgba(255,255,255,0.9)">
									고태흥
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="border-top: 1px solid rgba(255,255,255,0.05)">
				<h5>
					본 페이지는 정식으로 서비스되지 않는 페이지입니다.<BR>
					해당 컨텐츠는 원저작자의 동의없이 마구썼음
				</h5>
			</div>
		</footer>
	</div>
</body>
</html>