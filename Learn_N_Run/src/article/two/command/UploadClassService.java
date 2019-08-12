package article.two.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.txw2.Document;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;

public class UploadClassService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		//crt_upload.jsp에서 tuition과 expiration을 받아오긔
		int classNo= Integer.parseInt(request.getParameter("classNo"));
		int expiration = Integer.parseInt(request.getParameter("expiration"));		
		int tuition = Integer.parseInt(request.getParameter("tuition"));
		
		//ClassDTO객체를 생성하자
		ClassDTO dto  = new ClassDTO();
		//expiration값과 tuition값을 classDTO에 담자.
		dto.setNo(classNo);
		dto.setExpiration(expiration);
		dto.setTuition(tuition);
				
		//DAO객체를 생성하자.
		ClassDAOImpl dao = new ClassDAOImpl();
		//DAO객체를 생성해서 uploadClass메소드를 불러서 dto를 담아 보내긔.
		dao.uploadClass(dto);
				
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		out.println("<script>");
		out.println("alert('새로운 클래스가 생성 되었습니다.');");
		out.println("location.href='crt_getAllClassList.me';");
		out.println("</script>");
		out.close();
		
		
		return null;
	}

	
	
}
