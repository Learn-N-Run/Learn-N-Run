package article.three.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import article.three.dao.MainReadDAO;

@Controller
@RequestMapping(value = "/view")
public class SPController {

	
	private SqlSession sqlsession;
	MainReadDAO readDAO;
	
	@RequestMapping(value = "/index")
	public String indexview(Model model){
		
		
		
		return "index";
	}
	
	
}
