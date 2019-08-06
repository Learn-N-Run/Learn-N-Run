package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class AddCreatorService implements Service{
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");
		System.out.println(request.getParameter("number"));
		int number1 = Integer.parseInt(request.getParameter("number")); 
		String url = request.getParameter("url");
		String profile_img = request.getParameter("profile_img");
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setNickname(nickname);
		dto.setEmail(email);
		/* dto.setNumber(number1); */
		dto.setProfile_img(profile_img);
		dto.setCreator_url(url);
				
		UserDAIOImpl dao = new UserDAIOImpl();
				
		int result = dao.AddCreator(dto);
		
		if (result == 0) {
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('크리에이터 신청에 실패하였습니다 다시 시도해주세요.');");
			out.println("history.back();");
			out.print("</script>");

			System.out.println("크리에이터 실패");
			out.close();
		} else {
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('크리에이터 신청이 완료되었습니다, 강의를 등록해주세요.');");
			out.println("location.href='/article1/mainEx.jsp';");
			out.print("</script>");

			System.out.println("회원정보 수정 오류 ");
			out.close();
		}
	}

}
