package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.one.dao.UserDAIOImpl;
import dto.MessageDTO;
import dto.UserDTO;

public class SendMessageService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String send_id = (String) session.getAttribute("id");
		System.out.println("보내는 이"+send_id);
		String receiver_id = request.getParameter("receiver_id");
		System.out.println("받는 이"+receiver_id);
		String content = request.getParameter("content");
		System.out.println("내용"+content);
		
		MessageDTO dto = new MessageDTO();
		UserDTO receiver_dto = new UserDTO();
		dto.setContent(content);
		receiver_dto.setId(receiver_id);
		dto.setReceiver_user(receiver_dto);
		dto.setContent(content);
		
		UserDAIOImpl dao = new UserDAIOImpl();
		int idCheckResult = dao.sendMessage(dto, send_id);
		PrintWriter out = response.getWriter();
		out.println(idCheckResult);
		
	}
}
