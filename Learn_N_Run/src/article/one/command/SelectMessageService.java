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
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		PrintWriter out = response.getWriter();
		UserDAIOImpl dao = new UserDAIOImpl(); 
		MessageDTO dto = new MessageDTO(); 
		List<MessageDTO> list =dao.getMessage(dto,id); 
		JSONObject totalObject = null;
		JSONArray messageArray = new JSONArray();
		for(int i=0; i<list.size(); i++) {
			JSONObject messageInfo = new JSONObject();
			messageInfo.put("messageNo", list.get(i).getNo());
			messageInfo.put("send_id", list.get(i).getSend_user().getId());
			messageInfo.put("content", list.get(i).getContent() );
			messageInfo.put("send_time", list.get(i).getSend_time().toString().replaceAll("-",".").replaceAll(":", "."));
			messageInfo.put("read_yn", list.get(i).getRead_yn());
			messageArray.add(messageInfo);
		}
		totalObject = new JSONObject();
		System.out.println(messageArray.toJSONString());
		totalObject.put("message", messageArray);
		String jsonInfo = totalObject.toJSONString();
		System.out.println(totalObject.toJSONString());
		out.print(jsonInfo);
		out.flush();
		out.close();
		
		/*
	 	{
		"message":[
					{
						"send_id":"admin2",
						"send_time":"2019.07.18 19.02.27.0",
						"read_yn":0,
						"content":"hi"
					},
					{
						"send_id":"admin2",
						"send_time":"2019.07.18 19.02.28.0",
						"read_yn":0,
						"content":"hi2"
					}
				]
		}			 
	 */
	}
}
