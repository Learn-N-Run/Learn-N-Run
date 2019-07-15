<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 생성</title>
<link rel = "stylesheet" href = "css/crt_addClass.css">

<script type="text/javascript">

// 이미지 파일 첨부시 미리보기 기능을 구현하는 함수
function read_1(input){ // <input type = "file"> 태그 매개변수로 전달 받음
	console.debug(input);
	console.debug(input.files);
	
	//참고 :
	//<input type = "file">인 태그 객체의 files속성을 호출하면
	// fileList라는 배열이 생성되면서.. fileList배열의 내부의 0번째 인덱스 위치에
	// 아래에서 선택한 (업로드할) 파일 정보들을 key:value쌍으로 저장한
	// file객체가 저장되어 있음
	
	//fileList라는 배열이 존재하고..
	//fileList라는 배열의 0번째 인덱스 위치에 아래에서 파일 업로드 하기 위해
	// 선택한 file객체가 저장되어 있다면
	// ... 아래의 input type = "file" 태그가 업로드 하기위해 파일을 선택 했다면
	if(input.files && input.files[0]){
		// 동적으로 img 태그를 만들어 추가함
		$("#cover").html("<img src = '#' id = 'preview' width = 997 height = 500 />");
		
		// 파일을 읽어올 객체 생성
		var reader = new FileReader();
		
		// 지정한 이미지 태그에 첫번째 파일 input에 첨부한 파일에 대한 file객체의 내용을 읽어 드린다.
		
		reader.readAsDataURL(input.files[0]);
		
		reader.onload = function(ProgressEvent){
				console.debug(ProgressEvent)
				
				//id가 preview인 <img> 태그에 attr메소드를 이용해
				// 파일 첨부 시 미리보기 이미지를 나타내기 위해
				// src 속성에 new FileReader() 객체를 이용하여
				// 읽어들인 첨부할 file 객체 정보를 지정하여
				// 추가함으로서 이미지 파일의 미리보기 기능이 가능한 것이다.
				$('#preview').attr('src', ProgressEvent.target.result);
				
		}
	}
	
}
function read_2(input){ // <input type = "file"> 태그 매개변수로 전달 받음
	console.debug(input);
	console.debug(input.files);
	
	//참고 :
	//<input type = "file">인 태그 객체의 files속성을 호출하면
	// fileList라는 배열이 생성되면서.. fileList배열의 내부의 0번째 인덱스 위치에
	// 아래에서 선택한 (업로드할) 파일 정보들을 key:value쌍으로 저장한
	// file객체가 저장되어 있음
	
	//fileList라는 배열이 존재하고..
	//fileList라는 배열의 0번째 인덱스 위치에 아래에서 파일 업로드 하기 위해
	// 선택한 file객체가 저장되어 있다면
	// ... 아래의 input type = "file" 태그가 업로드 하기위해 파일을 선택 했다면
	if(input.files && input.files[0]){
		// 동적으로 img 태그를 만들어 추가함
		$("#item").html("<img src = '#' id = 'preview' width = 300 height = 200 />");
		
		// 파일을 읽어올 객체 생성
		var reader = new FileReader();
		
		// 지정한 이미지 태그에 첫번째 파일 input에 첨부한 파일에 대한 file객체의 내용을 읽어 드린다.
		
		reader.readAsDataURL(input.files[0]);
		
		reader.onload = function(ProgressEvent){
				console.debug(ProgressEvent)
				
				//id가 preview인 <img> 태그에 attr메소드를 이용해
				// 파일 첨부 시 미리보기 이미지를 나타내기 위해
				// src 속성에 new FileReader() 객체를 이용하여
				// 읽어들인 첨부할 file 객체 정보를 지정하여
				// 추가함으로서 이미지 파일의 미리보기 기능이 가능한 것이다.
				$('#preview').attr('src', ProgressEvent.target.result);
				
		}
	}
	
}
function com() {
	
	$("#cla_title").attr("readonly", "readonly");
}

</script>

</head>
<body>
<div id = "wrap">
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<section>
	
		<section id="sec01">
		<div class="sec01_div1">
			<div class="sec01_div1_1">
				<a href="form.jsp"><&nbsp;나의 클래스로 돌아가기</a>
				<h3>클래스 기본 정보 작성하기</h3>
				<div>
					<p>클래스의 기본 정보를 작성해 주세요.</p>
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
		
	
		<form action="">
		<table style= "margin: 30px auto; width: 78%;" >
		
			<tr>
				<td colspan = "2">클래스 커버 이미지 추가</td>
			</tr>
			<tr>
				<td id = "cover" width="1000" height="500" colspan = "2"><%-- 첨부할 다른 이미지 파일을 선택해서 변화가 일어나면 
						 readURL이라는 함수 호출시 변화가 일어난 input태그 전달
					 --%>
					<input type="file" name = "coverImg" onchange = "read_1(this)"></td>
			</tr>
			<tr>
				<td colspan = "2">
					
				</td>
			</tr>
			
			<tr>
				<td colspan = "2">클래스 제목 추가</td>
			</tr>
			<tr>
				<td colspan = "2"><input type="text" id = "cla_title"><input type="button" value = "ok" onclick="com()"></td>
			</tr>
			
			<tr>
				<td colspan = "2">클래스 카테고리 추가</td>
			</tr>
			<tr>
				<td colspan = "2">
					<select>
						<option disabled selected>카테고리를 선택해주세요</option>
						<option>운동</option>
						<option>켈리그라피</option>
						<option>공예</option>
						<option>디자인</option>
						<option>음악</option>
						<option>카메라, 영상</option>
						<option>그림</option>
						<option>요리</option>
					</select>
					<input type="button" value = "ok">
				</td>
			</tr>
			
			<tr>
				<td colspan = "2">클래스 상세 카테고리 추가
								  <br> ※키워드 2개
								  <br> 예) #something_A #somthing_B </td>
			</tr>			
			<tr>
				<td colspan = "2"><input type="text" placeholder="15자 이내로 간략하게 작성해주세요" style="width: 300px;"><input type="button" value = "ok"></td>
			</tr>
			
			<tr>
				<td colspan = "2">클래스 상세 정보 추가</td>
			</tr>
			<tr>
				<td colspan = "2"><input type="text" style="width: 300px;" ></td>
			</tr>
			
			<tr>
				<td colspan = "2">클래스 준비물 정보 추가</td>
			</tr>
			<tr>
				<td id = "item" width="300"  height="200"></td>
				<td width="700" height="200">
					<%-- 첨부할 다른 이미지 파일을 선택해서 변화가 일어나면 
						 readURL이라는 함수 호출시 변화가 일어난 input태그 전달
					 --%>
					<input type="file" name = "itemImg" onchange = "read_2(this)">
				</td>	
			</tr>
			
			<tr>
				<td colspan="2"><input type = "text" placeholder="준비물 pakage NAME" style="width: 300px;"><input type="button" value = "ok"></td>
			</tr>
			
			<tr align="right">
				<td colspan="2"><input type = "reset" value = "다시 작성">&nbsp;&nbsp;&nbsp;<input type = "submit" value = "다음 단계로"></td>
			</tr>
			
		</table>
		</form>
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
		
</div>
</body>
</html>