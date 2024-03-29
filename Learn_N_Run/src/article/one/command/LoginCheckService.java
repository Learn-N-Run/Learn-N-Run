package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class LoginCheckService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String userid = request.getParameter("userid");
		String userpass = request.getParameter("userpass");
		UserDAIOImpl dao = new UserDAIOImpl();
		int result = dao.userCheck(userid, userpass);
		int group =	dao.getUserGroup(userid);
		UserDTO udto = dao.getUserInfo(userid);
		if(result==1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", userid);
			session.setAttribute("Group", group);
			session.setAttribute("name", udto.getName());
		}else{
			request.setAttribute("result", result);
		}
	}
}