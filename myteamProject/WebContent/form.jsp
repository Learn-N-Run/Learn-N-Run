<%@page import="src01_ex01.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<%
		request.setCharacterEncoding("UTF-8");
	
		List memberList = new ArrayList();
		
		MemberBean m1 = new MemberBean("img/aaa.jpg", "축구를 위한 클래스");
		MemberBean m2 = new MemberBean("img/bbb.jpg", "우리가 살고 있는 여름");
		MemberBean m3 = new MemberBean("img/summer2.jpg", "날다 다시 날다.");
		MemberBean m4 = new MemberBean("img/winter1.jpg", "코딩 브로");
		MemberBean m5 = new MemberBean("img/section2.jpg", "호날두");
		MemberBean m6 = new MemberBean("img/section3.jpg", "르브론 제임스");
		MemberBean m7 = new MemberBean("img/photo8.jpg", "인생은 아름다워!");
		
		
		
		memberList.add(m1);
		memberList.add(m2);
		memberList.add(m3);
		memberList.add(m4);
		memberList.add(m5);
		memberList.add(m6);
		memberList.add(m7);
	
		
		request.setAttribute("memberList", memberList);
	%>
	
	<%-- member3.jsp로 포워딩 한다 --%>
		<jsp:forward page="crt_classList.jsp"/>

</head>
<body>

	 
	 
</body>
</html>