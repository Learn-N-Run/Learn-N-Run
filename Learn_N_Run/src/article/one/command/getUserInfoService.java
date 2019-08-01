package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class getUserInfoService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		UserDAIOImpl dao = new UserDAIOImpl();
		UserDTO dto = dao.getUserInfo(id);
		request.setAttribute("user", dto);
	}
	
}
