package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;

public class pwdCheck implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		UserDAIOImpl dao = new UserDAIOImpl();
		int result = dao.pwdCheck(id, pass);
		
		if (result == 0) {
			
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert<'비밀번호를 확인해주세요.'>;");
			out.println("</script>");
			System.out.println("pwdCheck() 불일치 : " + result);
			out.close();
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert<'변경할 비밀번호를 입력해주세요.'>;");
			out.println("</script>");
			System.out.println("pwdCheck() 일치 : " + result);
			out.close();
		}
		
		
	}
}
