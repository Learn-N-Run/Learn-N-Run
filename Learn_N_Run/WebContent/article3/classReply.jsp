<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<%--댓글 전체 div태그 --%>
	<div>			
		<%--상단 커뮤니티 및 글 작성 div태그 --%>
		<div>		
			<h3>
			커뮤니티
				<small>
					*개의 글 !
				</small>
			</h3>  
			<a href="classNewWrite.jsp" >글 작성하기</a>
		</div>
				<%--이름 및 작성일 --%>
		<div>
			<h3>유저 이름 !</h3>
			<h4>작성일 !</h4>
		</div>
		<%-- 글내용 --%>	
		<div>		
			content !!!!!!!!!!!!!!!!!!!!!!
		</div>
		<%--대댓글 전체 div태그 --%>
		<div>
			<%--대댓글 ? 작성자 와 날짜 ! --%>
			<div>
				<h4>유저 이름 과 작성일 !!!!</h4>
			</div>
			<%--대댓글 내용ㅇ!!!!!!!! --%>
			<div>
				<p>
					대댓글 내용입니다아!!!
				</p>
			</div>
		</div>
		<%--댓글 입력 textarea와 댓글전송버튼! --%>
		<div>
			<textarea rows="10" cols="100" placeholder="댓글을 입력 하세오 !"></textarea>
			<button type="submit">히욧</button>
		</div>
	</div>

</body>
</html>