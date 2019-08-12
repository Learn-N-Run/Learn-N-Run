<%@page import="java.io.File"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
<title>Insert title here</title>
</head>
<body>
   <% 
   
   //한글처리
      request.setCharacterEncoding("UTF-8");
      response.setContentType("UTF-8");
   
   // 1) 파일 업로드.      
      //cos.jar파일로 MultipartRequest 클래스 생성: 파일 업로드 담당하는 클래스
      //1. 업로드할 파일의 경로 지정
      
      String path = "D:\\workspace_jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Learn_N_Run\\article2\\upload";
      //2. 업로드하는 파일의 최대 크기를 제한(100MB)
      int maxSize = 1024*1024*100;
      //3. 업로드할 파일의 이름이 한글 파일일 경우 encoding설정
      String encoding = "UTF-8";
      
      MultipartRequest multi = 
            new MultipartRequest(request, path, maxSize, encoding,
                  new DefaultFileRenamePolicy());
      
      
	  	//서버에서 실제로 업로드된 파일의 "이름"을 저장할 컬렉션 객체 생성
	  	List saveFiles = null;
	  	
	  	//클라이언트가 업로드된 파일의 원본이름 하나하나씩 담을 컬렉션 객체 생성
	  
      
	  //파일 업로드시 선택한 <input type="file">태그의 name속성값을 모두 얻어
		//Enumeration반복기에 담아
		//Enumeration반복기 역할을 하는 객체 자체를 리턴 받기
		Enumeration e = multi.getFileNames();
		
		while(e.hasMoreElements()){
			saveFiles = new ArrayList();
			//업로드시 선택한 <input type="file">태그의 name속성값을 하나씩 꺼내어 얻기
			Object obj = e.nextElement();
			String filename = (String) obj;
			
			//서버에 실제로 업로드된 파일 이름을 하나씩 얻어 ArrayList에 담기
			saveFiles.add(multi.getFilesystemName(filename));
			
			//클라이언트가 업로드한 파일의 원본이름을 하나씩 얻어 ArrayList에 담기
		
		
			for(int i=0; i<saveFiles.size(); i++){
				System.out.println(saveFiles.get(i));
			}
			
			
		}
         
      %>
   
</body>
</html>