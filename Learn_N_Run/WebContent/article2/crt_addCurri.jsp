<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	int classNo = Integer.parseInt(request.getParameter("classNo"));
	
%>


<link rel="stylesheet" href="css/crt_addCurri.css?p">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

//JQuery를 이용해서 <input type="file">태그에서 미리보기 기능 구현하자.
		
function readIMAGE(input){ //input type="file"태그를 매개변수로 전달받아서
	if(input.files && input.files[0]){
		$('.thumbnail_preview').html("<img src='' id='preview'/>");

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
function readURL1(input,i){ //input type="file"태그를 매개변수로 전달받아서
	if(input.files && input.files[0]){
		$('#subject'+i+'_preview').html("<video controls src='' id='preview"+i+"'/>");
		
		//FileReader객체 생성
		var reader = new FileReader();
		//지정한 img태그에 File안에 있는 내용을 읽어 들인다.
		reader.readAsDataURL(input.files[0]);
		//파일을 모두 읽어 들였다면
		reader.onload = function(ProgressEvent){
			//읽어들인 File객체 정보는 매개변수로 넘어오는
			//ProgressEvent객체 내부의 target속성에 JSON데이터 형식으로 저장되어 있다.
			//또한 JSON객체 데이터 내부에는 result속성에 읽어들인 File정보가 저장되어 있다.
			$('#preview'+i+'').attr('src', ProgressEvent.target.result);
		}
	}
}
$(function(){
		var cnt = 3;
	$('#btn_chapter').click(function(){
		cnt= cnt+1;	
		var html=
		"<div class='sec03_subject1_div'>"+
		"<div class='subject1_label_div'>"+
 		"<label>소주제"+cnt+"</label></div>"+
 		"<div class='subject1_input_div'>"+
 		"<input type='text' name='subject' placeholder= ' 강의 제목을 입력하세요.'></div>"+
 		"<div class='subject1_preview' id='subject"+cnt+"_preview' align='center'>"+
 		"<label style='font-size: 60px;'>▶</label><br>동영상 강의를 업로드 해 주세요.</div>"+
 		"<div class='subject1_input_file'><input type='file' accept='video/*' name='url"+cnt+"' onchange='readURL1(this,"+cnt+")'></div></div>";
 				
		 $('.sec03_subject_div').append(html);
		 
		
	});
	
});

</script>


</head>
<body>
<!-- header 부분 -->

<jsp:include page="/1_Include/header.jsp" />

<div id="wrap">

 <section id="sec05">
 	
	
 </section>
 
 <!-- section1,2,3을 감싸는 wrap2 -->
 <div id="wrap2">
 
	 <section id="sec01">
	 	<div class="sec01_div1">
			<div class="sec01_div1_1">
				<a href="crt_classList.jsp"><&nbsp;나의 클래스로 돌아가기</a>
				<h3>2단계 : 커리큘럼 작성하기</h3>
				<div>
					<p>커리큘럼을 양식에 맞게 작성해 주세요.</p>
					<div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="sec01_div2">
			<div class="sec01_div2_1">
				<a href="crt_addClass.jsp" class="sec01_div2_1a">클래스 내용</a>
				<a href="crt_addCurri.jsp" class="sec01_div2_2a">커리큘럼</a>
				<a href="crt_upload.jsp" class="sec01_div2_3a">클래스 등록</a>
			</div>
		
		</div>
	 
	 
	 </section>

<form action="crt_addCurri.me" method="post" enctype="multipart/form-data">	 
	 
	 <section id="sec02">
	 	<div class="sec02_label_div">
	 		<label class="sec02_label" >커리큘럼 썸네일</label>
	 	</div>
	 		<div id="thumbnail_wrap">
	 			<div class="thumbnail_left">
	 				<div class="thumbnail_left_subject">
	 					커리큘럼의 <b style="color: tomato;">thumbnail</b>을 등록해 주세요.
	 				</div>
	 				<div class="thumbnail_left_content">
	 				나는 어떤 작업을 하는 크리에이터인지/ 어떤 클래스를 생각중인지/ 그동안 해<br>
	 				 온 작품에 대한 사진들로 간단하게 소개 페이지를 작성합니다.
					나의 클래스가<br> 수요가 있는지를 가볍게 확인하는 단계이며, 판매가 진행되는 단계는 아닙니다.
					<br>약 2주의 수요 데이터 확인 시간을 가지며, Learn&Run의 일정 기준에 따라 수요<br>
					가 충족되면 2단계로 진행합니다.<br><br>
					알림신청자를 대상으로 한 설문조사, 마케팅 성과 등을 종합하여 최종 컨셉/<br>
					 커리큘럼/ 패키지 구성 등을 기획하고 수강신청을 오픈합니다.
					이 때부터, 클래<br>스 판매가 시작됩니다.
					수강신청 추이를 1주일 간 확인하며, 일정 기준을 충족하<br>면 3단계 영상 촬영/편집 등 콘텐츠 작업에 들어갑니다.

	 				</div>
	 			</div>
	 			
	 			<div class="thumbnail_preview_wrap">
			 		<div class="thumbnail_preview" align="center">
			 			<label>Thumbnail 등록</label><br><br>
			 			<label style="font-size: 15px;">*이미지 크기: 가로 640px x 세로 480px	</label>
			 		</div>
			 		<div class="thumbnail_preview_input">
			 			<input type="file" accept="image/*" name="thumbnail" onchange="readIMAGE(this);">
			 		</div>
		 		</div>
	 		</div>
	  </section>
	 
	 <section id="sec03">
	 	<div class="sec03_label_div">
	 		<label class="sec03_label"> 동영상 강의 업로드</label>
	 	</div>

	 	<div class="sec03_major_topic_div">
	 		<label>강의 주제:</label>
	 		<input type="text" class="major_topic" name="major_topic">
	 	</div>
	 	
	 	<!-- 동영상 강의 업로드 -->
	 	
	 	<div class="sec03_subject_div">
	 	
	 		<div class="sec03_subject1_div">
	 			<div class="subject1_label_div">
	 				<label>소주제1</label>
	 			</div>
	 			<div class="subject1_input_div">
	 			<input type="text" name="subject" placeholder=" 강의 제목을 입력하세요.">
	 			</div>
	 			<div class="subject1_preview" id="subject1_preview" align="center">
		 			<label style="font-size: 60px;">▶</label><br>
		 			동영상 강의를 업로드 해 주세요.
		 			
	 			</div>
	 			<div class="subject1_input_file">
	 				<input type="file" multiple accept="video/*" name="url1" onchange="readURL1(this,1)">
	 			</div>
	 		</div>
	 		
	 		<div class="sec03_subject2_div">
	 			<div class="subject2_label_div">
	 				<label>소주제2</label>
	 			</div>
	 			<div class="subject2_input_div">
	 				<input type="text" name="subject" placeholder=" 강의 제목을 입력하세요.">
	 			</div>
	 			<div class="subject2_preview" id="subject2_preview" align="center">
	 				<label style="font-size: 60px;">▶</label><br>
	 				동영상 강의를 업로드 해 주세요.
	 			</div>
	 			<div class="subject2_input_file">
	 				<input type="file" multiple accept="video/*" name="url2" onchange="readURL1(this,2)">
	 			</div>
	 		</div>
	 		
			<div class="sec03_subject3_div">
	 			<div class="subject3_label_div">
	 				<label>소주제3</label>
	 			</div>
	 			<div class="subject3_input_div">
	 				<input type="text" name="subject" placeholder=" 강의 제목을 입력하세요.">
	 			</div>
	 			<div class="subject3_preview" id="subject3_preview" align="center">
	 				<label style="font-size: 60px;">▶</label><br>
	 				동영상 강의를 업로드 해 주세요.
	 			</div>
	 			<div class="subject3_input_file">
	 			<input type="file" multiple accept="video/*" name="url3" onchange="readURL1(this,3)">
	 			</div>
	 		</div>
	 	</div>		
	 
	
	 </section>
	 
	 <section id="sec04">
	 	<div class="btn_chapter_div" >
	 		<button type="button" class="btn_chapter" id="btn_chapter">+ 챕터 추가하기</button>
	 	</div>
	 </section>	 
	 <!-- section04 끝나는 부분 -->
	 
	 
	 <div id="btn_submit">
		<a href="crt_addClass.jsp"><input type="button" class="btn_pre1" value="Prev"></a>
		<input type="submit" class="btn_next1" value="Next">
	</div>
	
	<input type="hidden" name="classNo" value=<%=classNo%>>
	
</form>	  

</div>
	 <!-- wrap2끝나는 부분 -->
</div>
 <!-- wrap끝나는 부분 -->
 <jsp:include page="/1_Include/fincate.jsp"></jsp:include>
<jsp:include page="/1_Include/footer.jsp"></jsp:include>
</body>
</html>