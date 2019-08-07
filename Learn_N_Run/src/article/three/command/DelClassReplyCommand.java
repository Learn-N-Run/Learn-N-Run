package article.three.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.three.dao.ReplyDAOImpl;

public class DelClassReplyCommand implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ReplyDAOImpl dao = new ReplyDAOImpl();

		int no = Integer.parseInt(request.getParameter("replyno"));

		dao.delCommunityReply(no);

	}

}
