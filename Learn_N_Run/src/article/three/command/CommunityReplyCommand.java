package article.three.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityReplyCommand implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("userid");
		String pwd = request.getParameter("userpwd");
		String contents = request.getParameter("comentContent");
		
//		dao.(name, pwd, contents);
		
	}
	
	
}
