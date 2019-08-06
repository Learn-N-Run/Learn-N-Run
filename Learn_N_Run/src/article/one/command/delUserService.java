package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;

public class delUserService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
				
		String id = (String)session.getAttribute("id");
		String pass = request.getParameter("pwd");
		System.out.println("탈퇴할 id" + id);
		System.out.println("탈퇴할 pass" + pass);
		
		UserDAIOImpl dao = new UserDAIOImpl();
		int result = dao.delUser(id, pass);
		
		System.out.println("delUser() 결과" + result);
		
		if(result==1) {
			session.invalidate();
			
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('회원탈퇴가 완료되었습니다 이용해주셔서 감사합니다.');");
			out.println("location.href='mainEx.jsp';");
			out.print("</script>");

			System.out.println("회원탈퇴 성공");
			out.close();
		
			
		} else {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('회원탈퇴를 다시 시도해 주세요.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("회원탈퇴 실패");
			out.close();
		}
	}
	
}
