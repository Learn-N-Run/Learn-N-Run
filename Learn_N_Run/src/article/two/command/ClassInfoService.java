package article.two.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.SubjectDTO;


public class ClassInfoService implements Service{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		//한글처리
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		
		//ClassDAOImpl, ClassDTO 객체 생성
		ClassDAOImpl dao = new ClassDAOImpl();
		
		CurriculumDTO cudto =  dao.classInfo(no);
		
		
	
		
		Vector<CurriculumDTO> catev = dao.categoryInfo(cudto);
		
		Vector<SubjectDTO> suv = dao.curriInfo(cudto);
		
		request.setAttribute("cudto", cudto);
		request.setAttribute("catev", catev);
		request.setAttribute("suv", suv);
		
		System.out.println(no);
		System.out.println(cudto.getClassinfo().getCategory().getName());
		System.out.println(cudto.getClassinfo().getCreator().getNickname());
		System.out.println(cudto.getMajor_topic());
		System.out.println(cudto.getNo());
		
		forward.setPath("/Learn_N_Run/article2/classInfo.jsp");
		forward.setRedirect(false);
		
		
		
		return forward;
		
	}

}
