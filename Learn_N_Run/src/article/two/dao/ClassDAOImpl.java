package article.two.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BuyerDTO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.JjimDTO;
import dto.UserDTO;

public class ClassDAOImpl implements ClassDAO{
	
	//커넥션 풀을 멤버변수로 설정
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	String sql= "";
	
	//Connection객체 얻는 메소드
	private Connection getConnection() throws Exception{
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/learnrun");
		con = ds.getConnection();
		return con;
	}
	
	//자원해제 메소드
	public void freeResource(){
		if(con!=null)
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if(rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if(pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	
	
	
	/*crt_classList.jsp에서 '새로운 클래스 생성하기'버튼을 눌렸을 때
	session안에 있는 id를 cre_id 컬럼에 insert하자*/
	@Override
	public void addClass(String id) {
				
		try {
			con=getConnection();
			sql = "insert into class(cre_id) values(?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("addClass()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
	}//addClass 메소드 끝나는 부분
	
	
	// crt_addclass.jsp에서 next 버튼 눌렀을 때 update 구문 실행
	@Override
	public void updateClass(ClassDTO cdto, String id) {
	      try {
	    	  con = getConnection();
	    	  String sql = "update  class "
	    	  		+ "set cover_img =?, title = ?,  detail_category = ?, content = ?, material_img = ?, material_content = ?, category_no = ? "
	    	  		+ "where no = (select max(no) from (select no from class) as a where cre_id = ?)";
	         pstmt = con.prepareStatement(sql);
	         
	         pstmt.setString(1, cdto.getCover_img());
	         pstmt.setString(2, cdto.getTitle());
	         pstmt.setString(3, cdto.getDetail_category());
	         pstmt.setString(4, cdto.getContent());
	         pstmt.setString(5, cdto.getMaterial_img());
	         pstmt.setString(6, cdto.getMaterial_content());
	         pstmt.setInt(7, cdto.getCategory().getNo());
	         
	         pstmt.setString(8, id);
	         pstmt.executeUpdate();
	      }catch(Exception e) {
	         System.out.println("updateClass 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		
	}//UpdateClass 메소드 끝나는 부분

	@Override
	public void insertCurriculum(int classNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delCurriculum(int curriculmNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ClassDTO updateCurriculum(CurriculumDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void uploadClass(ClassDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ClassDTO ModifyClass(ClassDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CurriculumDTO ModifyCurriculum(CurriculumDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delClass(ClassDTO dto) {
		// TODO Auto-generated method stub
		
	}
	
	
	// 하나의 클래스에대한 정보를 알고 싶어 그 클래스를 클릭 했을 때 실행
	@Override
	public ClassDTO classInfo(int no) {
		ClassDTO cdto = null;
		
		try {
	    	  con = getConnection();
	    	  sql =  "SELECT c.cover_img,  c.detail_category, c.material_img, c.tuition, c.material_content, c.content, c.title, u.nickname, u.creator_url, ct.name, c.no "
	    	  		+ "FROM  class c join user u on c.cre_id = u.id "
	    	  		+ "join category ct on c.category_no = ct.no "
	    	  		+ "WHERE c.no = ?";
	    	  pstmt = con.prepareStatement(sql);
	    	  pstmt.setInt(1, no);
	    	  
	    	  rs = pstmt.executeQuery();
	    	  
	    	  while(rs.next()) {
	    		  cdto = new ClassDTO();
	    		  UserDTO udto = new UserDTO();
	    		  CategoryDTO ctdto = new CategoryDTO();
	    		  
	    		  cdto.setCover_img(rs.getString(1));
	    		 
	    		  cdto.setDetail_category(rs.getString(2));
	    		  cdto.setMaterial_img(rs.getString(3));
	    		  cdto.setTuition(rs.getInt(4));
	    		  cdto.setMaterial_content(rs.getString(5));
	    		  cdto.setContent(rs.getString(6));
	    		  cdto.setTitle(rs.getString(7));
	    		  
	    		  udto.setNickname(rs.getString(8));
	    		  udto.setCreator_url(rs.getString(9));
	    		  cdto.setCreator(udto);
	    		  
	    		  ctdto.setName(rs.getString(10));
	    		  cdto.setCategory(ctdto);
	    		  
	    		  cdto.setNo(rs.getInt(11));
	    		  
	    	  }
	    	  
	      }catch(Exception e) {
	         System.out.println("classInfo 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		return cdto;
	}

	@Override
	public List<CategoryDTO> categoryInfo(CategoryDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BuyerDTO> myClassList(BuyerDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	public Vector<JjimDTO> jjimRegiter(String userid, int classno) {
		Vector<JjimDTO> cv = new Vector<JjimDTO>();
		JjimDTO jdto = null;
		try {
			con=getConnection();
			sql = "insert into jjim(user_id, class_no) values(?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setInt(2, classno);
			
			pstmt.executeUpdate();
			
			 sql = "select c.no, c.cover_img, c.title, u.id "
					+ "from class c join jjim j on j.class_no = c.no "
					+ "join user u on u.id = j.user_id "
					+ "where j.user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				jdto = new JjimDTO();
				UserDTO udto = new UserDTO();
				ClassDTO cdto = new ClassDTO();
				
				
				cdto.setNo(rs.getInt(1));
				cdto.setCover_img(rs.getString(2));
				cdto.setTitle(rs.getString(3));
				
				jdto.setClassinfo(cdto);
				
				udto.setId(rs.getString(4));
				jdto.setUser(udto);
				
				cv.add(jdto);
				
			}
			
		
		} catch (Exception e) {
			System.out.println("jjimRegister()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
		
		
		return cv;
	}

	
	
}//ClassDAOImpl 끝나는 부분
