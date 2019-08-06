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

		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String command = uri.substring(conpath.length());
		/*▲커맨드 추출*/
		
		String path = null;
		/*▲포워딩할 경로 String으로 저장*/
		
		if (command.equals("/article1/login.do")) {
			LoginCheckService forward = new LoginCheckService();
			forward.excute(request, response);
			path="mainEx.jsp";
		}else if (command.equals("/article1/selectMessage.do")) {
			SelectMessageService forward = new SelectMessageService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/selectDetailMessage.do")) {
			SelectDetailMessageService forward = new SelectDetailMessageService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/insertMessage.do")) {
			SendMessageService forward = new SendMessageService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/deleteMessage.do")) {
			DeleteMessageService forward = new DeleteMessageService();
			forward.excute(request, response);
			path="selectMessage.do";
		}else if (command.equals("/article1/event.do")) {
			getEmailService forward = new getEmailService();
			forward.excute(request, response);
			path="event.jsp";
		}else if (command.equals("/article1/coupon3.do")) {
			coupon3Service forward = new coupon3Service();
			forward.excute(request, response);
			path="event.jsp";
		}else if (command.equals("/article1/coupon1.do")) {
			coupon1EmailSendService forward = new coupon1EmailSendService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/coupon1_register_h.do")) {
			coupon1RegisterService forward = new coupon1RegisterService();
			forward.excute(request, response);
			path="event.jsp";
		}else if (command.equals("/article1/selectCouponCount.do")) {
			selectCouponCountService forward = new selectCouponCountService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/buyClassInfo.do")) {
			Buy_getClassInfoService forward = new Buy_getClassInfoService();
			forward.excute(request, response);
			path="paymentInfo.jsp";
		}else if (command.equals("/article1/payment.do")) {
			selectTuitionService forward = new selectTuitionService();
			forward.excute(request, response);
			path="payment.jsp";
		}else if (command.equals("/article1/buyersubmit.do")) {
			InsertbuyClassService forward = new InsertbuyClassService();
			forward.excute(request, response);
			path="mainEx.jsp";
		}else if (command.equals("/article1/join.do")) {
			JoinRegisterService forward = new JoinRegisterService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/signout.do")) {
			delUserService forward = new delUserService();
			forward.excute(request, response);
			
		}else if (command.equals("/article1/idCheckService.do")) {
			idCheckService forward = new idCheckService();
			forward.excute(request, response);
		}else if (command.equals("/article1/delUserService.do")) {
			delUserService forward = new delUserService();
			forward.excute(request, response);
			path="mainEx.jsp";
		}else if (command.equals("/article1/updateUser.do")) {
			updateUser forward = new updateUser();
			forward.excute(request, response);
			path="getUserInfo.do";
		}else if (command.equals("/article1/updateCreator.do")) {
			updateCreator forward = new updateCreator();
			forward.excute(request, response);
			path="getUserInfo.do";
		}else if (command.equals("/article1/getMyClassInfo.do")) {
			getMyClassService forward = new getMyClassService();
			forward.excute(request, response);
			path = "classInfo.jsp";
			
		}else if (command.equals("/article1/getUserInfo.do")) {
			System.out.println("하이");
			getUserInfoService forward = new getUserInfoService();
			forward.excute(request, response);
			path = "modifymember.jsp";
		}else if (command.equals("/article1/logout.do")) {
			LogoutService forward = new LogoutService();
			forward.excute(request, response);
			path = "mainEx.jsp";
		}else if (command.equals("/article1/pwdCheck.do")) {
			pwdCheck forward = new pwdCheck();
			forward.excute(request, response);
		}else if (command.equals("/article1/AddCreatorService.do")) {
			System.out.println(request.getParameter("number"));
			AddCreatorService forward = new AddCreatorService();
			forward.excute(request, response);
		}
		
		
		if(path != null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		/*▲포워딩주소설정*/
		dispatcher.forward(request, response);
		}
		/*▲설정된주소로 res+req 전달하여 포워딩*/		
	}
}
