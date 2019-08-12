package article.two.command;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.SubjectDTO;

public class InsertCurriService implements Service {
	
	
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	// 1) 파일 업로드.		
		//cos.jar파일로 MultipartRequest 클래스 생성: 파일 업로드 담당하는 클래스
		//1. 업로드할 파일의 경로 지정
		String conpath = request.getContextPath();
		String path = "D:\\team3 dev tools\\workspace\\Learn_N_Run\\WebContent\\4_contents\\curr";
		//2. 업로드하는 파일의 최대 크기를 제한(100MB)
		int maxSize = 1024*1024*300;
		//3. 업로드할 파일의 이름이 한글 파일일 경우 encoding설정
		String encoding = "UTF-8";
		
		MultipartRequest multi = 
				new MultipartRequest(request, path, maxSize, encoding,
						new DefaultFileRenamePolicy());
		
// 2) 	
		//서버에 업로드된 파일의 "이름"을 저장할 ArrayList 객체 생성
	  	ArrayList saveFiles = new ArrayList();
      
	  //파일 업로드시 선택한 <input type="file">태그의 name속성값을 모두 얻어
		//Enumeration반복기에 담아
		//Enumeration반복기 역할을 하는 객체 자체를 리턴 받기
		Enumeration e = multi.getFileNames();
		
		String[] subject = multi.getParameterValues("subject");
		
		String thumbnail = null;
			
		while(e.hasMoreElements()){
			
			//업로드시 선택한 <input type="file">태그의 name속성값을 하나씩 꺼내어 얻기
			Object obj = e.nextElement();
			String filename = (String) obj;
			String realname = multi.getFilesystemName(filename);
			int pos = realname.lastIndexOf(".");
			String ext = realname.substring( pos + 1 );
			
			//서버에 실제로 업로드된 파일 이름을 하나씩 얻어 ArrayList에 담기
			if(ext.equals("jpg") || ext.equals("png")){
				
				thumbnail = realname;
			}else{
				
				saveFiles.add("/4_contents/curr/"+realname);
			}
			
			
			
		}//end if while
			
			Collections.reverse(saveFiles);
					
		
			
			ClassDAOImpl dao = new ClassDAOImpl();
			ClassDTO dto = new ClassDTO();
			CurriculumDTO curridto = new CurriculumDTO();
			SubjectDTO subdto = new SubjectDTO();
			
			String major_topic = multi.getParameter("major_topic");
			curridto.setMajor_topic(major_topic);
			curridto.setThumbnail("/4_contents/curr/"+thumbnail);
			dto.setNo(Integer.parseInt(multi.getParameter("classNo")));
		
		
			curridto.setClassinfo(dto);
			dao.insertCurriculum(saveFiles,subject,curridto);
			
			
			forward.setPath("crt_upload.jsp?classNo="+multi.getParameter("classNo"));
			forward.setRedirect(true);
		
			
			
			return forward;
     
}
	

}
