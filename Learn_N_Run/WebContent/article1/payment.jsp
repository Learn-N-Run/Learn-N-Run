<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--페이지인코딩 --%>
<%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%>
<c:set var="contextpath" value="${pageContext.request.contextPath}" />
<c:set var="classNo" value="${param.classno }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<script src="./js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<script>
	$(function() {
		$("#coupon_submit_h").click(function() {
			$(".coupon_modal_h").fadeIn();
			$("#couponNo").fadeIn();
		});
		
		var sale = $("#couponNo").val();
		var result = 10000-sale;
		alert(result);
		
		$("#remove_coupon_submit").click(function() {
			$("#couponNo").val('').css("display","none");
			$(".coupon_modal_h").fadeOut();
		});
	});
	
	  function popup(){
          var url = "popup.html";
          var name = "popup test";
          var option = "width = 500, height = 500, top = 100, left = 200, location = no"
          window.open(url, name, option);
      }

	function coupon1_submit1() {
		if(${requestScope.sale1} == 0 ){
			alert("보유하신 쿠폰이 없습니다.");
		}else{
			$("input[name=couponNo]").val(5000);
			$(".coupon_modal_h").css("display","none");
		}
	}
	
	function coupon1_submit2() {
		if(${requestScope.sale2}==0){
			alert("보유하신 쿠폰이 없습니다.");
		}else{
			$("input[name=couponNo]").val(7000);
			$(".coupon_modal_h").css("display","none");
		   	}
		}
	
	function coupon1_submit3() {
		if(${requestScope.sale3}==0){
			alert("보유하신 쿠폰이 없습니다.");
		}else{
			$("input[name=couponNo]").val(10000);
			$(".coupon_modal_h").css("display","none");
		}
			}
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<title></title>
<style>
#wrap {
	width: 1200px;
	margin: 0 auto;
}

#center {
	
}

.content_h {
	max-width: 800px;
	margin: 0 auto;
	height: 1050px;
	border: 0.3px solid gray;
}

.title_h {
	height: 100px;
	padding: 30px 20px 10px 30px;
	background-color: black;
}

.title_h>p {
	font-size: 30px;
	color: white;
}

.content_wrap_h .deliver_h {
	height: 550px;
	border-bottom: 0.5px solid lightgray;
}

.deliver_h>h4 {
	font-size: 25px;
	font-weight: 700;
	margin-bottom: 20px;
}

.deliver_h p {
	margin-bottom: 0;
}

.content_wrap_h {
	padding: 30px 30px 30px 30px;
}

.tuition_h {
	height: 190px;
	border-bottom: 0.5px solid lightgray;
}

.deliver_h .section_h {
	margin: 20px 10px 20px 10px;
	font-size: 17px;
}

.deliver_h .section_h input {
	width: 100%;
	height: 40px;
	padding: 5px 5px 5px 15px;
}

.tuition_h>h4 {
	font-size: 25px;
	font-weight: 700;
	margin-top: 40px;
	margin-bottom: 10px;
}

.tuition_h table {
	width: 100%;
}

.tuition_h tr {
	margin-top: 10px;
}

.tuition_h th {
	width: 40%;
	font-size: 17px;
	text-align: left;
	padding: 7px 7px 7px 7px;
	font-weight: 500;
}

.tuition_h td {
	width: 40%;
	font-size: 17px;
	text-align: right;
	padding: 7px 7px 7px 7px;
	font-weight: 500;
}

.table_h {
	margin: 15px 30px 30px 30px;
}

.last_pay {
	margin: 20px 20px 20px 20px
}

.last_pay button {
	width: 100%;
	height: 50px;
	background-color: black;
	color: white;
	font-size: 20px;
}

.ex_h {
	color: gray;
	font-size: 15px;
}

#sample6_postcode {
	margin-bottom: 10px;
	width: 30%;
}

#postCode_h {
	margin-bottom: 10px;
	width: 23%;
}

#sample6_address {
	margin-bottom: 10px;
	width: 98%;
}

#sample6_detailAddress {
	margin-bottom: 10px;
	width: 49%;
}

#sample6_extraAddress {
	margin-bottom: 10px;
	width: 49%;
}

.coupon_modal_h {
	background-color: white;
	position: fixed;
	display: none;
	z-index: 1;
	overflow: hidden;
	left: 0;
	top: 0;
	width: 300px;
	height: 310px;
	-webkit-border-radius: 3px;
	-webkit-box-shadow: 0px 0px 20px #999;
	left: 40%;
	top: 40%;
}

.coupon_title_h {
	width: 100%;
	height: 40px;
	text-align: center;
	font-size: 20px;
	font-weight: 700;
	border-bottom: 0.5px solid lightgray;
	background-color: black;
	color: white;
	line-height: 40px;
}

.coupon_modal_h table {
	border: 0.3px solid lightgray;
	width: 100%;
}

.coupon_modal_h tr {
	padding: 5px 5px 5px 10px;
}

.coupon_modal_h th {
	width: 70%;
	height: 90px;
	background-color: black;
}

.coupon_modal_h td {
	font-size: 20px;
	font-weight: 700;
	text-align: center;
}

.coupon_bottom_h {
	line-height: 40px;
	text-align: center;
	font-size: 20px;
	font-weight: 700;
}

.coupon1 {
	background: url("img/5000coupon.png");
	background-size: 100% 100%;
}

.coupon2 {
	background: url("img/7000coupon.png");
	background-size: 100% 100%;
}

.coupon3 {
	background: url("img/10000coupon.png");
	background-size: 100% 100%;
}

#couponNo {
	text-align: right;
	display: none;
	width: 100px;
}
</style>
</head>
<body>
	<div id="wrap">
		<jsp:include page="/1_Include/header.jsp" />
		<div id="center">
			<div class="content_h">
				<!-- content 제목 부분 -->
				<div class="title_h">
					<p>결제 하기</p>
				</div>

				<div class="content_wrap_h">
					<form action="buyersubmit.do?classNo=${classNo }" method="post">
						<!-- 배송 정보 입력창 부분 -->
						<section class="deliver_h">
							<h4>배송 정보</h4>
							<div class="section_h">
								<p>받으시는 분</p>
								<input type="text" name="receiver_name_h" width="100%">
							</div>
							<div class="section_h">
								<p>받으시는 분 번호</p>
								<input type="text" name="receiver_number_h" width="100%">
							</div>
							<div class="section_h">
								<p>배송 주소</p>
								<input type="text" id="sample6_postcode" name="address1" placeholder="우편번호">
								<input type="button" id="postCode_h" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample6_address" name="address2" placeholder="주소"><br> 
								<input type="text" id="sample6_detailAddress" name="address3" placeholder="상세주소">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목">
							</div>
							<div class="section_h">
								<p>배송 시 남기실 말</p>
								<p class="ex_h">예) 물건을 경비실에 맡겨주세요, 빠른배송 부탁드리겠습니다</p>
								<textarea rows="3" cols="80%" name="content"></textarea>
							</div>
						</section>
	
						<section class="tuition_h">
							<h4>결제 정보</h4>
							<div class="table_h">
								<table>
									<tbody>
										<tr>
											<th>총 상품 금액</th>
											<td>${requestScope.tuition}원</td>
										</tr>
										<tr>
											<th>쿠폰 적용하기</th>
											<td class="coupon_submit">
												<button type="button" id="coupon_submit_h">적용</button>
												<button type="button" id="remove_coupon_submit">미적용</button>
												<input type="text" id="couponNo" name="couponNo">
											</td>
	
										</tr>
										<tr>
											<th>최종 가격</th>
											<td class="last_tuition"><input type="text" name="last_tuition">원</td>
										</tr>
										<a href="javascript:popup()" target="_blank">결제 정보</a>
									</tbody>
								</table>
							</div>
						</section>
						<div class="last_pay">
							<button type="submit">결제 하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	<div class="coupon_modal_h">
		<div class="coupon_title_h">내 쿠폰 보유 현황</div>
		<table>
			<tr>
				<th class="coupon1"></th>
				<td><p>${requestScope.sale1 }</p>
					<button onclick="coupon1_submit1()">적용</button></td>
			</tr>
			<tr>
				<th class="coupon2"></th>
				<td><p>${requestScope.sale2 }</p>
					<button onclick="coupon1_submit2()">적용</button></td>
			</tr>
			<tr>
				<th class="coupon3"></th>
				<td><p>${requestScope.sale3 }</p>
					<button onclick="coupon1_submit3()">적용</button></td>
			</tr>
		</table>
	</div>
</body>
</html>