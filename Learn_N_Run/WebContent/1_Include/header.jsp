<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
<!-- <link rel="stylesheet" href="./css/style.css"> -->
<!-- <script src="./js/script.js"></script> -->
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
<script type="text/javascript">
	function show() {
		$(".list").slideToggle("normal");

	}
</script>
<style type="text/css">
header 
	padding: 10px;
	height: 120px;
}

header>div {
	float: left;
}

form>div {
	float: left;
	margin-left: 5px;
	margin-top: 30px;
}

header>section>span {
	float: right;
	margin-right: 10px;
	margin-top: 30px;
}

.logo {
	margin-top: 10px;
	width: 18%;
	height: 100px;
	background: url("img/large.png");
	background-repeat: no-repeat;
	background-size: 100% 50%;
}

.list {
	display: none;
}

.search {
	width: 400px;
}

.view>img {
	margin-top: 25px;
	margin-left: 8px;
	width: 50px;
	height: 42px;
	display: none;
}

@media ( max-width : 1280px) {
	#wrap {
		width: 100%;
	}
}

@media ( max-width : 968px) {
	#wrap {
		width: 100%;
	}
	.search {
		width: 380px;
	}
	header>section {
		float: left;
	}
	.logo {
		margin-top: 10px;
		background: url("img/small.png");
		background-repeat: no-repeat;
		background-size: 100% 50%;
	}
}

@media ( max-width : 724px) {
	#wrap {
		width: 100%;
	}
	.search {
		width: 280px;
	}
	header>section {
		display: none;
	}
	.view>img {
		display: block;
	}
}
</style>
<title></title>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="logo"></div>

			<div class="search">
				<form>
					<div style="width: 80%;">
						<input type="text" class="form-control" placeholder="카테고리 + 제목">
					</div>
					<div style="width: 10%;">
						<input type="submit" class="btn btn-default" value="검색">
					</div>
				</form>
			</div>

			<div class="view" style="float: right;">
				<img alt="" src="img/list.png" onclick="show()">
			</div>



			<section>
				<span class="btn btn-default"> <a>JOIN</a>
				</span> <span class="btn btn-default"> <a>LOGIN</a>
				</span>
			</section>

		</header>

		<div class="list">

			<span style="width: 100%;" class="form-control"><a href="#"
				style="text-decoration: none;">LOGIN</a></span> <span style="width: 100%;"
				class="form-control"><a href="#"
				style="text-decoration: none;">JOIN</a></span>

		</div>

	</div>
</body>
</html>