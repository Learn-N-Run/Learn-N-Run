package article.two.command;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.two.dao.ClassDAOImpl;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.SubjectDTO;

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
		
		//클래스에 대한 간략한 정보를 가져오자
		ClassDTO classDto = dao.curriCulumInfo(classNo);
		
		//클래스 No를 통해 커리큘럼의 no값을 받자.
		CurriculumDTO curriDto = dao.getCurriNum(classNo);
		int curriNo = curriDto.getNo();
		
		//위의 커리큘럼의 no값을 매개변수로 하여 subject의 정보들을 가져오자.
		Vector<SubjectDTO> v = dao.subjectInfo(curriNo);
		
		
		request.setAttribute("classDto", classDto);
		request.setAttribute("v", v);
		request.setAttribute("classNo", classNo);
		request.setAttribute("curriNo", curriNo);
		
		
		forward.setPath("crt_curriCulumInfo.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
