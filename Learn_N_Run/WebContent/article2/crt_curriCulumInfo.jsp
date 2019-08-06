<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/crt_curriCulumInfo.css?ab">
<title>Insert title here</title>

</head>

<body>
<!-- header 부분 -->
<jsp:include page="/1_Include/header.jsp" />

<!-- side바 부분 -->


<wrap id=wrap01>
	<section id="sec01">
		<div class="title">
			<b style="color: tomato; font-size: 30px; padding-top: 20px; margin-left: 20px;">클래스명</b><label style="font-size: 30px; padding-top: 20px; margin-left: 25px;">${classDto.title }</label> 
		</div>
		
		<!-- 왼쪽, 오른쪽 div -->
		<div id="class_left_right">
			<!-- 이미지 -->
			<div class="cover_img_left">
				<div class="cover_img"><img src="upload/${classDto.cover_img }" alt="이것도 못 불러오냐?"></img></div>
			</div>
			<div class="tuition_right">
				<div class="tuition_right_up">	
					
					<div class="expiration_both" align="center">
						<div class="expiration_label">
							<label>강의 기간</label>
						</div> 
						<div class="expiration_div"><label style="color: tomato; font-size: 15px;"><input type="text" name="expiration" value="${classDto.expiration }"></label><b>일</b></div>
					</div>
					
					<div class="tuition_both"  align="center">
						<div class="tuition_label">
							<label>강의료</label>
						</div> 
						<div class="tuition_div"><label style="color: tomato; font-size: 15px;">${classDto.tuition }</label><b>원</b></div>
					</div>
					<div class="category_both" align="center">
						<div class="category_label">
						<label>카테고리</label>
						</div> 
						<div class="category_div"><label style="color: tomato; font-size: 15px;">${classDto.detail_category }</label></div>
					</div>
					<div class="content_both" align="center">
						<div class="content_label" >
						<label>강의 내용</label>
						</div> 
						<div class="content_div">${classDto.content }</div>
					</div>
				</div>
				
				<!-- 준비물쪽 -->
				<div class="tuition_right_down">
					<div class="img_left_div">
						<div class="img_div"><img src="upload/${classDto.material_img }"></img></div>
					</div>
					<div class="img_right_div" align="center">
						<div class="material_label"><label>준비물 kit</label></div>
						<div class="material_div"><label style="color: tomato; font-size: 15px;">${classDto.material_content }</label></div>
					</div>	
				</div>	
										
				
			</div>
			
		
		</div>
		
	
	</section>

	<section id="sec02">
		<div class="video">
			<label style="font-size: 30px; padding-top: 20px; color:tomato; margin-left: 20px; font-weight: bold; ">동영상 강의</label> 
		</div>
		
		<div id="div_for_video">
			
		
		</div>	
	</section>

</wrap>







<!-- footer부분 -->
<jsp:include page="/1_Include/fincate.jsp"></jsp:include>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>