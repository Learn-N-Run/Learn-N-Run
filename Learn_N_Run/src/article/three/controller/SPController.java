package article.three.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import article.three.mapper.ReadDAO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.InterestedClassDTO;
import dto.PopularClassDTO;
import dto.ReplyDTO;
import dto.SubjectInfoDTO;

@Controller
public class SPController{

	@Autowired
	private SqlSession sqlsession;
	ReadDAO readDAO;
	
	@RequestMapping(value = "/article3/anonymous")
	public String anonymousIndexView(Model model){
		
		return "/article3/AnonymousIndex";
	}
	
	@RequestMapping(value = "/article3/getcurrivideo*")
	public String getcurrivideo(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		List<SubjectInfoDTO> subject_list;
	
		SubjectInfoDTO dto = new SubjectInfoDTO();

		if (request.getParameter("subjectno") != null) {

			dto.setClassno(Integer.parseInt(request.getParameter("subjectno")));
			subject_list = sqlsession.selectList("article.three.mapper.ReadDAO.getsubjectVideo",dto);
			
		}else if (request.getParameter("no") != null) {
			
			dto.setClassno(Integer.parseInt(request.getParameter("no")));
			subject_list = sqlsession.selectList("article.three.mapper.ReadDAO.getcurriVideo",dto);
			
		}else {
			
			subject_list = null;
			
		}
		
		String path;
		
		if (subject_list == null) {
			
			path = "/main";
			
		}else {
			model.addAttribute("subject_list", subject_list);
			path = "/article3/PlayCurriculum";
		}
		
		return path;
	}
	
	
	
	
	@RequestMapping(value = "/index")
	public String indexview(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map classinfo = new HashMap();
		
		List<PopularClassDTO> popList = BuyerTopClassSelect(request, response);
		List<InterestedClassDTO> interList = jjimTopClassSelect(request, response);
		List<CategoryDTO> categoryList = cateSelect(request, response);
		
		classinfo.put("popList", popList);
		classinfo.put("interList", interList);
		classinfo.put("categoryList", categoryList);
		
		model.addAttribute("listMap", classinfo);
		
		return "/article3/index";
	}

	@RequestMapping(value = "/article3/categoryinfo", method = RequestMethod.GET)
	public String categoryView(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{

		Map classinfo = new HashMap();

		List<CategoryDTO> categoryList = cateSelect(request, response);
		List<ClassDTO> cateClassList = cateClassView(request, response);
		
		classinfo.put("categoryList", categoryList);
		classinfo.put("cateClassList", cateClassList);
		
		model.addAttribute("classinfo", classinfo);
		
		return "/article3/CategoryClassView";
	}

	
//ajax
	public String ClassReplyList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<ReplyDTO> replyList = CummunityReplyList(request, response);
		model.addAttribute("community", replyList);
		
		return "/article3/inc_reply/community";
	}

//ajax
	public String targetReplyList(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
		targetReplyList(request, response);
		
		return null;
	}
	
/* 커맨드 리스트(분류예정) */
	public List<PopularClassDTO> BuyerTopClassSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		List<PopularClassDTO> popList;
		String cateName = request.getParameter("popCateName");
		
		if (cateName == null) {
			popList = sqlsession.selectList("article.three.mapper.ReadDAO.TopClassSelect","%");
		}else {
			popList = sqlsession.selectList("article.three.mapper.ReadDAO.TopClassSelect",cateName);
		}

		
		return popList;
	}

	public List<InterestedClassDTO> jjimTopClassSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<InterestedClassDTO> interList;
		String cateName = request.getParameter("interCateName");
		
		if (cateName == null) {
			interList = sqlsession.selectList("article.three.mapper.ReadDAO.InterestedClassSelect","%");
		}else {
			interList = sqlsession.selectList("article.three.mapper.ReadDAO.InterestedClassSelect",cateName);
		}
		
		return interList;
	}
	
	public List<CategoryDTO> cateSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<CategoryDTO> categoryList;
		
			categoryList = sqlsession.selectList("article.three.mapper.ReadDAO.CategorySelect");
		
		return categoryList;
	}
	
	public List<ClassDTO> cateClassView(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String cateName = request.getParameter("category");
		
		List<ClassDTO> cateClass = sqlsession.selectList("article.three.mapper.ReadDAO.CategoryClassSelect",cateName);
		
		return cateClass;
	}

	public List<ReplyDTO> getVideoReply(HttpServletRequest request, HttpServletResponse response) throws Exception{

		int classno = Integer.parseInt(request.getParameter("no"));

		List<ReplyDTO> classReplyDTOs = sqlsession.selectList("article.three.mapper.ReadDAO.VideoReplySelect",classno);
		
		return classReplyDTOs;
	}

	public List<CurriculumDTO> getCurriculum(CurriculumDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<ReplyDTO> CummunityReplyList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map keyMap = new HashMap();

		if (request.getParameter("startLimitIndex") != null) {
			keyMap.put("startLimitIndex", request.getParameter("startLimitIndex"));
		}else {
			keyMap.put("startLimitIndex", 0);
		}
		List<ReplyDTO> replyList = sqlsession.selectList("article.three.mapper.ReadDAO.CummunityReplyList",keyMap);
		
		return replyList;
	}
	
	public List<ReplyDTO> targetReplyList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		Map keyMap = new HashMap();
		
		if (request.getParameter("startLimitIndex") != null) {
			keyMap.put("no", request.getParameter("classNo"));
			keyMap.put("startLimitIndex", request.getParameter("startLimitIndex"));
			keyMap.put("targetNo", request.getParameter("targetNo"));
		}else {
			keyMap.put("no", request.getParameter("classNo"));
			keyMap.put("startLimitIndex", 0);
			keyMap.put("targetNo", request.getParameter("targetNo"));
		}
		
		List<ReplyDTO> targetReplyList = sqlsession.selectList("article.three.mapper.ReadDAO.ReplyLoading",keyMap);
		
		return targetReplyList;
	}
}
