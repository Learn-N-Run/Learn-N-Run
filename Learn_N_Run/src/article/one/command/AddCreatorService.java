package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String path = "D:\\메모장연습";
		/*
		 * String path =
		 * session.getServletContext().getRealPath("/")+"article1/filestorage";
		 */
		int maxSize = 1024*1024*10;
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setName(name);
		dto.setNickname(multi.getParameter("nickname"));
		dto.setEmail(multi.getParameter("email"));
		dto.setNumber(Integer.parseInt(multi.getParameter("number")));
		dto.setProfile_img(multi.getFilesystemName("profile_img"));
		dto.setCreator_url(multi.getParameter("url"));
				
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
			int group =	dao.getUserGroup(id);
			session.setAttribute("Group", group);
			PrintWriter out = response.getWriter();
			
			//<img src="${contextPath }/article1/filestorage/${requestScope.user.profile_img }">
			//사진(크리에이터 신청)은 filestorage에 저장됨(D:\T3_learnrun\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Learn_N_Run\article1\filestorage)
			//사진 사용시 DB값(파일명)불러오면 되는데 회원정보 수정 페이지 ${requestScope}로 시작되어있음, 인위적으로 세션의 Group는 2로 수정하였으나
			//회원정보 수정 할 때마다 requestScope를 어디서받아 올껀지..?
			
			out.println("<script>");
			out.println("alert('크리에이터 신청이 완료되었습니다, 강의를 등록해주세요.');");
			out.println("location.href='/Learn_N_Run/article1/mainEx.jsp';");
			out.print("</script>");

			System.out.println("크리에이터 성공");
			out.close();
		}
	}

}
