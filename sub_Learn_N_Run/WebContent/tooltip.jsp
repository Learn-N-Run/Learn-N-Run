<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.xml.crypto.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%request.setCharacterEncoding("UTF-8");%>
<c:set var="context"  value="${pageContext.request.contextPath}"/>
<body>
	<span id="TH_tooltip">
		<ul>
			<li onclick="location.href='course_list.jsp'">클래스 수강목록</li>
			<li onclick="location.href='basket_list.jsp'">찜 목록</li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li data-toggle="modal" data-target=".classList-modal-lg">쪽지함(공용)</li>
		</ul>
	</span>
	
	<!-- 쪽지함 MODAL -->
	<div class="modal fade classList-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
		<div class="modal-content">
	    	<div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="TH_myModalLabel">쪽지함</h4>
	     	</div>
			<div class="modal-body" align="center">
				<table id="TH_message" class="table table-hover table-condensed"
				 style="text-align: center;">
					<thead>
						<tr>
							<td>발송자</td>
							<td>제목</td>
							<td>보낸시간</td>
							<td>읽음/안읽음</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>홍길동</td>
							<td>금융감독원입니다. 지금 당신의 계좌에서 현금 2억을 이체..</td>
							<td><%=new SimpleDateFormat("YYYY-MM-dd").format(System.currentTimeMillis()) %></td>
							<td>읽음</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>최신핸드폰 비와이2폰으로 바꾸세요</td>
							<td><%=new SimpleDateFormat("YYYY-MM-dd").format(System.currentTimeMillis()-500000000) %></td>
							<td>읽음</td>
						</tr>
						<tr>
							<td>홍길동</td>
							<td>무이자 대출 안내드립니다.</td>
							<td><%=new SimpleDateFormat("YYYY-MM-dd").format(System.currentTimeMillis()-1000000000) %></td>
							<td>읽음</td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	  </div>
	</div>
</body>