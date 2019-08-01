package article.two.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.two.command.ActionForward;
import article.two.command.AddClassService;
import article.two.command.ClassInfoService;
import article.two.command.JjimRegisterService;
import article.two.command.Service;
import article.two.command.UpdateClassService;


@WebServlet("*.me")
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
		Service forward = null;
		ActionForward action = null;
		if (command.equals("/article2/crt_classList.me")) {
			//AddClassService 객체 생성
			forward = new AddClassService();
			action =forward.excute(request, response);
			
			
		}else if (command.equals("/article2/crt_addCurri.me")) {
			//AddCurriService 객체 생성
			
			path="crt_upload.jsp";
		}else if (command.equals("/article2/classInfo.me")) {
			forward = new ClassInfoService();
			
			action = forward.excute(request, response);
			
		}else if (command.equals("/article2/updateClass.me")) {
			forward = new UpdateClassService();
			action = forward.excute(request, response);
			
		}else if (command.equals("/article2/jjimRegister.me")) {
			forward = new JjimRegisterService();
			
			action = forward.excute(request, response);
			
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}
		if(action!= null){
			if(action.isRedirect()){
				response.sendRedirect(action.getPath());
			}else{
				RequestDispatcher dispatcher = request.getRequestDispatcher(action.getPath());
				/*▲포워딩주소설정*/
				dispatcher.forward(request, response);
				/*▲설정된주소로 request와 response 전달하여 포워딩*/		
				
			}
		}
		
		
	}
}
