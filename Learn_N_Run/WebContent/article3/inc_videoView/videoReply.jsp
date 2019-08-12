<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--페이지인코딩 --%><%request.setCharacterEncoding("UTF-8"); %>
<%--프로젝트경로선언--%><c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width">
<!--외부참조(script.js, style.css) START LINE -->
	<link rel="stylesheet" href="${contextpath}/article3/css/style.css">
	<script src="${contextpath}/article3/js/script.js"></script>
<!--JQUERY(1EA), BOOTSTRAP(2EA) CDN START LINE-->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!--외부참조 + CDN END -->
	<title>Learn & Run</title>
</head>
<body>
<%--댓글 전체 div태그 --%>
       
      <%--상단 커뮤니티 및 글 작성 div태그 --%>
      <div>      
         <h3>
        댓글
            <small>
               *개
            </small>
           
         </h3>  
         
      </div>
            <%--이름 및 작성일 --%>
      
         <%-- 댓글입력 --%>
             <form action="ClassReplyUpdate.po" >
         <input type="text" name="content" placeholder="댓글을 입력 하세오 !">
         <button type="submit">버 튼 !</button>
      </form>
      <%-- 글내용 --%>
         <c:forEach var="cr" items="${requestScope.cr}">
         
         <p>${cr.reply_id}
         ${cr.date}
      
            <h4>${cr.content} </h4>
            
            
           <form action="ClassReplyDelete.po" >
           <input type="hidden" name="replyno" value="${cr.no}">
         <button type="submit">삭제</button>
      </form>
            </p>
        
      
         </c:forEach>
      
   



</body>
</html>