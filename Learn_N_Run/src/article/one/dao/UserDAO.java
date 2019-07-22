package article.one.dao;
/*
	DB연동부분.

 */

import java.util.List;

import dto.BuyerDTO;
import dto.CouponDTO;
import dto.JjimDTO;
import dto.MessageDTO;
import dto.UserDTO;

public interface UserDAO {

	// 유저 부분.

	void addUser(UserDTO dto);

	/*
	 * 유저 추가 sql = "INSERT into user(~~,user_group_no) VALUES(?,1); 1번 일반유저 2번 크리에이터
	 */
	int updateUser(UserDTO dto, String pass);

	/*
	 * 유저 개인정보 수정, pass값 select해서 확인후, update시킴 ResultSet값 인트형으로 받아서, 유효성검사. sql =
	 * "SELECT pass from user where pass=?" sql =
	 * "UPDATE user SET pass=?, WHERE pass=?"
	 */
	void delUser(UserDTO dto);

	/*
	 * 유저 삭제 비밀번호 값 확인, id컬럼 삭제. sql = "SELECT pass from user where pass=?" DELETE
	 * FROM user id=?"
	 */
	int idCheck(String id);

	/*
	 * (회원가입 시)유저 아이디 중복검사 확인. //sql = "SELECT* FROM user where id=?"
	 */
	int userCheck(String id, String pass);

	/*
	 * (로그인 시)사용자 아이디,비밀번호 확인. sql = "SELECT* FROM user where id=?" return String id
	 * session.setAttribute("id");
	 */
	int emailCheck(String email);

	/*
	 * 유저 이메일 중복검사 확인. sql = "SELECT* FROM user where email=?"
	 * 
	 */
	UserDTO UserInfo(String id);

	/*
	 * 유저정보 가져와서 뿌려주기. sql = "SELECT* FROM user where id=?"
	 */
	String creatorCheck(String id);

	/*
	 * 유저가 크리에이터인지, 일반유저인지 확인 하기 위함. sql = "SELECT g.name FROM user AS u join
	 * user_group AS g ON g.no = g.user_group_no WHERE u.id=?"
	 * 
	 * return String idGroup <c:test ${SessionScope.idGroup}
	 * requset.getsession.setAttribute("idGroup"); Session session =
	 * request.getSession(); session.setAttribute("idGroup");
	 */
	int updateCreator(UserDTO bean);
	/*
	 * 크리에이터 등급 올리기, url,nickname,profileimg, 본인인증 email확인후. User에 업데이트시,
	 * UserGroup(번호 번경). sql = "UPDATE user SET url=?, nickname=?,profile_img=?
	 * user_group_no=2;
	 */

	// 내 쪽지함
	int sendMessage(MessageDTO dto, String id);
	/*
	 * Message보내기. MessageBean객체를 넘김 sql = "INSERT INTO message
	 * (send_id,receiver_id,content,send_time,read_yn); "VALUES (id,?,?,sysdate,0);
	 */

	// 메일 보내기부분.
	void sendMail(String receiver, String code_check);
	// 받는 사람 이메일주소, 인증번호.
	// 형석이행님.
	// ---------------------------------------------------------------user

	int countReadMessage(String id);
	/*
	 * 들고와서, return해주기. sql =
	 * "SELECT COUNT(read_yn) FROM message WHERE read_yn = 0; & receiver_id=?";
	 */

	List<MessageDTO> getMessage(MessageDTO bean, String id);
	/*
	 * 받은 메세지함 전체 보기. sql = "SELECT * FROM message where receiver_id= ?";
	 */

	MessageDTO getMessageInfo(int MessageNo);
	/*
	 * 메세지 상세보기 메세지 번호값을 넘겨주고, select해서 넘겨준 값에 해당하는 메세지 정보출력, update시켜서 read_yn값
	 * 1증가시킴. 읽음/안읽음 표시를 위해 sql = "SELECT * FROM message WHERE no=?;
	 * if(rs.getInt("read_yn") ==1) "UPDATE message SET read_yn=1";
	 */

	void delMessage(int no);
	/*
	 * sql="DELETE FROM message where no=?;"
	 */

//-------------------------------------------------------------------쪽지주고받기, 

	// 쿠폰함 페이지
	CouponDTO myCouponInfo(String id);
	/*
	 * 내 쿠폰함 눌렀을때... sql = "SELECT * FROM coupon WHERE user_id=?";
	 */

	// 클래스 결제 페이지
	int buyClass(int classNo);
	/*
	 * 결제 신청 눌렀을때.. sql = "SELECT tuition FROM class where no = ?"
	 * 
	 */

	CouponDTO CouponClass(String id);
	/*
	 * 쿠폰 적용 눌렀을때.. sql = "SELECT * FROM coupon WHERE user_id=?"; 없으면 없다고 띄우고 있으면
	 * 사용할수있게함.
	 */

	void addBuy(BuyerDTO bean, String id, int classNo);
	/*
	 * 
	 * 결제하기 버튼눌렀을때..
	 * 
	 * session영역에저장.
	 */

	// 찜목록 페이지
	JjimDTO getJjim(String id);
	/*
	 * 내 찜목록 눌렀을때... SELECT cover_img, title,
	 */

}
