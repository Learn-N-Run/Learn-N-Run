package article.one.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
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
		UserDAIOImpl dao = new UserDAIOImpl(); 
		MessageDTO dto = new MessageDTO(); 
		List<MessageDTO> list =dao.getMessage(dto,id); 
		JSONObject totalObject = null;
		JSONArray messageArray = null;
		JSONObject messageInfo = new JSONObject();
		for(int i=0; i<list.size(); i++) {
			messageArray = new JSONArray();
			totalObject = new JSONObject();
			messageInfo.put("send_id", list.get(i).getSend_user().getId());
			messageInfo.put("content", list.get(i).getContent() );
			messageInfo.put("send_time", list.get(i).getSend_time());
			messageInfo.put("read_yn", list.get(i).getRead_yn());
			
			messageArray.add(messageInfo);
			System.out.println(messageArray.toJSONString());
			
			totalObject.put("message", messageArray);
		}
			System.out.println(totalObject.toJSONString());
		
		String jsonInfo = totalObject.toJSONString();
		
		
		out.print(jsonInfo);
	}
	
	  
	 
}
