package article.one.dao;
/*
	DB�뿰�룞遺�遺�.

 */

import java.util.List;

import lombok.dto.BuyerDTO;
import lombok.dto.CouponDTO;
import lombok.dto.JjimDTO;
import lombok.dto.MessageDTO;
import lombok.dto.UserDTO;

public interface UserDAO {

	// �쑀�� 遺�遺�.

	void addUser(UserDTO dto);

	/*
	 * �쑀�� 異붽� sql = "INSERT into user(~~,user_group_no) VALUES(?,1); 1踰� �씪諛섏쑀�� 2踰� �겕由ъ뿉�씠�꽣
	 */
	int updateUser(UserDTO dto, String pass);

	/*
	 * �쑀�� 媛쒖씤�젙蹂� �닔�젙, pass媛� select�빐�꽌 �솗�씤�썑, update�떆�궡 ResultSet媛� �씤�듃�삎�쑝濡� 諛쏆븘�꽌, �쑀�슚�꽦寃��궗. sql =
	 * "SELECT pass from user where pass=?" sql =
	 * "UPDATE user SET pass=?, WHERE pass=?"
	 */
	void delUser(UserDTO dto);

	/*
	 * �쑀�� �궘�젣 鍮꾨�踰덊샇 媛� �솗�씤, id而щ읆 �궘�젣. sql = "SELECT pass from user where pass=?" DELETE
	 * FROM user id=?"
	 */
	int idCheck(String id);

	/*
	 * (�쉶�썝媛��엯 �떆)�쑀�� �븘�씠�뵒 以묐났寃��궗 �솗�씤. //sql = "SELECT* FROM user where id=?"
	 */
	int userCheck(String id, String pass);

	/*
	 * (濡쒓렇�씤 �떆)�궗�슜�옄 �븘�씠�뵒,鍮꾨�踰덊샇 �솗�씤. sql = "SELECT* FROM user where id=?" return String id
	 * session.setAttribute("id");
	 */
	int emailCheck(String email);

	/*
	 * �쑀�� �씠硫붿씪 以묐났寃��궗 �솗�씤. sql = "SELECT* FROM user where email=?"
	 * 
	 */
	UserDTO UserInfo(String id);

	/*
	 * �쑀���젙蹂� 媛��졇���꽌 肉뚮젮二쇨린. sql = "SELECT* FROM user where id=?"
	 */
	String creatorCheck(String id);

	/*
	 * �쑀��媛� �겕由ъ뿉�씠�꽣�씤吏�, �씪諛섏쑀���씤吏� �솗�씤 �븯湲� �쐞�븿. sql = "SELECT g.name FROM user AS u join
	 * user_group AS g ON g.no = g.user_group_no WHERE u.id=?"
	 * 
	 * return String idGroup <c:test ${SessionScope.idGroup}
	 * requset.getsession.setAttribute("idGroup"); Session session =
	 * request.getSession(); session.setAttribute("idGroup");
	 */
	int updateCreator(UserDTO bean);
	/*
	 * �겕由ъ뿉�씠�꽣 �벑湲� �삱由ш린, url,nickname,profileimg, 蹂몄씤�씤利� email�솗�씤�썑. User�뿉 �뾽�뜲�씠�듃�떆,
	 * UserGroup(踰덊샇 踰덇꼍). sql = "UPDATE user SET url=?, nickname=?,profile_img=?
	 * user_group_no=2;
	 */

	// �궡 履쎌��븿
	void sendMessage(MessageDTO dto, String id);
	/*
	 * Message蹂대궡湲�. MessageBean媛앹껜瑜� �꽆源� sql = "INSERT INTO message
	 * (send_id,receiver_id,content,send_time,read_yn); "VALUES (id,?,?,sysdate,0);
	 */

	// 硫붿씪 蹂대궡湲곕�遺�.
	void sendMail(String receiver, String code_check);
	// 諛쏅뒗 �궗�엺 �씠硫붿씪二쇱냼, �씤利앸쾲�샇.
	// �삎�꽍�씠�뻾�떂.
	// ---------------------------------------------------------------user

	int countReadMessage(String id);
	/*
	 * �뱾怨좎��꽌, return�빐二쇨린. sql =
	 * "SELECT COUNT(read_yn) FROM message WHERE read_yn = 0;";
	 */

	List<MessageDTO> getMessage(MessageDTO bean, String id);
	/*
	 * 諛쏆� 硫붿꽭吏��븿 �쟾泥� 蹂닿린. sql = "SELECT * FROM message where receiver_id= ?";
	 */

	MessageDTO getMessageInfo(int MessageNo);
	/*
	 * 硫붿꽭吏� �긽�꽭蹂닿린 硫붿꽭吏� 踰덊샇媛믪쓣 �꽆寃⑥＜怨�, select�빐�꽌 �꽆寃⑥� 媛믪뿉 �빐�떦�븯�뒗 硫붿꽭吏� �젙蹂댁텧�젰, update�떆耳쒖꽌 read_yn媛�
	 * 1利앷��떆�궡. �씫�쓬/�븞�씫�쓬 �몴�떆瑜� �쐞�빐 sql = "SELECT * FROM message WHERE no=?;
	 * if(rs.getInt("read_yn") ==1) "UPDATE message SET read_yn=1";
	 */

	void delMessage(int no);
	/*
	 * sql="DELETE FROM message where no=?;"
	 */

//-------------------------------------------------------------------履쎌�二쇨퀬諛쏄린, �룞�쁺�긽 媛뺤쓽遺�遺꾩뿉 �뙎湲�遺�遺�.

	// 荑좏룿�븿 �럹�씠吏�
	CouponDTO myCouponInfo(String id);
	/*
	 * �궡 荑좏룿�븿 �닃���쓣�븣... sql = "SELECT * FROM coupon WHERE user_id=?";
	 */

	// �겢�옒�뒪 寃곗젣 �럹�씠吏�
	int buyClass(int classNo);
	/*
	 * 寃곗젣 �떊泥� �닃���쓣�븣.. sql = "SELECT tuition FROM class where no = ?"
	 * 
	 */

	CouponDTO CouponClass(String id);
	/*
	 * 荑좏룿 �쟻�슜 �닃���쓣�븣.. sql = "SELECT * FROM coupon WHERE user_id=?"; �뾾�쑝硫� �뾾�떎怨� �쓣�슦怨� �엳�쑝硫�
	 * �궗�슜�븷�닔�엳寃뚰븿.
	 */

	void addBuy(BuyerDTO bean, String id, int classNo);
	/*
	 * 
	 * 寃곗젣�븯湲� 踰꾪듉�닃���쓣�븣..
	 * 
	 * session�쁺�뿭�뿉���옣.
	 */

	// 李쒕ぉ濡� �럹�씠吏�
	JjimDTO getJjim(String id);
	/*
	 * �궡 李쒕ぉ濡� �닃���쓣�븣... SELECT cover_img, title,
	 */

}
