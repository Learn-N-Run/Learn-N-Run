package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InsertbuyClassService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		request.getParameter("receiver_name_h");
		request.getParameter("receiver_number_h");
		request.getParameter("address1");
		request.getParameter("address2");
		request.getParameter("address3");
		request.getParameter("content");
		
	}
}
