<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="context"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css?ver=<%=System.currentTimeMillis()%>"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css?ver=<%=System.currentTimeMillis()%>"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet" href="css/style.css?ver=<%=System.currentTimeMillis()%>">
<title>결제 페이지</title>
</head>
<body>
<!-- 헤더영역(임시) -->
<c:import url="header.jsp"/>
<div class="TH_wrap">

<form action="" method="POST">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
		<div class="panel panel-default">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
					<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				  		사용자 정보 입력
					</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
				 <div class="panel-body">
				 	<div class="wrap600">
						<h2>배송정보</h2>
						<table class="table table-hover">
							<tbody>
								<tr>
									<td>
										<div class="control-label">
											받는사람
										</div>
									</td>
									<td>
										<input type="text" class="form-control" name="deli_name" placeholder="받는 사람">
									</td>
								</tr>
								<tr>
									<td>
										<div class="control-label">
											연락처
										</div>
									</td>
									<td>
						 				<input type="tel" class="form-control" name="deli_callnum" placeholder="연락처">
									</td>
								</tr>
								<tr>
									<td>
										<div class="control-label">
											배송 주소
										</div>
									</td>
									<td align="left">
<!-- 다음 주소 API -->
<input type="text" name="TH_addr1" class="form-control" style="max-width: 50%; display: inline;" width="auto" id="sample6_postcode" placeholder="우편번호">
<input class="btn btn-default" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
<input type="text" name="TH_addr2" class="form-control" id="sample6_address" placeholder="주소">
<input type="text" name="TH_addr3" class="form-control" id="sample6_detailAddress" placeholder="상세주소">
<input type="text" name="TH_addr4" class="form-control" id="sample6_extraAddress" placeholder="참고항목">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
									</td>
								</tr>
							</tbody>
						</table>
				 	</div>
				 </div>
			</div>
		</div>
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingTwo">
					<h4 class="panel-title">
						<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
						  결제 상세정보
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					<div class="panel-body">
							<h2>결제 정보 확인</h2>
							<table class="table table-hober">
								<thead>
									<tr>
										<td>
											<label class="control-label">결제 금액</label>
										</td>
										<td>
											<label class="control-label">쿠폰적용</label>
											<a href="payment_coupon.jsp?여기에값입력" target="_blank">
											<span class="glyphicon glyphicon-plus"></span>
											 </a>
										</td>
										<td>
											<label class="control-label">보유 크레딧</label>
										</td>
										<td>
											<label class="control-label">총 결제 금액</label>
										</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input type="text" class="form-control" name="beforepayment" placeholder="결제 금액">
										</td>
										<td>
											<div class="input-group">
												<span class="input-group-addon">-</span>
												<input type="text" class="form-control" name="coupon">
											</div>
										</td>
										<td>
											<div class="input-group">
												<span class="input-group-addon">-</span>
												<input type="text" class="form-control" name="credit" placeholder="남은 크레딧 : ">
											</div>
										</td>
										<td>
											<div class="input-group">
												<span class="input-group-addon">=</span>
												<input type="text" class="form-control" name="afterpayment" placeholder="총 결제 금액">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
					</div>
				</div>
			</div>
		</div>
			<input class="btn btn-primary" type="submit" value="결제">
	</form>
	
	
	
	

</div>
</body>
</html>