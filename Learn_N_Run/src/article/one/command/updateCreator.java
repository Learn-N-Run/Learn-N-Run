package article.one.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import article.one.dao.UserDAIOImpl;
import dto.UserDTO;

public class updateCreator implements Service{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String path = "D:\\team3 dev tools\\workspace\\Learn_N_Run\\WebContent\\4_contents\\profile";
	      //2. 업로드하는 파일의 최대 크기를 제한(100MB)
		int maxSize = 1024*1024*100;
	      //3. 업로드할 파일의 이름이 한글 파일일 경우 encoding설정
	    String encoding = "UTF-8";
	    String fileName ="";
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
		try {
			fileName = multi.getFilesystemName("profile_img");
			File file = new File(path + fileName);
		} catch (Exception e) {
			System.out.println("업로드 실패");
		}
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		UserDTO dto = new UserDTO();
		dto.setNickname(multi.getParameter("nickname"));
		dto.setEmail(multi.getParameter("email"));
		dto.setPass(multi.getParameter("newpwd"));
		dto.setNumber(Integer.parseInt(multi.getParameter("number")));
		dto.setProfile_img("/4_contents/profile/"+fileName);
		dto.setCreator_url(multi.getParameter("url"));
		dto.setId(id);
		
		
		UserDAIOImpl dao = new UserDAIOImpl();
		dao.updateCreator(dto);
	}
}
