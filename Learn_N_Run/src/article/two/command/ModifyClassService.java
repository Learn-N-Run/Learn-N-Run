package article.two.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;
import dto.SubjectDTO;

public class ModifyClassService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			ActionForward forward = new ActionForward();
		
			//한글처리
			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
	
		// 1) 파일 업로드.		
		//cos.jar파일로 MultipartRequest 클래스 생성: 파일 업로드 담당하는 클래스
		//1. 업로드할 파일의 경로 지정
		String path = "D:\\메모장연습";
		//2. 업로드하는 파일의 최대 크기를 제한(300MB)
		int maxSize = 1024*1024*10;
		//3. 업로드할 파일의 이름이 한글 파일일 경우 encoding설정
		String encoding = "UTF-8";
		
		MultipartRequest multi = 
				new MultipartRequest(request, path, maxSize, encoding,
						new DefaultFileRenamePolicy());
		
		//classNO랑 curriCulumNo값을 받자
		int classNo = Integer.parseInt(multi.getParameter("classNo"));
		int curriNo = Integer.parseInt(multi.getParameter("curriNo"));
		
		//수정할 class테이블의 정보 얻기(cover_img, title, expiration, tuition, detail_category, material_content) 
		String title = multi.getParameter("title");
		int expiration = Integer.parseInt(multi.getParameter("expiration"));
		int tuition = Integer.parseInt(multi.getParameter("tuition"));
		String detail_category = multi.getParameter("detail_category");
		String material_content = multi.getParameter("material_content");
		String cover_img = multi.getFilesystemName("cover_img");
		System.out.println(cover_img);
				
		//위의 값들을 ClassDTO와 SubjectDO에 넣자
		ClassDTO classDTO = new ClassDTO();
		classDTO.setTitle(title);
		classDTO.setExpiration(expiration);
		classDTO.setTuition(tuition);
		classDTO.setDetail_category(detail_category);
		classDTO.setMaterial_content(material_content);
		
		//DAO객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		dao.ModifyClass(classDTO, classNo, curriNo);
		
		
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		out.println("<script>");
		out.println("alert('클래스가 수정 되었습니다.');");
		out.println("location.href='crt_getAllClassList.me';");
		out.println("</script>");
		out.close();
			
		return forward;
	}
	
	
}
