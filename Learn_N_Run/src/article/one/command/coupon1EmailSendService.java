package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;

public class coupon1EmailSendService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String receiver = request.getParameter("emailReceiver_h");
		String code_check = request.getParameter("code_check");
		
		UserDAIOImpl dao = new UserDAIOImpl();
		dao.sendMail(receiver, code_check);
	}
}
