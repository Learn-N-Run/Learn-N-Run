<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	function toggle(button)
	{
  		if(document.getElementById("1").value=="OFF"){
  			
  		 document.getElementById("1").value="ON";}

  		else if(document.getElementById("1").value=="ON"){
  			
  		 document.getElementById("1").value="OFF";}
	}
</script>
<body>

	<input type="button" id="1" value="ON" onclick="toggle(this)">

</body>
</html>