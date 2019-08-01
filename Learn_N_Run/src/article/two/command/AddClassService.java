package article.two.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;


public class AddClassService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//HttpSession객체를 생성해서
		HttpSession session = request.getSession();
		//Session 안에 있는 id값을 가져오기
		String id = (String) session.getAttribute("id");
		
		//ClassDAOImpl, ClassDTO 객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		dao.addClass(id);
		
		System.out.println(id);
		forward.setPath("crt_addClass.jsp");
		forward.setRedirect(true);
		
		return forward;
		
	}

}
