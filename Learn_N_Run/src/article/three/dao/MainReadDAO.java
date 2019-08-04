package article.three.dao;

import java.util.List;

import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.ReplyDTO;

public interface MainReadDAO {

	// 메인페이지 TOP5 페이지
	List<ClassDTO> top5Info();
	/*
	 * sql = "SELECT c.cover_img, c.category, c.title, count(b.class_no) AS 'count'
	 * FROM class c inner join buyer b GROUP BY c.cover_img,c.category,c.title ORDER
	 * BY count LIMIT 5;"
	 */

	/* 카테고리 검색 */
	List<CategoryDTO> getMainCategory();
	/* 
	 * SELECT * FROM CATEGORY 
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
