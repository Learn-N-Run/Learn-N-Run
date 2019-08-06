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
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css?ver=3">
	<script src="${contextpath}/article3/js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--외부참조 + CDN END -->
	<title>Learn & Run</title>
</head>
<body>

<!-- 세션의 유저 아이디값 유무판별 하여 컨텐츠 뿌리기-->	

	<div id="TH_commentContents" class="TH_replyContents">
	    <h4>Scroll Container</h4>
<c:forEach items="" var="replyList">
	    <p>
		    <a href="javascript:">
		    	유저
		    </a>
	    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In luctus, ex eu sagittis faucibus, ligula ipsum sagittis magna, et imperdiet dolor lectus eu libero. Vestibulum venenatis eget turpis sed faucibus. Maecenas in ullamcorper orci, eu ullamcorper sem. Etiam elit ante, luctus non ante sit amet, sodales vulputate odio. Aenean tristique nisl tellus, sit amet fringilla nisl volutpat cursus. Quisque dignissim lectus ac nunc consectetur mattis. Proin vel hendrerit ipsum, et lobortis dolor. Vestibulum convallis, nibh et tincidunt tristique, nisl risus facilisis lectus, ut interdum orci nisl ac nunc. Cras et aliquam felis. Quisque vel ipsum at elit sodales posuere eget non est. Fusce convallis vestibulum dolor non volutpat. Vivamus vestibulum quam ut ultricies pretium.
	    </p>
</c:forEach>
	</div>
	
<c:choose>
<c:when test="${requestScope.user.id ne null}">
	
	<form class="TH_replyContents" action="/add-comment.kr">		
		<div class="input-group">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">${requestScope.user.id}</button>
			</span>
			<input type="text" class="form-control" placeholder="댓글 내용을 입력해주세요">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">전송</button>
			</span>
		</div>
	</form>

</c:when>
<c:otherwise>

		<div class="TH_replyContents">
			<input type="text" class="form-control" placeholder="비회원은 작성하실 수 없습니다." disabled="disabled">
		</div>
테스트
	<form class="TH_replyContents" action="/add-comment.kr">		
		<div class="input-group">
			<span class="input-group-btn">
				<input type="button" class="btn btn-default" name="userid" value="${requestScope.user.id}">
			</span>
				<input type="text" class="form-control" name="replyContent" maxlength="1000" placeholder="댓글 내용을 입력해주세요">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">전송</button>
			</span>
		</div>
	</form>


</c:otherwise>
</c:choose>

</body>
</html>