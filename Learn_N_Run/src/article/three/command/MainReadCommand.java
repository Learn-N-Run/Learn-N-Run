package article.three.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import article.three.dao.MainReadDAOimpl;

@Component
public class MainReadCommand implements Service{
	
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	private MainReadDAOimpl readDAO;
	
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	
}
