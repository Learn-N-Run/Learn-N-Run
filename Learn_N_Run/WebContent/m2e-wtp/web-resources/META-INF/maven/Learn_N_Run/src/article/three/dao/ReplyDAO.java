package article.three.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.ReplyDTO;

public interface ReplyDAO {


	List<ReplyDTO> getClassInfoReply(ReplyDTO dto);
//	sql = "SELECT * FROM reply WHERE classNo=? AND

	void addClassReply(ReplyDTO dto);
//	sql = " INSERT INTO reply * (content,reply_id,class_no,group,date) VALUES (?,?,?,1,sysdate)"	

	int delClassReply(ReplyDTO dto, String id);
//	sql = "SELECT c.id ,p.user_id FROM class c JOIN reply p ON p.class_no = c.no;" WHERE p.user_id=?;" rs.getString("c.id"); if(id == c.id || id == p.user_id ){"DELETE FROM reply where no=?";
	
	void addCommunityReply(ReplyDTO dto, String id);
//	sql = " INSERT INTO reply * (content,reply_id,class_no,group,date) VALUES (?,id,?,1,sysdate);"

	int delCommunityReply(ReplyDTO dto, String id);
//	"SELECT c.id ,p.reply_id FROM class c JOIN reply p ON p.class_no = c.no;" WHERE p.reply_id=? OR c.id=?;"rs.getString("c.id"); if(id == c.id || id == p.user_id ){"DELETE FROM reply where no=?";

	List<ReplyDTO> getVideoReply(ReplyDTO dto);
//	sql = "SELECT * FROM reply WHERE classNo=? AND group =0" ORDER BY date;

}
