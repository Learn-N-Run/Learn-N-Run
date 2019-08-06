package article.two.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.two.dao.ClassDAOImpl;
import dto.CategoryDTO;
import dto.ClassDTO;



public class UpdateClassService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		
		String path = "D:\\메모장연습";
		

		int max = 1024*1024*100;
		
		MultipartRequest multi = new MultipartRequest(request, path, max, "UTF-8", new DefaultFileRenamePolicy());
		int classNo = Integer.parseInt(multi.getParameter("classNo"));
			
			
			//HttpSession객체를 생성해서
			HttpSession session = request.getSession();
			//Session 안에 있는 id값을 가져오기
			String id = (String) session.getAttribute("id");
			
			

						
			String cover_img =multi.getFilesystemName("cover_img");
			String title = multi.getParameter("title");
			int category = Integer.parseInt(multi.getParameter("category_no")) ;
			String detail_category = multi.getParameter("detail_category");
			String content = multi.getParameter("content");
			String material_img = multi.getFilesystemName("material_img");
			String material_content = multi.getParameter("material_content");
			
			
			ClassDTO cdto = new ClassDTO();
			
			CategoryDTO catedto = new CategoryDTO();
			catedto.setNo(category);
			
			cdto.setCover_img(cover_img);
			cdto.setTitle(title);
			cdto.setCategory(catedto);
			cdto.setDetail_category(detail_category);
			cdto.setContent(content);
			cdto.setMaterial_img(material_img);
			cdto.setMaterial_content(material_content);
			
			ClassDAOImpl cdao = new ClassDAOImpl();
			
			cdao.updateClass(cdto, id);
						
			forward.setPath("crt_addCurri.jsp?classNo="+classNo);
			forward.setRedirect(true);
			return forward;
	}

}
