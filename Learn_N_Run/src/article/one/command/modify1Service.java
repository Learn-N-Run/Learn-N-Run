package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class modify1Service implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		UserDTO dto = new UserDTO();
		dto.setEmail(request.getParameter("email"));
		dto.setPass(request.getParameter("newpwd"));
		
		UserDAIOImpl dao = new UserDAIOImpl();
		dao.updateUser(dto);
	}
}
