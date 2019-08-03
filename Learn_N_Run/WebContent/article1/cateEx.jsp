<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
</script>
<style>
.stage_h{
    height: 350px;
    width: 250px;
    position: fixed;
    top: 100px;
}
.p_h{
  display:block;
  font-size: 30px;
  text-align: center;
  margin-top: 0;
  cursor: pointer;
  width: 100%;
  background: gray;
  border-radius: 10px;
  font-family: Century Gothic;
  letter-spacing: 5px;
  color: white;
  text-decoration: none;
}
.div_h{
  margin-left: auto;
  margin-right: auto;
  border-radius: 10px;
  width: 200px;
  height: 40px;
  margin-top: 4%;
 transition-duration: 0.2s;

}
.p_h:hover{
  background: black;
  color: white;
  text-decoration: none;
}
.div_h:nth-child(odd){
  transform: perspective(300px) rotateY(45deg);
  box-shadow: -2px 2px 7px gray;
}
.div_h:nth-child(even){
  transform: perspective(300px) rotateY(-45deg);
    box-shadow: 2px 2px 7px gray;
}
.div_h:hover{
  transform: rotateY(0);
  box-shadow: 0px 0px 0px;
}
</style>
</head>
<body>
<section class="stage_h">
  <div class="div_h" id="about"><a href="#" class="p_h">내정보</a>
  </div>
  <div class="div_h" id="contact"><a href="#" class="p_h">로그아웃</a>
  </div>
  <div class="div_h" id="gallery"><a href="javascript:;" class="p_h" id="coupon_h">쿠폰함</a>
  </div>
  <div class="div_h" id="contact"><a href="getMyClassInfo.do" class="p_h">내 수강목록</a>
  </div>
  <div class="div_h" id="gallery"><a href="#" class="p_h">찜목록</a>
  </div>
  <div class="div_h" id="about"><a href="#" class="p_h">내 클래스</a>
  </div>
  <div class="div_h" id="about"><a href="/article1/signout.jsp" class="p_h">회원탈퇴</a>
  </div>
  <div class="div_h" id="about"><a href="logout.do" class="p_h">크리에이터 지원</a>
  </div>
</section>
	<jsp:include page="couponEx.jsp"></jsp:include>
</body>
</html>