package article.two.command;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.two.dao.ClassDAOImpl;
import dto.JjimDTO;

public class JjimRegisterService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		String userid = (String) session.getAttribute("userid");
		
		int classno = Integer.parseInt(request.getParameter("no"));
		
		ClassDAOImpl dao = new ClassDAOImpl();
		
		Vector<JjimDTO> cv = dao.jjimRegiter(userid, classno);
		
		request.setAttribute("cv", cv);
		
		
		forward.setPath("jjim.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	

}
