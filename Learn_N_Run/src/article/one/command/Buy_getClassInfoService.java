package article.one.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.one.dao.UserDAIOImpl;
import dto.ClassDTO;

public class Buy_getClassInfoService implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		int classno = Integer.parseInt(request.getParameter("classno"));
		
		UserDAIOImpl dao = new UserDAIOImpl();
		ClassDTO dto = dao.buyClass(classno);
		request.setAttribute("cover_img", dto.getCover_img());
		request.setAttribute("title", dto.getTitle());
		request.setAttribute("material_img", dto.getMaterial_img());
		request.setAttribute("material_content",dto.getMaterial_content());
		request.setAttribute("tuition", dto.getTuition());
	}
}
