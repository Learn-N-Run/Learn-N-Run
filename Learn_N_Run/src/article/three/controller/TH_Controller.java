package article.three.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller("thcontroller")
public class TH_Controller{

	@RequestMapping(value = "/success.do",method = RequestMethod.GET )
	public ModelAndView testdsfsd() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("key","key생성완료");
		mav.setViewName("index");
		return mav;
	}
	
}
