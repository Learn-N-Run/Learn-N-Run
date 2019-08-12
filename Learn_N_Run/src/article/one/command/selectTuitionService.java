package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.ClassDTO;
import dto.CouponDTO;

public class selectTuitionService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int classno = Integer.parseInt(request.getParameter("classno"));
		
		UserDAIOImpl dao = new UserDAIOImpl();
		ClassDTO dto = dao.buyClass(classno);
		CouponDTO Cdto = dao.myCouponInfo(id);
		request.setAttribute("classno", classno); 
		request.setAttribute("tuition", dto.getTuition());
		request.setAttribute("sale1", Cdto.getSale1());
		request.setAttribute("sale2", Cdto.getSale2());
		request.setAttribute("sale3", Cdto.getSale3());
		
	}
}
