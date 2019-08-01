package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import article.one.dao.UserDAIOImpl;
import dto.MessageDTO;

public class SelectDetailMessageService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		UserDAIOImpl dao = new UserDAIOImpl();
		System.out.println(request.getParameter("messageNo"));
		int messageNo =Integer.parseInt(request.getParameter("messageNo"));
		
		System.out.println(messageNo);
		MessageDTO dto = dao.getMessageInfo(messageNo);
		JSONObject json = new JSONObject();
		json.put("send_id", dto.getSend_user().getId());
		json.put("content", dto.getContent());
		json.put("read_yn", dto.getRead_yn());
		json.put("send_time", dto.getSend_time().toString().replaceAll(":", ".").replaceAll("-", "."));
		PrintWriter out = response.getWriter();
		System.out.println(json.toJSONString());
		out.println(json.toJSONString());
	}
}
