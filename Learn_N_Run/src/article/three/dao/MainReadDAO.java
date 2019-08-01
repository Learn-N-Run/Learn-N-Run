package article.three.dao;

import java.util.List;

import lombok.dto.BuyerDTO;
import lombok.dto.ClassDTO;
import lombok.dto.CurriculumDTO;

public interface MainReadDAO {

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
