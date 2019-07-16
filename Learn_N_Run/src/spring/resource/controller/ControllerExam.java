package spring.resource.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControllerExam {
	
	@RequestMapping("/index.do")
	public ModelAndView helloworld() {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", "시발놈아");
		mav.setViewName("index");
		
		return mav;
	}
	
	
}
