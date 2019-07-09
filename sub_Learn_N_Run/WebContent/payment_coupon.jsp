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
<title></title>
<body>
<script type="text/javascript">
	opener.document.getElementById("baseWindowLabel").innerText="new";
	window.close();
</script>

	<fieldset class="wrap600">
		<legend>내 쿠폰</legend>
		

		<table class="table table-hover" id="TH_coupon-list">
			<thead>
				<tr class="sr-only">
					<td>쿠폰이미지</td>
					<td>쿠폰설명</td>
					<td>선택</td>
				</tr>
			</thead>
			<tbody style="vertical-align: middle;">
				<tr>
					<td><img class="img-thumbnail" height="200px" src="img/coupon1.jpg"></td>
					<td>치킨 공짜</td>
					<td>
						<label class="btn btn-default">
							<input type="radio" name="coupon" value="여기에 할인값">
						</label>
					</td>
				</tr>
				<tr>
					<td><img class="img-thumbnail" height="200px" src="img/coupon2.jpg"></td>
					<td>죽빵 공짜</td>
					<td>
						<label class="btn btn-default">					
							<input type="radio" name="coupon" value="여기에 할인값">
						</label>
					</td>
				</tr>
			</tbody>
		</table>
	</fieldset>	
		


</body>
</html>