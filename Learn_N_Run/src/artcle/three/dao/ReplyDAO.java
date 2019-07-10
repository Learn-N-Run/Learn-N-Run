package artcle.three.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.ReplyDTO;

public interface ReplyDAO {

	// 메인페이지 TOP5 페이지
	List top5Info(BuyerDTO bean);
	/*
	 * sql = "SELECT c.cover_img, c.category, c.title, count(b.class_no) AS 'count'
	 * FROM class c inner join buyer b GROUP BY c.cover_img,c.category,c.title ORDER
	 * BY count LIMIT 5;"
	 */

	// 카테고리별로 들어갔을때..
	List<ClassDTO> getCategoryClass(ClassDTO bean);
	/*
	 * sql = "SELECT c.cover_img,cr.name,c.title FROM class c JOIN category ct WHERE
	 * cr.name=?"
	 */

	List<ReplyDTO> getClassInfoReply(ReplyDTO dto);
	/*
	 * 메인 content 영역 하위 클래스 답글 영역 sql = "SELECT * FROM reply WHERE classNo=? AND
	 * group =1 ORDER BY date;"
	 */

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

	List<ReplyDTO> getVideoReply(ReplyDTO dto);
	/*
	 * 동영상 시청부분 클래스 댓글 눌렀을때. 또는 그냥 보여줄때. sql = "SELECT * FROM reply WHERE classNo=?
	 * AND group =0" ORDER BY date;
	 */

	List<CurriculumDTO> getCurriculum(CurriculumDTO dto);
	/*
	 * 커리큘럼 눌렀을때... sql = "SELECT * FROM curriculum WHERE classNo=?"
	 */

	CurriculumDTO getVideo(CurriculumDTO dto, int subjectNo);
	/*
	 * 중간에 다른 커리큘럼의 소주제를 눌렀을때.. sql = "SELECT video FROM subject WHERE
	 * 
	 * !!!!!!!!!!!이부분 고민다시.
	 */
	// 동영상 시청 페이지

}
