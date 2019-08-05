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

import article.three.dao.MainReadDAO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.InterestedClassDTO;
import dto.PopularClassDTO;

@Controller
public class SPController {

	@Autowired
	private SqlSession sqlsession;
	MainReadDAO readDAO;
	
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
		
		return "index";
	}
	
	@RequestMapping(value = "/categoryinfo", method = RequestMethod.GET)
	public String categoryView(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{

		Map classinfo = new HashMap();

		List<CategoryDTO> categoryList = cateSelect(request, response);
		List<ClassDTO> cateClassList = cateClassView(request, response);
		
		classinfo.put("categoryList", categoryList);
		classinfo.put("cateClassList", cateClassList);
		
		model.addAttribute("classinfo", classinfo);
		
		return "categoryClassView";
	}
	
	public List<PopularClassDTO> BuyerTopClassSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		List<PopularClassDTO> popList;
		String cateName = request.getParameter("popCateName");
		
		if (cateName == null) {
			popList = sqlsession.selectList("article.three.dao.MainReadDAO.TopClassSelect","%");
		}else {
			popList = sqlsession.selectList("article.three.dao.MainReadDAO.TopClassSelect",cateName);
		}
		
		return popList;
	}
	
	public List<InterestedClassDTO> jjimTopClassSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<InterestedClassDTO> interList;
		String cateName = request.getParameter("interCateName");
		
		if (cateName == null) {
			interList = sqlsession.selectList("article.three.dao.MainReadDAO.InterestedClassSelect","%");
		}else {
			interList = sqlsession.selectList("article.three.dao.MainReadDAO.InterestedClassSelect",cateName);
		}
		
		return interList;
	}
	
	public List<CategoryDTO> cateSelect(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		List<CategoryDTO> categoryList;
		
			categoryList = sqlsession.selectList("article.three.dao.MainReadDAO.CategorySelect");
		
		return categoryList;
	}
	
	public List<ClassDTO> cateClassView(HttpServletRequest request, HttpServletResponse response) throws Exception{

		
		String cateName = request.getParameter("category");
		
		List<ClassDTO> cateClass = sqlsession.selectList("article.three.dao.MainReadDAO.CategoryClassSelect",cateName);
		
		return cateClass;
	}
	

	
	
}
