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
import article.two.command.InsertCurriService;
import article.two.command.ClassInfoService;
import article.two.command.CurriCulumInfoService;
import article.two.command.DelClassService;
import article.two.command.GetAllClassList;
import article.two.command.JjimRegisterService;
import article.two.command.JjimService;
import article.two.command.ModifyClassService;
import article.two.command.Service;
import article.two.command.UpdateClassService;
import article.two.command.UploadClassService;
import article.two.command.deleteJjimService;

// 구현2팀은 "*.me"로 매핑작업을 해주시면 됩니다.
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

		String path = null;
		/*▲포워딩할 경로 String으로 저장*/
		Service forward = null;
		ActionForward action = null;
		
		
		if (getCommand(request, response).equals("crt_classList.me")) {
			//AddClassService 객체 생성
			forward = new AddClassService();
			action =forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("crt_addCurri.me")) {
			//AddCurriService 객체 생성
			forward = new InsertCurriService();
			action = forward.excute(request, response);
			path="crt_upload.jsp";
			
		}else if (getCommand(request, response).equals("classInfo.me")) {
			forward = new ClassInfoService();
			action = forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("updateClass.me")) {
			forward = new UpdateClassService();
			action = forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("jjimRegister.me")) {
			forward = new JjimRegisterService();
			
			action = forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("crt_upload.me")) {
			forward = new UploadClassService();
			action = forward.excute(request, response);
			path= "crt_classList.jsp";
		}else if (getCommand(request, response).equals("crt_deleteClass.me")) {
			forward = new DelClassService();
			action = forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("crt_getAllClassList.me")) {
			forward = new GetAllClassList();
			action = forward.excute(request, response);
			path="/article2/crt_classList.jsp";
		}else if (getCommand(request, response).equals("jjim.me")) {
			forward = new JjimService();
	
			action = forward.excute(request, response);
		}else if (getCommand(request, response).equals("deleteJjim.me")) {
			
			forward = new deleteJjimService();
			
			action = forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("crt_curriCulumInfo.me")) {
			forward = new CurriCulumInfoService();
			action = forward.excute(request, response);	
		}

		else if (getCommand(request, response).equals("crt_modifyClass.me")) {
			forward = new ModifyClassService();
			action = forward.excute(request, response);
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
	
	public static String getCommand(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String command = uri.substring(conpath.length());
		String realCommand = "";
		if (command.indexOf("article") == -1) {
			realCommand = command;
		} else {
			realCommand = command.substring(command.indexOf("article") + 9);
		}
		return realCommand;
	};
}
