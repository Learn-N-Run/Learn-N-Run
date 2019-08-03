package article.three.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import article.three.command.Service;
import article.three.dao.MainReadDAOimpl;
import lombok.extern.log4j.Log4j;

@Controller
public class SPController {
	
	Service command;
	ModelAndView mav = new ModelAndView();
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView indexview(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		mav.setViewName("index");
		
		return mav;
	}
	
	public ModelAndView top5InfoSELECT(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		mav.addObject("");
		
		return mav;
	}
	
	
}
