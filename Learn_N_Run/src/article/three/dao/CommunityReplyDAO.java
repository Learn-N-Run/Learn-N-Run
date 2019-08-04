package article.three.dao;

import java.util.List;

import dto.ClassDTO;
import dto.ReplyDTO;

public interface CommunityReplyDAO {


	// 클래스 댓글
	void addClassReply(ReplyDTO dto);

	/*
	 * 답글 작성후, 추가 버튼 클릭했을때... sql = " INSERT INTO reply
	 * (content,reply_id,class_no,group,date) VALUES (?,?,?,1,sysdate);"
	 */
	int delClassReply(ReplyDTO dto, String id);

	/*
	 * 답글 삭제버튼클릭시, 그 클래스 아이디와 로그인한 아이디 값이 일치하면 삭제가능, 또한 자신이 작성한 답글이면 삭제가능하게. sql =
	 * "SELECT c.id ,p.user_id FROM class c JOIN reply p ON p.class_no = c.no;"
	 * WHERE p.user_id=?;" rs.getString("c.id"); if(id == c.id || id == p.user_id ){
	 * "DELETE FROM reply where no=?";}
	 */
	// 커뮤니티 댓글
	void addCommunityReply(ReplyDTO dto, String id);
	/*
	 * 답글 작성후, 추가 버튼 클릭했을때... sql = " INSERT INTO reply
	 * (content,reply_id,class_no,group,date) VALUES (?,id,?,1,sysdate);"
	 */

	int delCommunityReply(ReplyDTO dto, String id);
	/*
	 * 답글 삭제버튼클릭시, 그 클래스 아이디와 로그인한 아이디 값이 일치하면 삭제가능, 또한 자신이 작성한 답글이면 삭제가능하게. sql =
	 * "SELECT c.id ,p.reply_id FROM class c JOIN reply p ON p.class_no = c.no;"
	 * WHERE p.reply_id=? OR c.id=?;"
	 * 
	 * rs.getString("c.id"); if(id == c.id || id == p.user_id ){
	 * "DELETE FROM reply where no=?";}
	 */
	
	List<ReplyDTO> getClassInfoReply(ClassDTO dto);
	/*
	 * 메인 content 영역 하위 클래스 답글 영역 sql = "SELECT * FROM reply WHERE classNo=? AND
	 * group =1 ORDER BY date;"
	 */
}
