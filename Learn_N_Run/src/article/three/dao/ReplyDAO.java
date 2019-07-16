package article.three.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.ReplyDTO;

public interface ReplyDAO {

	// 硫붿씤�럹�씠吏� TOP5 �럹�씠吏�
	List<BuyerDTO> top5Info(BuyerDTO bean);
	/*
	 * sql = "SELECT c.cover_img, c.category, c.title, count(b.class_no) AS 'count'
	 * FROM class c inner join buyer b GROUP BY c.cover_img,c.category,c.title ORDER
	 * BY count LIMIT 5;"
	 */

	// 移댄뀒怨좊━蹂꾨줈 �뱾�뼱媛붿쓣�븣..
	List<ClassDTO> getCategoryClass(ClassDTO bean);
	/*
	 * sql = "SELECT c.cover_img,cr.name,c.title FROM class c JOIN category ct WHERE
	 * cr.name=?"
	 */

	List<ReplyDTO> getClassInfoReply(ReplyDTO dto);
	/*
	 * 硫붿씤 content �쁺�뿭 �븯�쐞 �겢�옒�뒪 �떟湲� �쁺�뿭 sql = "SELECT * FROM reply WHERE classNo=? AND
	 * group =1 ORDER BY date;"
	 */

	// �겢�옒�뒪 �뙎湲�
	void addClassReply(ReplyDTO dto);

	/*
	 * �떟湲� �옉�꽦�썑, 異붽� 踰꾪듉 �겢由��뻽�쓣�븣... sql = " INSERT INTO reply
	 * (content,reply_id,class_no,group,date) VALUES (?,?,?,1,sysdate);"
	 */
	int delClassReply(ReplyDTO dto, String id);

	/*
	 * �떟湲� �궘�젣踰꾪듉�겢由��떆, 洹� �겢�옒�뒪 �븘�씠�뵒�� 濡쒓렇�씤�븳 �븘�씠�뵒 媛믪씠 �씪移섑븯硫� �궘�젣媛��뒫, �삉�븳 �옄�떊�씠 �옉�꽦�븳 �떟湲��씠硫� �궘�젣媛��뒫�븯寃�. sql =
	 * "SELECT c.id ,p.user_id FROM class c JOIN reply p ON p.class_no = c.no;"
	 * WHERE p.user_id=?;" rs.getString("c.id"); if(id == c.id || id == p.user_id ){
	 * "DELETE FROM reply where no=?";}
	 */
	// 而ㅻ�ㅻ땲�떚 �뙎湲�
	void addCommunityReply(ReplyDTO dto, String id);
	/*
	 * �떟湲� �옉�꽦�썑, 異붽� 踰꾪듉 �겢由��뻽�쓣�븣... sql = " INSERT INTO reply
	 * (content,reply_id,class_no,group,date) VALUES (?,id,?,1,sysdate);"
	 */

	int delCommunityReply(ReplyDTO dto, String id);
	/*
	 * �떟湲� �궘�젣踰꾪듉�겢由��떆, 洹� �겢�옒�뒪 �븘�씠�뵒�� 濡쒓렇�씤�븳 �븘�씠�뵒 媛믪씠 �씪移섑븯硫� �궘�젣媛��뒫, �삉�븳 �옄�떊�씠 �옉�꽦�븳 �떟湲��씠硫� �궘�젣媛��뒫�븯寃�. sql =
	 * "SELECT c.id ,p.reply_id FROM class c JOIN reply p ON p.class_no = c.no;"
	 * WHERE p.reply_id=? OR c.id=?;"
	 * 
	 * rs.getString("c.id"); if(id == c.id || id == p.user_id ){
	 * "DELETE FROM reply where no=?";}
	 */

	List<ReplyDTO> getVideoReply(ReplyDTO dto);
	/*
	 * �룞�쁺�긽 �떆泥�遺�遺� �겢�옒�뒪 �뙎湲� �닃���쓣�븣. �삉�뒗 洹몃깷 蹂댁뿬以꾨븣. sql = "SELECT * FROM reply WHERE classNo=?
	 * AND group =0" ORDER BY date;
	 */

	List<CurriculumDTO> getCurriculum(CurriculumDTO dto);
	/*
	 * 而ㅻ━�걯�읆 �닃���쓣�븣... sql = "SELECT * FROM curriculum WHERE classNo=?"
	 */

	CurriculumDTO getVideo(CurriculumDTO dto, int subjectNo);
	/*
	 * 以묎컙�뿉 �떎瑜� 而ㅻ━�걯�읆�쓽 �냼二쇱젣瑜� �닃���쓣�븣.. sql = "SELECT video FROM subject WHERE
	 * 
	 * !!!!!!!!!!!�씠遺�遺� 怨좊�쇰떎�떆.
	 */
	// �룞�쁺�긽 �떆泥� �럹�씠吏�

}
