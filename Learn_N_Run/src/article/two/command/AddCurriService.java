package article.two.command;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AddCurriService implements Service {

	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
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
		
// 2) 	
		
		//서버에서 실제로 업로드된 파일의 "이름"을 저장할 컬렉션 객체 생성
	  	ArrayList saveFiles = null;
	  	
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
			return forward;
     
}
	

}
