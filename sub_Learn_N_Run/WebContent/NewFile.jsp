<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js?ver=<%=System.currentTimeMillis()%>"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title></title>
</head>

<body>

	<form action="dfnkd.me" method="get">
		<input type="text" name="name">
		<input type="text">
		<input type="text">
		<input type="text">
		<input type="text">
	</form>
	
	<p> </p>
	
	@WebServlet("dfnkd.me")
	controller 
		UserDTO dto = new UserDTO;
		dto.setName(request.getParameter("name"));
		.........
		UserDAO dao = new UserDAO;
		dao.addUser(dto);
		
		
		Stirng path = "";
		
		-
		-
		-
		-
		
		adduser();
		
		int no;
		UserDTO user;
		
		Receiver_infoDTO receiver_info;
		int last_tuition;
		Timestamp order_date;
		ClassDTO class_no;
		
		
		
		path = "enfkef.jsp"
		RequestDispather dispather = Request.getrequestdispacher(path);
		dispather.forward(request,response);
			
		request.forward()
		sendredirect("enfkef.jsp");
		
	
</body>
</html>