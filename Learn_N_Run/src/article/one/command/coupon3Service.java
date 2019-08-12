package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;

public class coupon3Service implements Service{
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		UserDAIOImpl dao = new UserDAIOImpl();
		int coupon3Register = dao.getCoupon3(id);
		
		request.setAttribute("coupon3Register", coupon3Register);
	}
}
