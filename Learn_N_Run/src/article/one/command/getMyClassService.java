package article.one.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;

public class getMyClassService implements Service{
	
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("getMyClassService connect");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		UserDAIOImpl dao = new UserDAIOImpl();
		List list = dao.getMyclassInfo(id);
		request.setAttribute("MyclassList",list);
		
	}
	
	
}
