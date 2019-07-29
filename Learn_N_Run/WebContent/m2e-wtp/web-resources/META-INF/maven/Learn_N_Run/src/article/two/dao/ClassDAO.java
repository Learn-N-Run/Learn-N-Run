package article.two.dao;

import java.util.List;

import dto.BuyerDTO;
import dto.CategoryDTO;
import dto.ClassDTO;
import dto.CurriculumDTO;

public interface ClassDAO {

	// �겢�옒�뒪 �깮�꽦遺�遺�.
	void addClass(String id, ClassDTO dto);

	/*
	 * Class�깮�꽦 �겢由��떆 Class�젙蹂대�� 異붽��떆�궡. sql = "INSERT INTO class (cre_id) VALUES (?);
	 */
	void updateClass(ClassDTO dto);

	/*
	 * Class�깮�꽦 �럹�씠吏��뿉�꽌 �떎�쓬�떒怨꾨�� �늻瑜대㈃ curriculum update�떆�궎怨�, 而ㅻ━�걯�읆No媛� insert源뚯� �떆�궎湲�. sql =
	 * "UPDATE class
	 * "SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
	 * sql = "INSERT INTO curriculum (class_no) VALUES (?);
	 */
	void insertCurriculum(int classNo);

	/*
	 * �냼二쇱젣3源뚯� �옉�꽦�썑�뿉 異붽��빐�꽌 �룞�쁺�긽 異붽��떆. sql =
	 * "INSERT INTO curriculum (class_no) VALUES (?);"
	 */
	void delCurriculum(int curriculmNo);

	/*
	 * 而ㅻ━�걯�읆 �궘�젣�떆. sql = "DELETE FROM curriculm WHERE no=?;"
	 * 
	 */
	ClassDTO updateCurriculum(CurriculumDTO dto);

	/*
	 * Curriculum�럹�씠吏��뿉�꽌 �떎�쓬�떒怨� �늻瑜쇱떆 curriculum update, class�뿉 �닔媛뺣즺 update sql = "INSERT
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
	 * Session.setAttribute("class_no"); bank�뿉 class_no媛믪씠 �엳�쑝硫�, 洹몃９ �솗�씤�빐�꽌 �뾽濡쒕뱶 �맂嫄몃줈 媛꾩＜�븯怨�
	 * List�뿉�꽌 肉뚮젮二쇨쾶. bank�뿉 class_no媛믪씠 �뾾�쑝硫�, upload�븞�븷嫄몃줈�븯怨� List�뿉 �븞肉뚮젮二쇨쾶 . 利�, �걹源뚯� �떎�븯硫� �뾽濡쒕뱶.
	 * 
	 */
	ClassDTO ModifyClass(ClassDTO dto);

	/*
	 * �겢�옒�뒪 �젙蹂� �닔�젙�닃���쓣�븣 get諛⑹떇�쑝濡� classNo 媛믩꽆寃⑥＜怨�, ClassBean媛앹껜�뿉 媛숈씠 ���옣�떆耳쒖꽌 dao�뿉 �꽆寃⑥빞�븿 sql =
	 * "SELECT * FROM class where no=?";
	 */
	CurriculumDTO ModifyCurriculum(CurriculumDTO dto);

	/*
	 * �겢�옒�뒪 �닔�젙�썑 �떎�쓬�떒怨� �닃���쓣�븣.. sql = "UPDATE class
	 * "SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
	 * "SELECT * FROM curriculum where class_no=?";
	 */
	void delClass(ClassDTO dto);
	/*
	 * Class table�뿉 ���옣�릺�뼱 �엳�뒗 No媛믪쓣 �궘�젣�빐踰꾨┝. 怨좎쑀 No�궘�젣�븯硫�, �옄�룞�쑝濡� �븯�쐞�빆紐⑷퉴吏� 紐⑤몢 �궘�젣�릺�뒗吏� �솗�씤源뚯� �븘�닔.
	 * ClassBean �궘�젣�븯硫� �겢�옒�뒪 �븯�쐞 �빆紐⑸뱾 �궘�젣�맆 �닔�엳寃�. sql = "DELETE FROM class WHERE no=?";
	 * 
	 */

	// �겢�옒�뒪 �긽�꽭蹂닿린 �럹�씠吏�
	ClassDTO classInfo(ClassDTO dto);
	/*
	 * 硫붿씤 content�쁺�뿭 + �슦痢� nav諛� �쁺�뿭 �뿬湲곗꽌 �궡�럹�씠吏��룄 �닔媛뺤떊泥� 媛��뒫�븳吏� �쉶�쓽�빐蹂닿린.�븘�땲硫� select �븳踰� �뜑�빐�빞�븿. sql =
	 * "SELECT c.cover_img, c.detail_info, c.material_image,
	 * c.material_content,u.url,u.nickname FROM class c JOIN user u ON c.cre_id =
	 * u.id";
	 */

	List<CategoryDTO> categoryInfo(CategoryDTO dto);
	/*
	 * 鍮꾩듂�븳 移댄뀒怨좊━ sql = "SELECT c.comver_img, c.title FROM class c JOIN category ct ON
	 * c.category_no = ct.no WHERE ct.name=? ORDER BY LIMIT 4;"
	 */

	List<BuyerDTO> myClassList(BuyerDTO dto);
	/*
	 * �궡 �닔媛뺣즺
	 * 
	 */
}
