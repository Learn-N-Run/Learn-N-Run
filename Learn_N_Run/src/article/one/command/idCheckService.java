package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;

public class idCheckService implements Service{
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		System.out.println("중복검사 할 id : " + id);
		
		UserDAIOImpl dao = new UserDAIOImpl();
		
		int result = dao.idCheck(id);
		System.out.println("중복검사 result값 : " + result);
		
		response.getWriter().print(result);
		
	}
}