<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css?v=<%=System.currentTimeMillis()%>">
	<script src="${contextpath}/article3/js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
	<title>Learn & Run</title>
</head>
<body> 
		

		<div id="TH_community">
			<h3>
				<font color="tomato">커뮤니티</font>
<c:if test="${reply ne null }">
			개의 글
</c:if>
			</h3>
			<form action="">
				<div class="input-group">
					<input type="hidden" name="classNo" value="">
					<input type="hidden" name="userID" value="">
					<input class="form-control" type="text" name="classReplyContents" placeholder="댓글을 입력해주세요">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button">등록</button>
					</span>
				</div>
			</form>
		</div>
	
		<table class="TH_allReplyList table table-hover">
			<thead>
				<tr>
					<td>
						<div class="TH_replyProfile">
							<img class="col-xs-3" src="${contextpath}/article3/img/Loading.svg">
							<div class="col-xs-9 row">
								<div class="col-xs-5" align="center">
									<h5>이름</h5>
									<h6>시간</h6>
								</div>
								<div class="col-xs-7" style="color: tomato; font-size: 0.8em; font-weight: bold;">
									크리에이터
								</div>
							</div>
						</div>
						<div class="TH_replyContent">
							<p>Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools.</p>
						</div>
					</td>
				</tr>
			</thead>
			<tbody class="TH_realwell">
				<tr>
					<td onclick="javascript;">
						<div class="TH_targetContent">
							<div class="row">
								<img class="col-xs-3" 
									src="${contextpath}/article2/img/6.png">
								<h6 class="col-xs-3">
									이름
								</h6>
								<h6 class="col-xs-6">
									시간
								</h6>
							</div>
							<p>Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools.
							Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools.
							Generate Lorem Ipsum placeholder text for use in your graphic, print and web layouts, and discover plugins for your favorite writing, design and blogging tools.
							</p>					
						</div>
					</td>
				</tr>
			</tbody>
			<tfoot class="TH_targetReply">
				<tr>
					<td>
						<form action="">
							<div class="input-group">
								<input type="hidden" name="classNo" value="">
								<input type="hidden" name="targetNo" value="">
								<input type="hidden" name="userID" value="">
								<input class="form-control" type="text" name="" placeholder="댓글을 입력해주세요">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">등록</button>
								</span>
							</div>
						</form>
					</td>
				</tr>
			</tfoot>
		</table>

</body>
</html>