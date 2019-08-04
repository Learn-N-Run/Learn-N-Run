package article.three.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.three.dao.CommunityReplyDAOImpl;
import dto.ClassDTO;
import dto.ReplyDTO;

public class CommunityReplyCommand implements Service {

   @Override
   public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String name = request.getParameter("userid");
      String pwd = request.getParameter("userpwd");
      String contents = request.getParameter("comentContent");
      
      String reply = request.getParameter("reply");
      
      CommunityReplyDAOImpl dao = new CommunityReplyDAOImpl();
      
      ClassDTO dto = new ClassDTO();
      dto.setNo(1);
      
      List<ReplyDTO> r = dao.getClassInfoReply(dto);

      
      request.setAttribute("r", r);
      

      
   }
   
   
}