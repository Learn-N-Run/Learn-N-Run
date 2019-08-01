<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" href = "css/bootstrap.css">

<title>Learn & Run</title>

<style type="text/css">

	#wrap{

	 margin: 0 auto;

	 width: 1280px;

	}
	
	.introduce{
	
	height: 600px;
	background:  url("img/ccc.jpg");
	background-repeat: no-repeat;
	background-size: 100% 100%;
	}
	
 

@media (max-width: 1124px) {
	.introduce{
	 background-size: 100% 100%;
	}
	
}

 @media (max-width: 724px) {
	.introduce{
	 background-size: 100% 100%;
	}
	
}
	
</style>

</head>

<body>

<div id = "wrap">
	
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<section class= "introduce"></section>
	
	<jsp:include page="footer.jsp"></jsp:include>
		
</div>


	
</body>

</html>

