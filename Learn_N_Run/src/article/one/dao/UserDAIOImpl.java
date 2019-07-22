package article.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BuyerDTO;
import dto.CouponDTO;
import dto.JjimDTO;
import dto.MessageDTO;
import dto.UserDTO;

public class UserDAIOImpl implements UserDAO{

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	String sql="";
	
	/*connection객체 얻기 메소드*/
	private Connection getConnection() throws Exception{
		Connection con = null;
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/learnrun");
		con = ds.getConnection();
		return con;
	}
	
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
	

	
	@Override
	public void addUser(UserDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateUser(UserDTO dto, String pass) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void delUser(UserDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//로그인 시 아이디체크 메소드
	@Override
	public int userCheck(String id, String pass) {
			int check = 0;
			try {
				con = getConnection();
				sql = "select* from user where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (pass.equals(rs.getString("pass"))) {
						check = 1;
					} else { 
						check = 0; 
					}
				} else { 
					check = -1;
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				freeResource();
			}
			return check;
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO UserInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String creatorCheck(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCreator(UserDTO bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	//메세지 보내기
	@Override
	public int sendMessage(MessageDTO dto, String send_id) {
		int RightIdCheck =0;
		sql = "select id from user where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getReceiver_user().getId());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "insert into message(send_id,receiver_id,content,send_time,read_yn) values(?,?,?,now(),0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, send_id);
				pstmt.setString(2, dto.getReceiver_user().getId());
				pstmt.setString(3, dto.getContent());
				pstmt.executeUpdate();
				RightIdCheck = 0;
			}else {
				RightIdCheck = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return RightIdCheck;
		
	}

	@Override
	public void sendMail(String receiver, String code_check) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int countReadMessage(String id) {
		// TODO Auto-generated method stub
		return 0;
	}

	//쪽지함 클릭했을때.
	@Override
	public List<MessageDTO> getMessage(MessageDTO dto,String id) {
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		try {
			con = getConnection();
			sql = "select* from message where receiver_id=? order by send_time";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			UserDTO udto = new UserDTO();
			
			while (rs.next()) {
				dto = new MessageDTO();
				dto.setNo(rs.getInt("no"));
				udto.setId(rs.getString("send_id"));
				dto.setSend_user(udto);
				dto.setContent(rs.getString("content"));
				dto.setSend_time(rs.getTimestamp("send_time"));
				dto.setRead_yn(rs.getInt("read_yn"));
				System.out.println(dto);
				list.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return list;
	}

	//메세지 상세보기 페이지
	@Override
	public MessageDTO getMessageInfo(int MessageNo) {
		MessageDTO dto = new MessageDTO();
		try {
			con = getConnection();
			sql = "select * from message where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, MessageNo);
			rs = pstmt.executeQuery();
			
			UserDTO udto = new UserDTO();
			if(rs.next()) {
				udto.setId(rs.getString("send_id"));
				dto.setSend_user(udto);
				dto.setContent(rs.getString("content"));
				dto.setSend_time(rs.getTimestamp("send_time"));
				
				if(rs.getInt("read_yn")==0) {
				sql = "update message set read_yn=1 where no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, MessageNo);
				pstmt.executeUpdate();
				dto.setRead_yn(rs.getInt("read_yn"));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
		return dto;
	}

	//메세지 삭제
	@Override
	public void delMessage(int no) {
		sql = "delete from message where no=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
	}

	@Override
	public CouponDTO myCouponInfo(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int buyClass(int classNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CouponDTO CouponClass(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addBuy(BuyerDTO bean, String id, int classNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public JjimDTO getJjim(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//3번 쿠폰 받기. 
	@Override
	public int getCoupon3(CouponDTO dto, String id) {
		
		return 0;
	}
	
	//이벤트 페이지 유저 이메일 정보 뿌려주기.
	@Override
	public String getEmail(String id) {
		String email = "";
		sql = "select * from user where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString("email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return email;
	}
	
}
