<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/crt_addCurri.css?a">
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
				<h3>커리큘럼 작성하기</h3>
				<div>
					<p>커리큘럼을 양식에 맞게 작성해 주세요.</p>
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



		<!-- section 2,3,4를 묶는 div영역 -->
	<div id="wrap2">
		
		<!-- 메뉴bar 들어가는 부분?! -->
		<section id="sec02">
		메뉴바(로그아웃, 내 정보 etc)
		</section>
		<!-- section01 끝나는 부분 -->
		
		
		<section id="sec03">
		
			<div>
				<form>
					<div>
					
					</div>
				
				
				</form>
			</div>
		</section>
		<!-- section03 끝나는 부분 -->
		
		
		
		<section id="sec04">
		준비물 kit 넣기
		</section>
		<!-- section 04 끝나는 부분 -->
	
	</div>
	
		<section id="sec05">
		
		</section>
		<!-- section5 끝나는 부분 -->
		
		
</div><!-- 전체 wrap이 끝나는 부분 -->



</body>
</html>