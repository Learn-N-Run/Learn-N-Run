package article.one.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.command.AddCreatorService;
import article.one.command.Buy_getClassInfoService;
import article.one.command.DeleteMessageService;
import article.one.command.InsertbuyClassService;
import article.one.command.JoinRegisterService;
import article.one.command.LoginCheckService;
import article.one.command.LogoutService;
import article.one.command.SelectDetailMessageService;
import article.one.command.SelectMessageService;
import article.one.command.SendMessageService;
import article.one.command.coupon1EmailSendService;
import article.one.command.coupon1RegisterService;
import article.one.command.coupon3Service;
import article.one.command.delUserService;
import article.one.command.getEmailService;
import article.one.command.getMyClassService;
import article.one.command.getUserInfoService;
import article.one.command.idCheckService;
import article.one.command.updateUser;
import article.one.command.updateCreator;
import article.one.command.pwdCheck;
import article.one.command.selectCouponCountService;
import article.one.command.selectTuitionService;

@WebServlet("*.do")
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
		
		if (getCommand(request, response).equals("login.do")) {
			LoginCheckService forward = new LoginCheckService();
			forward.excute(request, response);
			path="/main.jsp";
			
		}else if (getCommand(request, response).equals("selectMessage.do")) {
			SelectMessageService forward = new SelectMessageService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("selectDetailMessage.do")) {
			SelectDetailMessageService forward = new SelectDetailMessageService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("insertMessage.do")) {
			SendMessageService forward = new SendMessageService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("deleteMessage.do")) {
			DeleteMessageService forward = new DeleteMessageService();
			forward.excute(request, response);
			path="/article1/selectMessage.do";
			
		}else if (getCommand(request, response).equals("event.do")) {
			getEmailService forward = new getEmailService();
			forward.excute(request, response);
			path="/article1/event.jsp";
			
		}else if (getCommand(request, response).equals("coupon3.do")) {
			coupon3Service forward = new coupon3Service();
			forward.excute(request, response);
			path="/article1/event.do";
			
		}else if (getCommand(request, response).equals("coupon1.do")) {
			coupon1EmailSendService forward = new coupon1EmailSendService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("coupon1_register_h.do")) {
			coupon1RegisterService forward = new coupon1RegisterService();
			forward.excute(request, response);
			path="/article1/event.do";
			
		}else if (getCommand(request, response).equals("selectCouponCount.do")) {
			selectCouponCountService forward = new selectCouponCountService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("buyClassInfo.do")) {
			Buy_getClassInfoService forward = new Buy_getClassInfoService();
			forward.excute(request, response);
			path="/article1/paymentInfo.jsp";
			
		}else if (getCommand(request, response).equals("payment.do")) {
			selectTuitionService forward = new selectTuitionService();
			forward.excute(request, response);
			path="/article1/payment.jsp";
			
		}else if (getCommand(request, response).equals("buyersubmit.do")) {
			InsertbuyClassService forward = new InsertbuyClassService();
			forward.excute(request, response);
			path="/article1/getMyClassInfo.do";
			
		}else if (getCommand(request, response).equals("join.do")) {
			JoinRegisterService forward = new JoinRegisterService();
			forward.excute(request, response);
			path="/main.jsp";
			
		}else if (getCommand(request, response).equals("signout.do")) {
			delUserService forward = new delUserService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("idCheckService.do")) {
			idCheckService forward = new idCheckService();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("delUser.do")) {
			delUserService forward = new delUserService();
			forward.excute(request, response);
			path="/article1/mainEx.jsp";
			
		}else if (getCommand(request, response).equals("updateUser.do")) {
			updateUser forward = new updateUser();
			forward.excute(request, response);
			path="/article1/getUserInfo.do";
			
		}else if (getCommand(request, response).equals("updateCreator.do")) {
			updateCreator forward = new updateCreator();
			forward.excute(request, response);
			path="/article1/getUserInfo.do";
			
		}else if (getCommand(request, response).equals("getMyClassInfo.do")) {
			getMyClassService forward = new getMyClassService();
			forward.excute(request, response);
			path = "/article1/classList.jsp";
			
		}else if (getCommand(request, response).equals("getUserInfo.do")) {
			getUserInfoService forward = new getUserInfoService();
			forward.excute(request, response);
			path = "/article1/modifymember.jsp";
			
		}else if (getCommand(request, response).equals("logout.do")) {
			LogoutService forward = new LogoutService();
			forward.excute(request, response);
			path = "/main.jsp";
			
		}else if (getCommand(request, response).equals("pwdCheck.do")) {
			pwdCheck forward = new pwdCheck();
			forward.excute(request, response);
			
		}else if (getCommand(request, response).equals("AddCreatorService.do")) {
			AddCreatorService forward = new AddCreatorService();
			forward.excute(request, response);
		}
		
		
		if(path != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
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
