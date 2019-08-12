package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class updateUser implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//세션값 ID받아오기
		HttpSession session =  request.getSession();
		String id = (String)session.getAttribute("id");
		
		//DTO 객체 생성 후
		UserDTO dto = new UserDTO();
		
		//값 세팅
		dto.setId(id);
		dto.setEmail(request.getParameter("email"));
		dto.setPass(request.getParameter("newpwd"));
		System.out.println("회원이 수정 할 이메일" + request.getParameter("email"));
		System.out.println("수정 될 비밀번호" + request.getParameter("newpwd"));
		
		UserDAIOImpl dao = new UserDAIOImpl();
		int result = dao.updateUser(dto);
		System.out.println("updateUser() " + result);
		
	}
}
