<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/crt_addClass.css">
</head>
<body>

<!-- header 부분 -->
<jsp:include page="header.jsp"></jsp:include>

<div id="wrap"> <!-- 페이지 전체를 감싸는 div영역 -->

	
	<!--header밑에 상태bar가 있는 영역 -->
	<section id="sec01">
		<div class="sec01_div1">
			<div class="sec01_div1_1">
				<a href="form.jsp"><&nbsp;나의 클래스로 돌아가기</a>
				<h3>클래스 기본 정보 작성하기</h3>
				<div>
					<p>클래스의 기본 정보를 작성해 주세요.</p>
					<div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="sec01_div2">
			<div class="sec01_div2_1">
				<a href="crt_addClass.jsp" class="sec01_div2_1a">클래스 내용</a>
				<a href="crt_addCurri.jsp" class="sec01_div2_2a">커리큘럼</a>
				<a href="crt_upload.jsp" class="sec01_div2_3a">클래스 등록</a>
			</div>
		
		</div>
			
	</section>
</div>
</body>
</html>