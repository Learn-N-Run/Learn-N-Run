package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import article.one.dao.UserDAIOImpl;
import dto.MessageDTO;

public class SelectMessageService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		PrintWriter out = response.getWriter();
		
			out.println(getMessage(id));

	}

	
	  public String getMessage(String id) { StringBuffer result = new
	  StringBuffer(""); result.append("{\"result\":["); UserDAIOImpl dao = new
	 UserDAIOImpl(); MessageDTO dto = new MessageDTO(); List<MessageDTO> list =
	  dao.getMessage(dto,id); 
	 	
	 for(int i=0; i<list.size(); i++) {
	  result.append("[{\"value\":\""+list.get(i).getSend_user().getId()+"\"},");
	  result.append("{\"value\":\""+list.get(i).getContent()+"\"},");
	  result.append("{\"value\":\""+list.get(i).getSend_time()+"\"},");
	  result.append("{\"value\":\""+list.get(i).getRead_yn()+"\"}],");
	  result.append("]}"); } 
	 
	 System.out.println(result);
	  return result.toString(); }
	 
}
