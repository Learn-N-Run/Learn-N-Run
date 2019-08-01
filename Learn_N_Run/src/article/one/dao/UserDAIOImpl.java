package article.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BuyerDTO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CouponDTO;
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
	public int addUser(UserDTO dto) {
		int result = 0; // 0: 실패, 1: 성공

		try {
			con = getConnection();
			sql = "INSERT INTO user(name, id, pass, email, user_group_no, joinDate) VALUES(?,?,?,?,1,now())";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass());
			pstmt.setString(4, dto.getEmail());
					
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("addUser()에서 오류: " + e);
		} finally {
			freeResource();
		}
		return result;
	}
		

	@Override
	public void updateUser(UserDTO dto) {
		sql="update user set pass=?, email=?, creator_url=?, profile_img=?, nickname=?, number=?, ";	
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPass());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getCreator_url());
			pstmt.setString(4, dto.getProfile_img());
			pstmt.setString(5, dto.getNickname());
			pstmt.setInt(6, dto.getNumber());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateUser오류: " + e);
		} finally {
			freeResource();
		}
		
	}
	
	@Override
	public int delUser(String id, String pass) {
		int result = 0;
		try {
			con = getConnection();
			sql = "DELETE FROM user WHERE id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			result = pstmt.executeUpdate();
			System.out.println("delUser return:" + result);
			
		} catch (Exception e) {
			System.out.println("delUser 오류: " + e);
		} finally {
			freeResource();
		}
		return result;	
	}
	//아이디 중복검사 메소드
	@Override
	public int idCheck(String id) {
		int result = 1;
		try {
			con = getConnection();
			sql = "select * from user where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = 0;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return result;
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

	//이벤트 페이지 이메일 보내기
	@Override
	public void sendMail(String receiver, String code_check) {
		Properties p = System.getProperties();
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		javax.mail.Authenticator auth = new MyAuthentication();

		Session session = Session.getDefaultInstance(p, auth);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());
			Address from = new InternetAddress("Learn&Run");
			msg.setFrom(from);

			InternetAddress to = new InternetAddress(receiver);
			msg.setRecipient(Message.RecipientType.TO, to);

			msg.setSubject("Learn&Run 인증번호 입니다.", "UTF-8");

			msg.setText("인증번호 :" + code_check, "UTF-8");
			msg.setHeader("content-Type", "text/html");

			javax.mail.Transport.send(msg);
			System.out.println("이메일 보냄!");

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//안읽은 쿠폰 갯수 확인.
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

	//나의 쿠폰 정보 확인 메소드
	@Override
	public CouponDTO myCouponInfo(String id) {
		CouponDTO dto = null;
		try {
			sql = "SELECT * from coupon where user_id=?";
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			dto = new CouponDTO();
			if(rs.next()) {
			 	dto.setSale1(rs.getInt("sale1"));
			 	dto.setSale2(rs.getInt("sale2"));
			 	dto.setSale3(rs.getInt("sale3"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return dto;
	}

	//클래스 구매버튼 눌렀을때, 클래스 정보 확인 메소드
	@Override
	public ClassDTO buyClass(int classNo) {
		sql = "select * from class where no=?";
		ClassDTO dto = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, classNo);
			rs = pstmt.executeQuery();
			dto = new ClassDTO();
			if(rs.next()) {
				dto.setCover_img(rs.getString("cover_img"));
				dto.setTitle(rs.getString("title"));
				dto.setMaterial_img(rs.getString("material_img"));
				dto.setMaterial_content(rs.getString("material_content"));
				dto.setTuition(rs.getInt("tuition"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		
		return dto;
	}

	
	//class 구매(쿠폰있음)
	@Override
	public void addBuy(BuyerDTO bean, CouponDTO cdto, String id, int classNo) {
		sql = "insert into receiver_info (name,number,address1,address2,address3,delievery_msg) values (?,?,?,?,?,?)";
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getReceiver().getName());
			pstmt.setInt(2, bean.getReceiver().getNumber());
			pstmt.setString(3, bean.getReceiver().getAddress1());
			pstmt.setString(4, bean.getReceiver().getAddress2());
			pstmt.setString(5, bean.getReceiver().getAddress3());
			pstmt.setString(6, bean.getReceiver().getDelievery_msg());
			int result = pstmt.executeUpdate();
			if(result == 1) {
				sql = "insert into buyer(user_id,receiver_info_no,last_tuition,order_date,class_no) "
						+ "values(?,(select no from receiver_info order by no desc limit 1),?,now(),?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				System.out.println(id);
				pstmt.setInt(2, bean.getLast_tuition());
				System.out.println(bean.getLast_tuition());
				pstmt.setInt(3, classNo);
				System.out.println(classNo);
				int result2 = pstmt.executeUpdate();
				if(result2 == 1) {
					if(cdto.getSale1()==1) {
						sql = "update coupon set sale1 = 0";
					}else if(cdto.getSale2()==1) {
						sql = "update coupon set sale2 = 0";
					}else if(cdto.getSale3()==1) {
						sql = "update coupon set sale3 = 0";
					}
					pstmt = con.prepareStatement(sql);
					pstmt.executeUpdate();
				}else {
					con.rollback();
				}
			}else {
				con.rollback();
			}
			con.commit();
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();	
		}
		
	}
	
	//class 구매(쿠폰없음)
	@Override
	public void addBuy(BuyerDTO bean, String id, int classNo) {
		sql = "insert into receiver_info (name,number,address1,address2,address3,delievery_msg) values (?,?,?,?,?,?)";
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getReceiver().getName());
			pstmt.setInt(2, bean.getReceiver().getNumber());
			pstmt.setString(3, bean.getReceiver().getAddress1());
			pstmt.setString(4, bean.getReceiver().getAddress2());
			pstmt.setString(5, bean.getReceiver().getAddress3());
			pstmt.setString(6, bean.getReceiver().getDelievery_msg());
			int result = pstmt.executeUpdate();
			if(result == 1) {
				sql = "insert into buyer(user_id,receiver_info_no,last_tuition,order_date,class_no) "
						+ "values(?,(select no from receiver_info order by no desc limit 1),?,now(),?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setInt(2, bean.getLast_tuition());
				pstmt.setInt(3, classNo);
				pstmt.executeUpdate();
			}else {
				con.rollback();
			}
			con.commit();
			con.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
				
}
	//1번쿠폰 받기
	@Override
	public int getCoupon1(String id) {
		int register = 1;
		sql = "select sale1 from coupon where sale1=0 AND user_id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					sql = "update coupon set sale1=1 where user_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
			}else {
				register = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return register;
	}
	
	//3번 쿠폰 받기. 
	@Override
	public int getCoupon3(String id) {
		int register = 1;
		sql = "select sale1 from coupon where sale3=0 AND user_id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sql = "select * from user where user_group_no=2 AND id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					sql = "update coupon set sale3=1 where user_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.executeUpdate();
				}else {
					register = -1;
				}
			}else {
				register = 0;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return register;
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

	public List getMyclassInfo(String id) {
		ArrayList list = new ArrayList();	
		sql = "SELECT c.cover_img,c.title, c.title,b.order_date, DATE_ADD(b.order_date, INTERVAL c.expiration DAY) as expiration, "
				+ "cate.name FROM class c "
				+ "JOIN buyer b ON (c.no=b.class_no) "
				+ "JOIN user u ON (u.id=b.user_id) "
				+ "JOIN category cate ON(c.category_no=cate.no) where u.id=?";
			try {
		con = getConnection();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs != null){
			while(rs.next()){
				ClassDTO cdto = new ClassDTO();
				BuyerDTO bdto = new BuyerDTO();
				BuyerDTO bdto1 = new BuyerDTO();
				CategoryDTO catedto = new CategoryDTO();
				cdto.setCover_img(rs.getString("c.cover_img"));	
				cdto.setTitle(rs.getString("c.title"));
				bdto.setOrder_date(rs.getTimestamp("expiration"));
				bdto1.setOrder_date(rs.getTimestamp("b.order_date"));
				catedto.setName(rs.getString("cate.name"));
				list.add(cdto);
				list.add(bdto);
				list.add(catedto);	
			}
		}else{
			return null;
		}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				freeResource();
			}
		
		return list;
	}

	public int getUserGroup(String userid) {
		int Group =0;
		String sql ="SELECT user_group_no FROM user where id=?";
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Group = rs.getInt("user_group_no");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return Group;
	}

	public UserDTO getUserInfo(String id) {
		String sql ="SELECT * FROM user where id=?";
		UserDTO dto = new UserDTO();
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setCreator_url(rs.getString("creator_url"));
				dto.setEmail(rs.getString("email"));
				dto.setName(rs.getString("name"));
				dto.setPass(rs.getString("pass"));
				dto.setProfile_img(rs.getString("profile_img"));
				dto.setNickname(rs.getString("nickname"));
				dto.setNumber(rs.getInt("number"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			freeResource();
		}
		return dto;
	}
	
}

//메일 보내기 위한 g메일 아이디 비밀번호 저장.
class MyAuthentication extends javax.mail.Authenticator {
	javax.mail.PasswordAuthentication pa;

	public MyAuthentication() {
		String id = "seunghak173";
		String pw = "gkrtmd12";

		pa = new javax.mail.PasswordAuthentication(id, pw);
	}

	public javax.mail.PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}
}


