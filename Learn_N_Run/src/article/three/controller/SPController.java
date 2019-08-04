package article.three.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import article.three.command.Service;

@Controller
@RequestMapping(value = "/view")
public class SPController {

	Service command;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String indexview(Model model, RedirectAttributes redirect) throws Exception {
		
		
		
		
		
		
		return "index";
	}

}
