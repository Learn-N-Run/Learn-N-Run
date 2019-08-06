package article.two.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;

public class CurriCulumInfoService implements Service {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		//classNo값 받기
		int classNo = Integer.parseInt(request.getParameter("no"));
		
		
		//DAO객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		ClassDTO classDto = dao.curriCulumInfo(classNo);
		
		
		
		
		request.setAttribute("classDto", classDto);
		
		
		forward.setPath("crt_curriCulumInfo.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
