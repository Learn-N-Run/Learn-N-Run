package article.three.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.ReplyDTO;

public class CommunityReplyDAOImpl implements MainReadDAO{

   Connection con;
   PreparedStatement pstmt;
   ResultSet rs;
   
   public void getCon() {
      try {
         // 1.WAS서버와 연결된 DBApp웹프로젝트의 모든 정보를 가지고 있는 컨텍스트객체 생성
         Context init = new InitialContext();
         // 2.연결된 WAS서버에서 DataSource(커넥션풀) 검색해서 가져오기
         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/learnrun");
         // DataSource(커넥션풀)에서 DB연동객체 (커넥션) 가져오기
         con = ds.getConnection(); // DB연결

      } catch (Exception err) {
         err.printStackTrace();
      }

   }// getCon()메소드 끝
   
   public ArrayList<ReplyDTO> getClassInfoReply(ClassDTO dto) {
      
      ArrayList<ReplyDTO> r = new ArrayList<ReplyDTO>();
     
      ReplyDTO bean = null;

      try {
        
         getCon();
       
         String sql = "select * from Reply WHERE class_no='"+dto.getNo()+"'";
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


   public void addClassReply(ReplyDTO dto) {
      // TODO Auto-generated method stub
      
   }


   public int delClassReply(ReplyDTO dto, String id) {
      // TODO Auto-generated method stub
      return 0;
   }

  
   public void addCommunityReply(ReplyDTO dto, String id) {
      
         try {
            getCon();//커넥션 풀에서 가져옴
            
            String sql ="insert into reply values(?,?,1,?,?,?)";
            
            pstmt =con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
               
            }

           
            pstmt.setString(1, dto.getContent());
            pstmt.setTimestamp(2, dto.getDate());
            pstmt.setInt(3, dto.getGroup());
            pstmt.setString(4, dto.getReply_id());
            pstmt.setInt(5, dto.getClass_no());
            pstmt.setInt(6, dto.getCurriculum_no() );
           
            
            pstmt.executeUpdate();      
            con.close();pstmt.close();   
         } catch (Exception e) {
            e.printStackTrace();
         }      
      

      
      
   }

   
   public int delCommunityReply(ReplyDTO dto, String id) {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public Vector<ReplyDTO> getVideoReply(ReplyDTO dto) {
      // TODO Auto-generated method stub
      return null;
   }

@Override
public List<ClassDTO> top5Info() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<CategoryDTO> getMainCategory() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<ClassDTO> getCategoryClass(ClassDTO bean) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<ReplyDTO> getClassInfoReply(ReplyDTO dto) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public List<CurriculumDTO> getCurriculum(CurriculumDTO dto) {
	// TODO Auto-generated method stub
	return null;
}

@Override
public CurriculumDTO getVideo(CurriculumDTO dto, int subjectNo) {
	// TODO Auto-generated method stub
	return null;
}

   
   
}