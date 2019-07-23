package article.one.command;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;

public class JoinRegisterService {

		
		public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IoException {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pass = request.getParameter("pwd");
			String email = request.getParameter("email");
			UserDAIOImpl dao = new UserDAIOImpl();
			int result = dao.addUser(UserDTO dto);
			
			if(result == 1) {
				
			}
		}
}
