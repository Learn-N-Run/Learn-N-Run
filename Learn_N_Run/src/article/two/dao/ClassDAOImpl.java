package article.two.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
import dto.SubjectDTO;
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
	public int addClass(String id) {
		
		int generatekey =0;	
		try {
			con=getConnection();
			sql = "insert into class(cre_id,category_no) values(?,1)";
			pstmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			rs = pstmt.getGeneratedKeys();
			if(rs.next()){
	        	 generatekey = rs.getInt(1);
	        	 
				
	          }
		} catch (Exception e) {
			System.out.println("addClass()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
		return generatekey;
		
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
	         e.printStackTrace();
	      }finally{
	    	  freeResource();
	      }
		
	}//UpdateClass 메소드 끝나는 부분

	

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
		
		try {
			
			//커넥션 풀 얻기
			con = getConnection();
			//update구문 쓰기
			sql = "update class set expiration=?, tuition=? where no=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getExpiration());
			pstmt.setInt(2, dto.getTuition());
			pstmt.setInt(3, dto.getNo());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("uploadClass()에서 오류"+e.getStackTrace());
		
		}finally {
			freeResource();
		}
		
	}//UploadClass끝나는 부분

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
	public void delClass(int classNo) {
		
		try {
			con = getConnection();
			sql = "delete from class where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNo);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delClass에서의 오류"+e.getMessage());
		}finally {
			freeResource();
		}
		
	}
	
	
	// 하나의 클래스에대한 정보를 알고 싶어 그 클래스를 클릭 했을 때 실행
	@Override
	public CurriculumDTO classInfo(int no) {
		CurriculumDTO cudto = null;
		
		try {
	    	  con = getConnection();
	    	  sql = "SELECT c.cover_img,  c.detail_category, c.material_img, c.tuition, c.material_content, c.content, c.title, u.nickname, u.creator_url, ct.name, c.no, ct.no, cu.thumbnail, cu.major_topic, cu.no " + 
	    	  		"FROM  class c join user u on c.cre_id = u.id " + 
	    	  		"join category ct on c.category_no = ct.no " + 
	    	  		"join curriculum cu on cu.class_no = c.no " + 
	    	  		"WHERE c.no = ?";
	    	  pstmt = con.prepareStatement(sql);
	    	  pstmt.setInt(1, no);
	    	  
	    	  rs = pstmt.executeQuery();
	    	  
	    	  while(rs.next()) {
	    		  cudto = new CurriculumDTO();
	    		  ClassDTO cdto = new ClassDTO();
	    		  UserDTO udto = new UserDTO();
	    		  CategoryDTO ctdto = new CategoryDTO();
	    		  
	    		  
	    		  cdto.setCover_img(rs.getString(1));
	    		  cdto.setDetail_category(rs.getString(2));
	    		  cdto.setMaterial_img(rs.getString(3));
	    		  cdto.setTuition(rs.getInt(4));
	    		  cdto.setMaterial_content(rs.getString(5));
	    		  cdto.setContent(rs.getString(6));
	    		  cdto.setTitle(rs.getString(7));
	    		  cdto.setNo(rs.getInt(11));
	    		  cudto.setClassinfo(cdto);
	    		  
	    		  udto.setNickname(rs.getString(8));
	    		  udto.setCreator_url(rs.getString(9));
	    		  cdto.setCreator(udto);
	    		  cudto.setClassinfo(cdto);
	    		  
	    		  ctdto.setName(rs.getString(10));
	    		  ctdto.setNo(rs.getInt(12));
	    		  cdto.setCategory(ctdto);
	    		  cudto.setClassinfo(cdto);
	    		  
	    		 
	    		  cudto.setThumbnail(rs.getString(13));
	    		  cudto.setMajor_topic(rs.getString(14));
	    		  cudto.setNo(rs.getInt(15));
	    		  
	    	  }
	    	  
	      }catch(Exception e) {
	         System.out.println("classInfo 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		return cudto;
	}

	public Vector<CurriculumDTO> categoryInfo(CurriculumDTO cudto) {
		Vector<CurriculumDTO> catev = new Vector<CurriculumDTO>();
		
		try {
			con=getConnection();
			
			 sql = "select c.cover_img, c.title, u.nickname, ct.name, c.no " + 
			 		"from class c join user u on u.id = c.cre_id " + 
			 		"join category ct on ct.no = c.category_no " + 
			 		"where category_no = ? " +
			 		"order by c.no asc limit 4";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cudto.getClassinfo().getCategory().getNo());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cudto = new CurriculumDTO();
				
				ClassDTO cdto = new ClassDTO();	
				UserDTO udto = new UserDTO();
				CategoryDTO catedto = new CategoryDTO();
				
				cdto.setCover_img(rs.getString(1));
				cdto.setTitle(rs.getString(2));
				cudto.setClassinfo(cdto);
				
				udto.setNickname(rs.getString(3));
				cdto.setCreator(udto);
				cudto.setClassinfo(cdto);
				
				catedto.setName(rs.getString(4));
				cdto.setCategory(catedto);
				cudto.setClassinfo(cdto);
				
				cdto.setNo(rs.getInt(5));
				cudto.setClassinfo(cdto);
				
				catev.add(cudto);
				
			}
		} catch (Exception e) {
			System.out.println("categoryinfo()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
		
		
		return catev;
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

	public void insertCurriculum(ArrayList saveFiles, String[] subject, CurriculumDTO curridto) {
			int generatekey =0;
		 try {
	    	  con = getConnection();
	    	  con.setAutoCommit(false);
	    	  
	    	  String sql = "insert into curriculum (thumbnail,major_topic,class_no) values(?,?,?)";
	    	  pstmt = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
	    	  pstmt.setString(1, curridto.getThumbnail());
	    	  pstmt.setString(2, curridto.getMajor_topic());
	    	  pstmt.setInt(3, curridto.getClassinfo().getNo());
	          int result = pstmt.executeUpdate();
	          rs = pstmt.getGeneratedKeys();
	          if(rs.next()){
	        	 generatekey = rs.getInt(1);
	        	 
	          }
	          if(result == 1){
	        	  for(int i=0; i<saveFiles.size(); i++){
	             	sql = "insert into subject(subject,url,curriculum_no) values(?,?,?)";
		        	pstmt = con.prepareStatement(sql);
		        	pstmt.setString(2, String.valueOf(saveFiles.get(i)));
		        	pstmt.setString(1, subject[i]);
		        	pstmt.setInt(3, generatekey);
		        	result = pstmt.executeUpdate();
		        	
		        	if(result == 0){
		        		con.rollback();
		        	}else{
		        		con.commit();
		        	}
	        	  }
	        	  con.setAutoCommit(true);
	          }else{
	        	  result = 0;
	          }
	      }catch(Exception e) {
	    	  System.out.println("insertCurri() 메소드 오류"+e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		
	}

	@Override
	public void insertCurriculum(int classNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Vector<ClassDTO> getAllClassList(String id) {
		Vector<ClassDTO> classList = new Vector<ClassDTO>();
		
		try {
			con = getConnection();
			sql = "select * from class where cre_id=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ClassDTO dto = new ClassDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTitle(rs.getString("title"));
				dto.setCover_img(rs.getString("cover_img"));
				classList.add(dto);
			}
			
			
		} catch (Exception e) {
			System.out.println("getAllClassList()에서 오류"+ e.getMessage());
		}finally {
			freeResource();
	}
		
		return classList;
	}

	

	@Override
	public  Vector<JjimDTO> deleteJjim(int jjimno, String userid) {
		Vector<JjimDTO> cv = new Vector<JjimDTO>(); 
		try {
	    	  con = getConnection();
	    	  sql = "delete from jjim where no = ?";
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, jjimno);
	       
	         pstmt.executeUpdate();
	         
	         sql = "select c.no, c.cover_img, c.title,  c.tuition, u.id, j.no, ct.name, us.nickname "
						+ "from class c join jjim j on j.class_no = c.no "
						+ "join category ct on ct.no = c.category_no "
						+ "join user u on u.id = j.user_id "
						+ "join user us on us.id = c.cre_id "
						+ "where j.user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JjimDTO jdto = new JjimDTO();
					UserDTO udto = new UserDTO();
					ClassDTO cdto = new ClassDTO();
					CategoryDTO catedto = new CategoryDTO();
					
					cdto.setNo(rs.getInt(1));
					cdto.setCover_img(rs.getString(2));
					cdto.setTitle(rs.getString(3));
					cdto.setTuition(rs.getInt(4));
					
					catedto.setName(rs.getString(7));
					cdto.setCategory(catedto);
					
					jdto.setClassinfo(cdto);
					
					udto.setId(rs.getString(5));
					udto.setNickname(rs.getString(8));
					jdto.setUser(udto);
					
					jdto.setNo(rs.getInt(6));
					
					cv.add(jdto);
					
				}
	         
	        
		 }catch(Exception e) {
	         System.out.println("deleteJjim 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		return cv;
		
	
	}
	@Override
	public int jjimchk(String userid, int classno) {
		int check = 0;
		 try {
	    	  con = getConnection();
	    	  sql = "select * from jjim where user_id = ? and class_no = ?";
	    	  pstmt = con.prepareStatement(sql);
	    	  
	    	  pstmt.setString(1, userid);
	    	  pstmt.setInt(2, classno);

	    	  rs = pstmt.executeQuery();
	    	  
	    	  if(rs.next()) {
	    		  check = 1;
	    	  }else {
	    		  check = -1;
	    	  }
	    	  
	    	  
	      }catch(Exception e) {
	         System.out.println("jjimchk 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		
		return check;
	}

	@Override
	public Vector<JjimDTO> selJjim(String userid) {
		Vector<JjimDTO> cv = new Vector<JjimDTO>(); 
		try {
	    	  con = getConnection();
	         
	         sql = "select c.no, c.cover_img, c.title,  c.tuition, u.id, j.no, ct.name, us.nickname "
						+ "from class c join jjim j on j.class_no = c.no "
						+ "join category ct on ct.no = c.category_no "
						+ "join user u on u.id = j.user_id "
						+ "join user us on us.id = c.cre_id "
						+ "where j.user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					JjimDTO jdto = new JjimDTO();
					UserDTO udto = new UserDTO();
					ClassDTO cdto = new ClassDTO();
					CategoryDTO catedto = new CategoryDTO();
					
					cdto.setNo(rs.getInt(1));
					cdto.setCover_img(rs.getString(2));
					cdto.setTitle(rs.getString(3));
					cdto.setTuition(rs.getInt(4));
					
					catedto.setName(rs.getString(7));
					cdto.setCategory(catedto);
					
					jdto.setClassinfo(cdto);
					
					udto.setId(rs.getString(5));
					udto.setNickname(rs.getString(8));
					jdto.setUser(udto);
					
					jdto.setNo(rs.getInt(6));
					
					cv.add(jdto);
					
				}
	         
	        
		 }catch(Exception e) {
	         System.out.println("selJjim 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		return cv;
		
	}

	@Override
	public Vector<JjimDTO> jjimRegister(String userid, int classno) {
		Vector<JjimDTO> cv = new Vector<JjimDTO>();
		JjimDTO jdto = null;
		try {
			con=getConnection();
			sql = "insert into jjim(user_id, class_no) values(?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setInt(2, classno);
			
			pstmt.executeUpdate();
			
			 sql = "select c.no, c.cover_img, c.title,  c.tuition, u.id, j.no, ct.name, us.nickname "
					+ "from class c join jjim j on j.class_no = c.no "
					+ "join category ct on ct.no = c.category_no "
					+ "join user u on u.id = j.user_id "
					+ "join user us on us.id = c.cre_id "
					+ "where j.user_id = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				jdto = new JjimDTO();
				UserDTO udto = new UserDTO();
				ClassDTO cdto = new ClassDTO();
				CategoryDTO catedto = new CategoryDTO();
				
				cdto.setNo(rs.getInt(1));
				cdto.setCover_img(rs.getString(2));
				cdto.setTitle(rs.getString(3));
				cdto.setTuition(rs.getInt(4));
				
				catedto.setName(rs.getString(7));
				cdto.setCategory(catedto);
				
				jdto.setClassinfo(cdto);
				
				udto.setId(rs.getString(5));
				udto.setNickname(rs.getString(8));
				jdto.setUser(udto);
				
				jdto.setNo(rs.getInt(6));
				
				cv.add(jdto);
			}
		} catch (Exception e) {
			System.out.println("jjimRegister()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
		
		
		return cv;
	}
	
	@Override
	public Vector<SubjectDTO> curriInfo(CurriculumDTO cudto) {
		Vector<SubjectDTO> suv = new Vector<SubjectDTO>();
		
		try {
			con=getConnection();
			
			 sql = "select s.subject " + 
			 		"from curriculum cu join subject s on s.curriculum_no = cu.no " + 
			 		"where cu.no = ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cudto.getNo());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				cudto = new CurriculumDTO();
				SubjectDTO sdto = new SubjectDTO();
				
				sdto.setSubject(rs.getString(1));
				
				suv.add(sdto);
				
			}
		} catch (Exception e) {
			System.out.println("curriinfo()에서 오류"+e.getMessage());
		
		}finally {
			freeResource();
		}
		
		
		return suv;
	}
	@Override
	public ClassDTO curriCulumInfo(int classNo) {
			ClassDTO classDto = new ClassDTO();
				
		try {
			//커넥션 풀
			con = getConnection();
			//sql구문
			sql = "select * from class where no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNo);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				
				classDto.setCover_img(rs.getString("cover_img"));
				classDto.setTitle(rs.getString("title"));
				classDto.setDetail_category(rs.getString("detail_category"));
				classDto.setExpiration(rs.getInt("expiration"));
				classDto.setTuition(rs.getInt("tuition"));
				classDto.setContent(rs.getString("content"));
				classDto.setMaterial_img(rs.getString("material_img"));
				classDto.setMaterial_content(rs.getString("material_content"));
								
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
			
		return classDto;
	}

	@Override
	public int buychk(String userid, int no) {
		int bcheck = 0;
		
		try {
	    	  con = getConnection();
	    	  sql = "select * from buyer where user_id = ? and class_no = ?";
	    	  pstmt = con.prepareStatement(sql);
	    	  
	    	  pstmt.setString(1, userid);
	    	  pstmt.setInt(2, no);

	    	  rs = pstmt.executeQuery();
	    	  
	    	  if(rs.next()) {
	    		  bcheck = 1;
	    	  }else {
	    		  bcheck = -1;
	    	  }
	    	  
	    	  
	      }catch(Exception e) {
	         System.out.println("buychk 메소드에서 오류 " + e.getMessage());
	      }finally{
	    	  freeResource();
	      }
		
		return bcheck;
	}
	@Override
	public ClassDTO ModifyClass(ClassDTO dto, int classNo, int curriNo) {
		
		try {
			con = getConnection();
			sql = "update class set title=?, detail_category=?, material_content=?, expiration=?, tuition=? where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getDetail_category());
			pstmt.setString(3, dto.getMaterial_content());
			pstmt.setInt(4, dto.getExpiration());
			pstmt.setInt(5, dto.getTuition());
			pstmt.setInt(6, classNo);
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.getMessage();
		}finally{
			freeResource();
		}
		
		return null;
	}

	@Override
	public CurriculumDTO getCurriNum(int classNo) {
			CurriculumDTO curriDto = new CurriculumDTO();
		try {
			con= getConnection();
			sql = "select * from curriculum where class_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, classNo);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				curriDto.setNo(rs.getInt("no"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			freeResource();
		}
		return curriDto;
		
	}
	
	@Override
	public Vector<SubjectDTO> subjectInfo(int curriNo) {
		Vector<SubjectDTO> v = new Vector<SubjectDTO>();
		
		try {
			//커넥션 풀
			con = getConnection();
			//sql구문
			sql = "select * from subject where curriculum_no=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, curriNo);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				SubjectDTO subjectDto = new SubjectDTO();
				subjectDto.setSubject(rs.getString("subject"));
				subjectDto.setUrl(rs.getString("url"));	
				v.add(subjectDto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
			
		return v;
	}

}//ClassDAOImpl 끝나는 부분
