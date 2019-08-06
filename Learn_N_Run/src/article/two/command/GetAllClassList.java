package article.two.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;

public class GetAllClassList implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//세션에 있는 아이디값 받아오기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
	
		//DAO객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		Vector<ClassDTO> classList =  dao.getAllClassList(id);
		
				
	
		request.setAttribute("classList", classList);
		
		
		forward.setPath("/article2/crt_classList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

	
	
}
