package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import article.one.dao.UserDAIOImpl;
import dto.CouponDTO;

public class selectCouponCountService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserDAIOImpl dao = new UserDAIOImpl();
		CouponDTO dto = dao.myCouponInfo(id);

		
		JSONObject obj = new JSONObject();
		obj.put("sale1", dto.getSale1());
		obj.put("sale2",dto.getSale2());
		obj.put("sale3", dto.getSale3());
		
		PrintWriter out = response.getWriter();
		out.println(obj.toJSONString());
		out.flush();
		out.close();
	}
}
