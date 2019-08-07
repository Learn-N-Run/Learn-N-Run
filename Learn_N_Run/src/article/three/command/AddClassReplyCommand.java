package article.three.command;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.three.dao.ReplyDAOImpl;
import dto.ReplyDTO;

public class AddClassReplyCommand implements Service {
	
	@Override
	   public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		   ReplyDAOImpl dao = new ReplyDAOImpl();
		   
		   int no = 0;
		   String content = request.getParameter("content");
		   Timestamp date = new Timestamp(System.currentTimeMillis());
		   int group = 0;
		   String reply_id = null;
		   int class_no = 1;
		   int curriculum_no = 1;
		   //(int no, String content, Timestamp date, int group, String reply_id, int class_no,int curriculum_no)
		   ReplyDTO dto = new ReplyDTO(1, content, date, group, reply_id, class_no, curriculum_no);
		   
		   dao.addClassReply(dto);
		   
		   
	      
	   }
}
