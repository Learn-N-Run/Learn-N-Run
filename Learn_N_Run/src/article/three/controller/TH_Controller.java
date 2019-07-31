package article.three.controller;

import org.springframework.web.servlet.ModelAndView;

//@RequestMapping("/test")
//@Controller
public class TH_Controller{

//	@RequestMapping("/success")
	public ModelAndView testdsfsd() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("key","key생성완료");
		mav.setViewName("index");
		return mav;
	}
	
}
