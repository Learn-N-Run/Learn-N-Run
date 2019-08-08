<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int classNo = Integer.parseInt(request.getAttribute("classNo").toString());
	int curriNo = Integer.parseInt(request.getAttribute("curriNo").toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/crt_curriCulumInfo.css?abgd">
<script src="//code.jquery.com/jquery.min.js"></script>

<script type="text/javascript">
//JQuery를 이용해서 <input type="file">태그에서 미리보기 기능 구현하자.
		
function readIMAGE(input){ //input type="file"태그를 매개변수로 전달받아서
	if(input.files && input.files[0]){
		$('.cover_img').html("<img src='' id='preview'/>");

		//FileReader객체 생성
		var reader = new FileReader();
		//지정한 img태그에 File안에 있는 내용을 읽어 들인다.
		reader.readAsDataURL(input.files[0]);
		//파일을 모두 읽어 들였다면
		reader.onload = function(ProgressEvent){
			//읽어들인 File객체 정보는 매개변수로 넘어오는
			//ProgressEvent객체 내부의 target속성에 JSON데이터 형식으로 저장되어 있다.
			//또한 JSON객체 데이터 내부에는 result속성에 읽어들인 File정보가 저장되어 있다.
			$('#preview').attr('src', ProgressEvent.target.result);
		}
	}
	
}
</script>
<title>Insert title here</title>
</head>
<body>
<c:set var="curriNo" value="${classNo}"></c:set>
<c:set var="classNo" value=""></c:set>
<!-- header 부분 -->
<jsp:include page="/1_Include/header.jsp"></jsp:include>

<wrap id=wrap01>
	<form action="crt_modifyClass.me" method="post" enctype="multipart/form-data">
	<section id="sec01">
		<div class="title">
			<b style="color: tomato; font-size: 30px; padding-top: 20px; margin-left: 20px;">클래스명</b><label style="font-size: 30px; padding-top: 20px; margin-left: 25px;"><input type="text" name="title" value="${classDto.title }" style="padding-left: 10px; width: 1100px;"></label> 
		</div>
		
		<!-- 왼쪽, 오른쪽 div -->
		<div id="class_left_right">
			<!-- 이미지 -->
			<div class="cover_img_left">
				<div class="cover_img"><img src="upload/${classDto.cover_img }"></img></div>
				<div class="cover_img_input"><%-- <input type="file" name="cover_img" accept="image/*" onchange="readIMAGE(this);" value="${classDto.cover_img }"> --%></div>
			</div>
			<div class="tuition_right">
				<div class="tuition_right_up">	
					
					<div class="expiration_both" align="center">
						<div class="expiration_label">
							<label>강의 기간</label>
						</div> 
						<div class="expiration_div"><label style="color: black; font-size: 15px;"><input type="text" name="expiration" value="${classDto.expiration }" style="text-align: center; width: 80px;"></label><b>일</b></div>
					</div>
					
					<div class="tuition_both"  align="center">
						<div class="tuition_label">
							<label>강의료</label>
						</div> 
						<div class="tuition_div"><label style="color: black; font-size: 15px;"><input type="text" name="tuition" value="${classDto.tuition }" style="text-align: center; width: 90px; "></label><b>원</b></div>
					</div>
					<div class="category_both" align="center">
						<div class="category_label">
						<label>카테고리</label>
						</div> 
						<div class="category_div"><label style="color: black; font-size: 15px;"><input type="text" name="detail_category" value="${classDto.detail_category }" style="text-align: center; width: 250px;"></label></div>
					</div>
					<div class="content_both">
						<div class="content_label"  align="center">
						<label>강의 내용</label>
						</div> 
						<div class="content_div"><label style="color: black; font-size: 15px; padding-left: 3px;" >${classDto.content }</label></div>
					</div>
				</div>
				
				<!-- 준비물쪽 -->
				<div class="tuition_right_down">
					<div class="img_left_div">
						<div class="img_div"><img src="upload/${classDto.material_img }"></img></div>
					</div>
					<div class="img_right_div" align="center">
						<div class="material_label"><label>준비물</label></div>
						<div class="material_div"><label style="color: black; font-size: 15px;"><input type="text" name="material_content" value="${classDto.material_content }" style="text-align: center; height: 60px;"></label></div>
					</div>	
				</div>	
										
				
			</div>
			
		
		</div>
		
	
	</section>

	<section id="sec02">
		<div class="video">
			<label style="font-size: 30px; padding-top: 20px; color:tomato; margin-left: 20px; font-weight: bold; ">업로드한 동영상 강의</label> 
		</div>
		
		
		<div class="div_for_video">
			<c:forEach var = "v" items="${requestScope.v}" varStatus="i" >
				<div class="for_video">
					
		 			<div class="subject_div">
		 				<label style="width: 20%; height: 90%; font-size: 15px; text-align: center; color: tomato;">주제 ${i.count}</label><input type="text" name="subject" value="${v.subject }" readonly="readonly" style="width: 80%; font-size:16px; height: 99%; padding-left: 10px; color: black;" >
		 			</div>
		 			<div class="video_preview" id="video_preview">
			 				<video controls src="upload/${v.url }"></video>
			 					 			
		 			
		 				
		 			</div>
		 			
		 		</div>
			</c:forEach>
		
		</div>	
		
	</section>
	
	<div id="btn_submit">
		<input type="reset" class="btn_pre1" value="취소">
		<input type="submit" class="btn_next1" value="수정하기">
	</div>
	
	
	
	<input type="hidden" name="classNo" value=<%=classNo%>>
	<input type="hidden" name="curriNo" value=<%=curriNo%>>
	
	</form>
</wrap>







<!-- footer부분 -->
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>