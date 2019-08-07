package article.three.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ClassDTO;
import dto.ReplyDTO;

public class ReplyDAOImpl implements ReplyDAO{

   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   
   /*자원해제 메소드*/
	public void freeResource() {

		if (con != null)
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (rs != null)
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
   
   public void getCon() {
      try {
         
         Context init = new InitialContext();
         
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/learnrun");
         
         con = ds.getConnection(); 

      } catch (Exception err) {
         err.printStackTrace();
      }

   }// getCon()메소드 끝
   
   @Override
   public ArrayList<ReplyDTO> getClassInfoReply(ClassDTO dto) {
      
      ArrayList<ReplyDTO> r = new ArrayList<ReplyDTO>();
     
      ReplyDTO bean = null;

      try {
        
         getCon();
       
         String sql = "select * from Reply WHERE class_no='"+dto.getNo()+"' ORDER BY date desc";
         System.out.println(sql);
         
         
         pstmt = con.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         while (rs.next()) {
            bean = new ReplyDTO();
            bean.setNo(rs.getInt(1)); 
            bean.setContent(rs.getString(2));
            bean.setDate(rs.getTimestamp(3));
            bean.setGroup(rs.getInt(4));
            bean.setReply_id(rs.getString(5));
            bean.setClass_no(rs.getInt(6));
            bean.setCurriculum_no(rs.getInt(7));
            
            // 다 저장된 빈객체를 백터에 저장
            r.add(bean);
         }
         // DB연결객체 커넥션 풀에 반납
         con.close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      return r; // 백터 리턴
      
   }


   @Override
   public void addCommunityReply(ReplyDTO dto) {
      
         try {
            getCon();
            
            String sql ="insert into reply values(null,?,?,1,?,?,?)";
            
            pstmt =con.prepareStatement(sql);


           
            pstmt.setString(1, dto.getContent());
            pstmt.setTimestamp(2, dto.getDate());
            
            pstmt.setString(3, dto.getReply_id());
            pstmt.setInt(4, dto.getClass_no());
            pstmt.setInt(5, dto.getCurriculum_no() );
           
            
            pstmt.executeUpdate();      
            
            System.out.println(pstmt);
            con.close();pstmt.close();   
         } catch (Exception e) {
            e.printStackTrace();
         }      
      
   }
	
	@Override
	public void delCommunityReply(int reply_no) {
		
			int result = 0;
			try {
				getCon();
				String sql = "DELETE FROM reply WHERE no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, reply_no);
				result = pstmt.executeUpdate();
				System.out.println("delUser return:" + result);
				
			} catch (Exception e) {
				System.out.println("delUser 오류: " + e);
			} finally {
				freeResource();
			}
			
	}

	@Override
	public void addClassReply(ReplyDTO dto) {
		try {
            getCon();
            
            String sql ="insert into reply values(null,?,?,2,?,?,?)";
            
            pstmt =con.prepareStatement(sql);


           
            pstmt.setString(1, dto.getContent());
            pstmt.setTimestamp(2, dto.getDate());
            
            pstmt.setString(3, dto.getReply_id());
            pstmt.setInt(4, dto.getClass_no());
            pstmt.setInt(5, dto.getCurriculum_no() );
           
            
            pstmt.executeUpdate();      
            
            System.out.println(pstmt);
            con.close();pstmt.close();   
         } catch (Exception e) {
            e.printStackTrace();
         } 
		
	}

	@Override
	public void delClassReply(int reply_no) {
		int result = 0;
		try {
			getCon();
			String sql = "DELETE FROM reply WHERE no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, reply_no);
			result = pstmt.executeUpdate();
			System.out.println("delUser return:" + result);
			
		} catch (Exception e) {
			System.out.println("delUser 오류: " + e);
		} finally {
			freeResource();
		}
		
	}

   
   
}