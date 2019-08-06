package article.three.mapper;

import java.util.List;

import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;
import dto.InterestedClassDTO;
import dto.PopularClassDTO;
import dto.ReplyDTO;
import dto.SubjectDTO;

public interface ReadDAO {

// 메인: 찜 top5 페이지
	List<InterestedClassDTO> interestedTop5Info();

// 메인: 구매자 top5 페이지
	List<PopularClassDTO> popularTop5Info();

// 메인: 카테고리
	List<CategoryDTO> getMainCategory();

// 카테고리별로 들어갔을때
	List<ClassDTO> getCategoryClass(String categoryName);

//	커리큘럼별 댓글
	List<ReplyDTO> getCurriReply(int classno);
	
//	클래스 조회시 커리큘럼 리스트
	List<CurriculumDTO> getCurriculum(CurriculumDTO dto);
	
//	커리큘럼 클릭 시 서브젝트DTO 리턴
	List<SubjectDTO> getVideo(int curriculumNo);
	
	
	List<ReplyDTO> getClassInfoReply(ClassDTO dto);
	/*
	 * 메인 content 영역 하위 클래스 답글 영역 sql = "SELECT * FROM reply WHERE classNo=? AND
	 * group =1 ORDER BY date;"
	 */
	
}
