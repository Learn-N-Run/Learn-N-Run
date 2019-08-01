package article.two.command;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;

public class ClassInfoService implements Service {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int no = Integer.parseInt(request.getParameter("no"));

		// ClassDAOImpl, ClassDTO 객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();

		ClassDTO cdto = dao.classInfo(no);

		request.setAttribute("cdto", cdto);

		System.out.println(no);
		System.out.println(cdto.getCover_img());
		System.out.println(cdto.getTitle());
		System.out.println(cdto.getCreator().getCreator_url());
		System.out.println(cdto.getCategory().getName());

		forward.setPath("classInfo.jsp");
		forward.setRedirect(false);

		return forward;

	}

}
