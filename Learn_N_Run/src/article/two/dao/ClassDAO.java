package artcle.two.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;

public interface ClassDAO {

	// 클래스 생성부분.
	void addClass(String id, ClassDTO dto);

	/*
	 * Class생성 클릭시 Class정보를 추가시킴. sql = "INSERT INTO class (cre_id) VALUES (?);
	 */
	void updateClass(ClassDTO dto);

	/*
	 * Class생성 페이지에서 다음단계를 누르면 curriculum update시키고, 커리큘럼No값 insert까지 시키기. sql =
	 * "UPDATE class
	 * "SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
	 * sql = "INSERT INTO curriculum (class_no) VALUES (?);
	 */
	void insertCurriculum(int classNo);

	/*
	 * 소주제3까지 작성후에 추가해서 동영상 추가시. sql =
	 * "INSERT INTO curriculum (class_no) VALUES (?);"
	 */
	void delCurriculum(int curriculmNo);

	/*
	 * 커리큘럼 삭제시. sql = "DELETE FROM curriculm WHERE no=?;"
	 * 
	 */
	ClassDTO updateCurriculum(CurriculumDTO dto);

	/*
	 * Curriculum페이지에서 다음단계 누를시 curriculum update, class에 수강료 update sql = "INSERT
	 * INTO subject (title,video) VALUES ('?','?'),('?','?'),('?','?');"
	 * 
	 * sql = "UPDATE curriculum cr , class c SET cr.thumbnail=?,cr.major_topic,
	 * c.subject_no=?, c.subject_no1=?, c.subject_no2=? c.tuition=?"; WHERE cr.no=?
	 * AND c.no=?;"
	 * 
	 * sql = " SELECT u.id,u.number,count(cr.major_topic) FROM user u JOIN class c
	 * ON u.id=c.cre_id JOIN curriculum cr ON c.no= cr.class_no GROUP BY
	 * u.id,u.number;"
	 */
	void uploadClass(ClassDTO dto);

	/*
	 * sql = "UPDATE class SET tuition=?" "INSERT INTO bank (bank_number, class_no,
	 * bank_name_no, group) VALUES (?,?,SELECT no FROM bank_name where name=? ,?);
	 * 
	 * Session.setAttribute("class_no"); bank에 class_no값이 있으면, 그룹 확인해서 업로드 된걸로 간주하고
	 * List에서 뿌려주게. bank에 class_no값이 없으면, upload안할걸로하고 List에 안뿌려주게 . 즉, 끝까지 다하면 업로드.
	 * 
	 */
	ClassDTO ModifyClass(ClassDTO dto);

	/*
	 * 클래스 정보 수정눌렀을때 get방식으로 classNo 값넘겨주고, ClassBean객체에 같이 저장시켜서 dao에 넘겨야함 sql =
	 * "SELECT * FROM class where no=?";
	 */
	CurriculumDTO ModifyCurriculum(CurriculumDTO dto);

	/*
	 * 클래스 수정후 다음단계 눌렀을때.. sql = "UPDATE class
	 * "SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
	 * "SELECT * FROM curriculum where class_no=?";
	 */
	void delClass(ClassDTO dto);
	/*
	 * Class table에 저장되어 있는 No값을 삭제해버림. 고유 No삭제하면, 자동으로 하위항목까지 모두 삭제되는지 확인까지 필수.
	 * ClassBean 삭제하면 클래스 하위 항목들 삭제될 수있게. sql = "DELETE FROM class WHERE no=?";
	 * 
	 */

	// 클래스 상세보기 페이지
	ClassDTO classInfo(ClassDTO dto);
	/*
	 * 메인 content영역 + 우측 nav바 영역 여기서 내페이지도 수강신청 가능한지 회의해보기.아니면 select 한번 더해야함. sql =
	 * "SELECT c.cover_img, c.detail_info, c.material_image,
	 * c.material_content,u.url,u.nickname FROM class c JOIN user u ON c.cre_id =
	 * u.id";
	 */

	List<CategoryDTO> categoryInfo(CategoryDTO dto);
	/*
	 * 비슷한 카테고리 sql = "SELECT c.comver_img, c.title FROM class c JOIN category ct ON
	 * c.category_no = ct.no WHERE ct.name=? ORDER BY LIMIT 4;"
	 */

	List<BuyerDTO> myClassList(BuyerDTO dto);
	/*
	 * 내 수강료
	 * 
	 */
}
