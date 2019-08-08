<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	
%>

<link rel="stylesheet" href="css/crt_upload.css?zs">
</head>
<body>
<!-- header 부분 -->
<jsp:include page="/1_Include/header.jsp" />
<div id="wrap">

    <section id="sec05">
 		
 	
 	</section>
 
 <div id="wrap2">
	<!--header밑에 상태bar가 있는 영역 -->
	<section id="sec01">
		<div class="sec01_div1">
			<div class="sec01_div1_1">
				<a href="crt_classList.jsp"> <&nbsp;나의 클래스로 돌아가기</a>
				<h3>3단계 : 클래스 등록하기</h3>
				<div>
					<p>수강료 및 크리에이터 계좌정보를 입력해 주세요.</p>
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
	<!-- section1 끝나는 부분 --> 
 
	<form action= "crt_upload.me"  method="post">
		<section id="sec02">
			
			<!-- 왼쪽, 오른쪽을 감싸는 div -->
			<div id="div_for_both">
				<!-- 강의기간, 수강료 div -->			
				<div id="div_for_left" >
					<div class="div_for_subject_left">
						강의기간 및 수강료
					</div>				
					<div class="div_for_tuition_left">
						<div class="div_for_expiration">
							<label>- 강의 유효기간:</label>
							<input type="text" name="expiration" style="text-align: right;"> 일간
							<div class="div_for_expiration_div">
							<b style="color: tomato; font-size: 15px;">*Tip: </b><b>강의 유효기간</b>은 수강 신청 일자로부터 수강 가능한 일수를 정하는 곳입니다.
							준비물 kit 배송일을 고려해서 입력해 주세요. 
							</div>
						</div>
						<div class="div_for_tuition">
							<label>- 희망 수강료:</label>
							<input type="text" name="tuition" style="text-align: right;"> 원
							<div class="div_for_tuition_div">
							<b style="color: tomato; font-size: 15px;">*Tip: </b> 희망하시는 수강료의 액수를 입력해 주세요.<br>
							<b>*강의 당 2~3만원으로 측정</b><br>
							준비물 kit를 포함한 가격을 입력해 주세요.
							
							</div>
						</div>
			
			
					</div>
				</div>
				<!-- 크리에이터 계좌정보 div -->
				<div id="div_for_right">
					
					<div class="div_for_subject_right">
					크리에이터 계좌정보
					</div>	
					
					<div class="div_for_account">
						<div>
							<label style="width: 120px; text-align: right;">- 이름:</label>
							<input type="text">
							
						</div>
						<div>
							<label style="width: 120px; text-align: right;">- 휴대폰 번호:</label>
							<input type="text">
						</div>
						
						<div>
							<label style="width: 120px; text-align: right;">- 은행정보:</label>
								<select required="required">
								  <option>은행선택</option>
				                  <option>부산은행</option>
				                  <option>우리은행</option>
				                  <option>기업은행</option>
				                  <option>농협</option>
	              				 </select>
						</div>
						<div>
							<label style="width: 120px; text-align: right;">- 계좌번호:</label>
							<input type="text">
						</div>
					</div>
   				
   				</div>			
				<!-- div_for_right 끝나는 부분 -->
				</div>	
<!-- div_for_both 끝나는 부분 -->
		
			
		
		
		<div id="btn_submit">
			<a href="crt_addCurri.jsp"><input type="button" class="btn_pre1" value="Prev"></a>
			<input type="submit" class="btn_next1" value="Upload">
		</div>
		
		<input type="hidden" name="classNo" value=<%=classNo%>>
		</section>
		<!--section02 끝나는 부분 -->
</form>		
	</div>
	<!-- wrap2 끝나는 부분 -->
		
	
	
	
	




	<!-- wrap2끝나는 부분 -->
</div>
<!-- wrap끝나는 부분 -->
<jsp:include page="/1_Include/footer.jsp"></jsp:include>

</body>
</html>