package article.two.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.two.dao.ClassDAOImpl;

public class DelClassService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		
		int classNo = Integer.parseInt(request.getParameter("no"));
		
		//DAO객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		dao.delClass(classNo);
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		
		out.println("<script>");
		out.println("alert('클래스가 삭제 되었습니다.');");
		out.println("location.href='getAllClassList.me';");
		out.println("</script>");
		out.close();
		
		
		return null;
	}

}
