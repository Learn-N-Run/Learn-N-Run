package article.three.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class TH_Controller extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private StringBuffer ctrlConsole;

/* String 생성자 최소화를 이유로  스트링버퍼로 문자열을 추가하여 콘솔확인하기 위한 메소드*/
	private void viewConsole(String ...strings) {

		ctrlConsole = new StringBuffer();

		for (String string : strings) {
			ctrlConsole.append(string);
		}
		
		System.out.print(ctrlConsole);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		viewConsole("accepted method : ", "GET");
		doHandler(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		viewConsole("accepted method : ", "POST");
		doHandler(request, response);
	}
	
	protected void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/* 한글처리 */
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

/* 커맨드 추출 */
		String uri = request.getRequestURI();
		String conpath = request.getContextPath();
		String command = uri.substring(conpath.length());
		viewConsole("command : ",command);
		
/* 경로 선언 */
		String path = "";

		if (command.equals("여기에넣으세요")) {
			
			
			path="index.jsp";
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
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}else if (command.equals("여기에넣으세요")) {
			
			path="";
		}
				
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

//TODO: test용
	public static void main(String[] args) {
		TH_Controller th = new TH_Controller();
		th.viewConsole("accepted method : ", "GET");
	}
	
}
