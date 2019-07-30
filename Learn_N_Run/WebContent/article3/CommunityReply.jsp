<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<link rel="stylesheet" href="./css/style.css">
<script src="./js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<title>Insert title here</title>
</head>
<body>

	<style>
	div{
		width:100%;
	}	
	
	.COco{
		text-align:left;
		display: block;
		clear:both;
		
	}
	.WWrite{
		background-color: rgb(27, 28, 29);
		color: white;
		float:right;
		width:auto;
		margin:0px;
		box-sizing:border-box;
		text-decoration: none;
		clear:both;
		
	}
	
	</style>

<div id="wrap">
			<%-- header--%>
		<c:import url="/1_Include/header.jsp"></c:import>
		<%--댓글 전체 div태그 --%>
	<div >			
		<%--상단 커뮤니티 및 글 작성 div태그 --%>
		<div>		
			<h3 class="COco">
			커뮤니티
				<small>
					*개의 글 !
				</small>
				<a href="classNewWrite.jsp" class="WWrite">글 작성하기</a>
			</h3>  
			
		</div>
				<%--이름 및 작성일 --%>
		<div style="clear:both";>
			<h3>유저 이름 !</h3>
			<h4>작성일 !</h4>
		</div>
		<%-- 글내용 --%>	
		<div>		
			content !!!!!!!!!!!!!!!!!!!!!!
		</div>
		<%-- 클래스 대댓글 전체 div태그 --%>
		<div>
			<%--클래스 대댓글 ? 작성자 와 날짜 ! --%>
			<div>
				<h4>유저 이름 과 작성일 !!!!</h4>
			</div>
			<%--클래스 대댓글 내용ㅇ!!!!!!!! --%>
			<div>
				<p>
					대댓글 내용입니다아!!!
				</p>
			</div>
		</div>
		<%--클래스대댓글 입력 textarea와 댓글전송버튼! --%>
		<form action="CommunityReply.do" name="ComuRe">
			<input type="text" placeholder="대댓글을 입력 하세오 !">
			<button type="submit">버 튼 !</button>
		</form>
	</div>
	<!-- 푸터 영역 -->
		<c:import url="/1_Include/footer.jsp"></c:import>
</div>
</body>
</html>