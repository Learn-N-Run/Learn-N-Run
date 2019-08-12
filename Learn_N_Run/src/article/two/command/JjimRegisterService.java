package article.two.command;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		String userid = (String) session.getAttribute("id");
		
		int classno = Integer.parseInt(request.getParameter("no"));
		
		ClassDAOImpl dao = new ClassDAOImpl();
		
		int result = dao.jjimchk(userid, classno);
		
		Vector<JjimDTO> cv = null;
		
	
		
		if(result == 1) {
			
			
			cv = dao.selJjim(userid);
			
			request.setAttribute("cv", cv);
			
			System.out.println(result);
			
			forward.setPath("/article2/jjim.jsp");
			forward.setRedirect(false);
			
			return forward;
			
			
			
		}else {
		
		cv = dao.jjimRegister(userid, classno);
		
		request.setAttribute("cv", cv);
		
		System.out.println("---찜페이지----");
		
		System.out.println(userid);
		System.out.println(classno);
		System.out.println(result);
		
		forward.setPath("/article2/jjim.jsp");
		forward.setRedirect(false);
		
		return forward;
		
		}
		
		
	}
	

}
