<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/crt_upload.css?bbbabb">
</head>
<body>
<!-- header 부분 -->
<jsp:include page="header.jsp"></jsp:include>
<div id="wrap">

  <section id="sec05">
 	<ul id="side_bar">
 			<label>카테고리 분류</label>
			<li class="list"><a>개인정보수정</a></li>
			<li class="list"><a>내클래스</a></li>
			<li class="list"><a>클래스수강목록</a></li>
			<li class="list"><a>찜목록</a></li>
			<li class="list"><a>쪽지함</a></li>
			<li class="list"><a>댓글관리</a></li>
			<li class="list"><a>로그아웃</a></li>
			<li class="list"><a>회원탈퇴</a></li>
			<li class="list"><a>쿠폰함</a></li>
		</ul>
 </section>
 
 <div id="wrap2">
	<!--header밑에 상태bar가 있는 영역 -->
	<section id="sec01">
		<div class="sec01_div1">
			<div class="sec01_div1_1">
				<a href="crt_classList.jsp"><&nbsp;나의 클래스로 돌아가기</a>
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
				<a hre="crt_upload.jsp" class="sec01_div2_3a">클래스 등록</a>
			</div>
		
		</div>
	</section>
	<!-- section1 끝나는 부분 --> 
 
	<form action="uploadAction.jsp" method="post">
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
							<label>강의 유효기간:</label>
							<input type="text" name="expiration"> 일간
							<div class="div_for_expiration_div">
							<b style="color: tomato;">(*Tip: </b>강의 유효기간은 <b style="color: tomato;">)</b>
							</div>
						</div>
						<div class="div_for_tuition">
							<label>희망 수강료:</label>
							<input type="text" name="tuition"> 원
							<div class="div_for_tuition_div">
							<b style="color: tomato;">(*Tip:</b>희망하시는 수강료를 기입해 주세요.<br>
							<b style="color: tomato;">)</b>
							</div>
						</div>
			
			
					</div>
				</div>
				<!-- 크리에이터 계좌정보 div -->
				<div id="div_for_right">
					
					<div class="div_for_subject_right">
				크리에이터 계좌정보
		</div>	
		
	<!-- 
		<div class="popheader">
	         <img src="img/small.png" class="poplogo"> <span>바로 결제창</span>
	    </div> -->
      	
      	<table class="bank_table_h">
         <tr>
            <td class="bank_h">예금주 명</td>
            <td><input type="text" required="required"></td>
         </tr>
         <tr>
            <td class="bank_h">은행</td>
            <td>
               <select required="required">
               	  <option>은행선택</option>
                  <option>부산은행</option>
                  <option>우리은행</option>
                  <option>기업은행</option>
                  <option>농협</option>
               </select>
            </td>
         </tr>
         <tr>
            <td class="bank_h">계좌번호</td>
            <td>
               <input type="text" required="required" id="account_number"> - <input type="password" required="required"> - <input type="text" required="required">
            </td>
         </tr>
         <tr>
            <td class="bank_h">유효기간</td>
            <td>
               <input type="date" required="required" width="150px">
            </td>
         </tr>
         <tr>
            <td class="bank_h">할부</td>
            <td>
               <select required="required">
                  <option>일시불</option>
                  <option>3개월</option>
                  <option>6개월</option>
                  <option>12개월</option>
               </select>
            </td>
         </tr>
      </table>
      <div class="popbtnwrap_h">
         <button type="button" class="popbtn1_h">결제 요청</button>  <button type="button" class="popbtn2_h">돌아가기</button>
      </div>
   </div>			
				
				</div>	
<!-- div_for_both 끝나는 부분 -->
			
			
		
		
		<div id="btn_submit">
			<a href="crt_addCurri.jsp"><input type="button" class="btn_pre1" value="Prev"></a>
			<input type="submit" class="btn_next1" value="Upload">
		</div>
		</section>
		<!--section02 끝나는 부분 -->
		
	</div>
	<!-- wrap2 끝나는 부분 -->
		
	
	
	
	</form>



</div>
	<!-- wrap2끝나는 부분 -->
</div>
<!-- wrap끝나는 부분 -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>