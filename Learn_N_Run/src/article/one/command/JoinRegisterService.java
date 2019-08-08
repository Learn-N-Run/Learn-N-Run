package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class JoinRegisterService implements Service{

		@Override
		public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			String name = request.getParameter("name");
			String id = request.getParameter("id");
			String pass = request.getParameter("pwd");
			String email = request.getParameter("email");
					
			UserDAIOImpl dao = new UserDAIOImpl();
			UserDTO dto = new UserDTO();
			dto.setName(name);
			dto.setId(id);
			dto.setPass(pass);
			dto.setEmail(email);
					
			int result = dao.addUser(dto);
			
			PrintWriter out = response.getWriter();
			//가입 실패
			if(result == 0) {
				
				request.setAttribute("TH_navTitle", "회원 가입 실패");				
				request.setAttribute("TH_navContents", "회원 가입을 다시 시도해 주세요");
				
					out.println("<script>");
					out.println("history.back();");
					out.print("</script>");
                    out.close();
					
			}else {
				
				request.setAttribute("TH_navTitle", "회원 가입 완료");
				request.setAttribute("TH_navContents", "회원가입 되었습니다.");
					
				}
		}
}
