package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;

public class SelectDetailMessageService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserDAIOImpl dao = new UserDAIOImpl();
		
		int messageNo =Integer.parseInt(request.getParameter("messageNo"));
		
		System.out.println(messageNo);
		dao.getMessageInfo(messageNo);
	}
}
