package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;

public class coupon1RegisterService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserDAIOImpl dao = new UserDAIOImpl();
		int coupon1Register = dao.getCoupon1(id);
		request.setAttribute("coupon1Register", coupon1Register);
	}
}
