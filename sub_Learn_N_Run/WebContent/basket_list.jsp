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
<title>찜 목록</title>
</head>
<body>
<!-- 헤더영역(임시) -->
<c:import url="header.jsp"/>
<!-- 툴팁영역 + 쪽지함 모달 -->
	<div class="col-xs-2 visible-lg-inline">
	
		<c:import url="tooltip.jsp"/>
	</div>

	<div class="col-xs-10">
		<h1>찜 목록</h1>
		<table id="TH_basket-list" class="table table-hover table-condensed">
			<thead>
				<tr>
					<td>카테고리</td>
					<td class="sr-only">커버이미지</td>
					<td>제목</td>
					<td>수강신청일자</td>
					<td>강의유효기간</td>
					<td>구매</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>	
						문학
					</td>
					<td>
						<img class="img-thumbnail" width="150px" height="150px" src="img/persuade.jpg">
					</td>
					<td>
						상대방을 내편으로 만드는 설득의 기술
					</td>
					<td>
						<%=new SimpleDateFormat("YYYY-MM-dd hh:mm").format(System.currentTimeMillis()) %>
					</td>
					<td>
						<%=new SimpleDateFormat("YYYY-MM-dd hh:mm").format(System.currentTimeMillis()+500000000) %>
					</td>
					<td>
						<a href="payment.jsp">구매</a>
					</td>
				</tr>
				<tr>
					<td>	
						경제
					</td>
					<td>
						<img class="img-thumbnail" width="150px" height="150px" src="img/dirty.jpg">
					</td>
					<td>
						주식투자 이것만 따라하면 성공할 수 있다
					</td>
					<td>
						<%=new SimpleDateFormat("YYYY-MM-dd hh:mm").format(System.currentTimeMillis()) %>
					</td>
					<td>
						<%=new SimpleDateFormat("YYYY-MM-dd hh:mm").format(System.currentTimeMillis()+500000000) %>
					</td>
					<td>
						<a href="payment.jsp">구매</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	
	


</body>
</html>