package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;

public class DeleteMessageService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int messageNo = Integer.parseInt(request.getParameter("messageNo"));
		System.out.println(messageNo);
		UserDAIOImpl dao = new UserDAIOImpl();
		dao.delMessage(messageNo);
	}
}
