package article.two.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.two.dao.ClassDAOImpl;
import dto.JjimDTO;

public class JjimService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		String userid = (String) session.getAttribute("id");
		
		
		ClassDAOImpl dao = new ClassDAOImpl();
		
		
		
		Vector<JjimDTO> cv = null;
		
		cv = dao.selJjim(userid);
		
		request.setAttribute("cv", cv);
		
		
		
		
		System.out.println(userid);
		
		forward.setPath("jjim.jsp");
		forward.setRedirect(false);
		
		return forward;
		
	}

}
