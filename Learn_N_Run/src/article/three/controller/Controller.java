package article.three.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.three.command.CommunityReplyCommand;
import article.three.command.DeleteCommunityReplyCommand;
import article.three.command.AddCommunityReplyCommand;
import dto.ClassDTO;
import dto.ReplyDTO;

@WebServlet("*.po")
public class Controller extends HttpServlet {
   private static final long serialVersionUID = 1L;

   @Override
   public void init() throws ServletException {System.out.println("connection start");}
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandler(request, response); }
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doHandler(request, response); }
   
   protected void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/* 한글처리 */request.setCharacterEncoding("UTF-8");
/* 한글처리 */response.setContentType("text/html;charset=UTF-8");

      String uri = request.getRequestURI();
      String conpath = request.getContextPath();
      String command = uri.substring(conpath.length());
      /*▲커맨드 추출*/
      String path = null;
      /*▲포워딩할 경로 String으로 저장*/
      if (command.equals("/article3/CommunityReply.po")) {
         CommunityReplyCommand forward = new CommunityReplyCommand();
         forward.excute(request, response);
         
         path="CommunityReply.jsp";
      }else if (command.equals("/article3/CommunityReplyUpdate.po")) {
    	  AddCommunityReplyCommand forward1 = new AddCommunityReplyCommand();
          forward1.excute(request, response);
    	  
    	  CommunityReplyCommand forward = new CommunityReplyCommand();
          forward.excute(request, response);
          
         path="CommunityReply.jsp";
      }else if (command.equals("/article3/CommunityReplyDelete.po")) {
    	  DeleteCommunityReplyCommand forward2 = new DeleteCommunityReplyCommand();
          forward2.excute(request, response);
    	  
    	  CommunityReplyCommand forward = new CommunityReplyCommand();
          forward.excute(request, response);
         path="CommunityReply.jsp";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }else if (command.equals("여기에넣으세요")) {
         
         path="";
      }
      
      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      /*▲포워딩주소설정*/
      dispatcher.forward(request, response);
      /*▲설정된주소로 res+req 전달하여 포워딩*/      
   }
}