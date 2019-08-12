package article.three.command;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.three.dao.ReplyDAOImpl;
import dto.ClassDTO;
import dto.ReplyDTO;

public class AddCommunityReplyCommand implements Service {

	   @Override
	   public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
		   ReplyDAOImpl dao = new ReplyDAOImpl();
		   
		   String content = request.getParameter("content");
		   String reply_id = null;
		   int class_no = 1;
		   int curriculum_no = 1;
		   //(int no, String content, Timestamp date, int group, String reply_id, int class_no,int curriculum_no)
		   ReplyDTO dto = new ReplyDTO();
		   dto.setClass_no(class_no);
		   dto.setCurriculum_no(curriculum_no);
		   dto.setTarget_no(target_no);
		   dao.addCommunityReply(dto);
		   
		   
	      
	   }
	   
	   
	}