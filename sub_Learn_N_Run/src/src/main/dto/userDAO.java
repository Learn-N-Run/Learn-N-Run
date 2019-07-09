package dao;
/*
	DB연동부분.

 */

import java.util.List;

public interface userDAO {
	
	//유저 부분.
	
	void addUser(UserBean bean);			
	/*
				유저 추가
				sql = "INSERT into user(~~,user_group_no) 
				       VALUES(?,1);
				1번 일반유저 2번 크리에이터  
	*/
	int updateUser(UserBean bean, String pass);
	/*
				유저 개인정보 수정, pass값 select해서 확인후, update시킴
				ResultSet값 인트형으로 받아서, 유효성검사.
				sql = "SELECT pass from user where pass=?"
				sql = "UPDATE user SET pass=?, WHERE pass=?"
	*/
	void delUser(UserBean bean);		
	/*		
	 			유저 삭제 비밀번호 값 확인, id컬럼 삭제.
				sql = "SELECT pass from user where pass=?"
					 	DELETE FROM user id=?"
	*/
	int idCheck(String id);
	/*									
				(회원가입 시)유저 아이디 중복검사 확인.
				//sql = "SELECT* FROM user where id=?"
	*/												
	int userCheck(String id,String pass);		
	/*
	 			(로그인 시)사용자 아이디,비밀번호 확인.
				sql = "SELECT* FROM user where id=?"
				return String id
				session.setAttribute("id");
	*/	
	int emailCheck(String email);
	/*			
	 			유저 이메일 중복검사 확인.
				sql = "SELECT* FROM user where email=?"
	
	*/
	UserBean UserInfo(String id);
	/*			
	  			유저정보 가져와서 뿌려주기.
				sql = "SELECT* FROM user where id=?"
	*/
	String creatorCheck(String id);
	/*
	 			유저가 크리에이터인지, 일반유저인지 확인 하기 위함.
				sql = "SELECT g.name 
			         	 FROM user AS u join user_group AS g 
				      	   ON g.no = g.user_group_no 
				        WHERE u.id=?"
							
				 return String idGroup
				 session.setAttribute("idGroup");
	*/
	int updateCreator(UserBean bean);			
	/*
				크리에이터 등급 올리기, url,nickname,profileimg, 본인인증 email확인후.
				User에 업데이트시, UserGroup(번호 번경).
				sql = "UPDATE user 
				          SET url=?, nickname=?,profile_img=? user_group_no=2; 
	*/
	
	//메일 보내기부분.
	void sendMail(String receiver, String code_check);	
	//받는 사람 이메일주소, 인증번호.
	
	//클래스 생성부분.
	void addClass(String id,ClassBean bean);	
	/*			
	  			Class생성 클릭시 Class정보를 추가시킴.
				sql = "INSERT INTO class (cre_id) VALUES (?);
	*/
	void updateClass(ClassBean bean);			
	/*			
	  			Class생성 페이지에서 다음단계를 누르면 curriculum update시키고, 커리큘럼No값 insert까지 시키기.
				sql = "UPDATE class
						"SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
				sql = "INSERT INTO curriculum (class_no) VALUES (?);
	*/
	void insertCurriculum(int classNo);			
	/*
	  			소주제3까지 작성후에 추가해서 동영상 추가시.
				sql = "INSERT INTO curriculum (class_no) VALUES (?);"
	*/
	void delCurriculum(int curriculmNo);		
	/*
				커리큘럼 삭제시.		
				sql = "DELETE FROM curriculm WHERE no=?;"

	*/
	PackageBean updateCurriculum(CurriculumBean bean);		
	/*
	 			Curriculum페이지에서 다음단계 누를시 curriculum update, class에 수강료 update
	 			sql = "INSERT INTO subject (title,video) 
	 						VALUES ('?','?'),('?','?'),('?','?');"
	 			
				sql = "UPDATE curriculum cr , class c
						 SET cr.thumbnail=?,cr.major_topic, c.subject_no=?, c.subject_no1=?, c.subject_no2=? c.tuition=?";
				       WHERE cr.no=? AND c.no=?;"
					
				sql = " SELECT u.id,u.number,count(cr.major_topic)
				    	  FROM user u 
				       	  JOIN class c ON u.id=c.cre_id
				 		  JOIN curriculum cr ON c.no= cr.class_no
				      GROUP BY u.id,u.number;"
	*/
	void uploadClass(ClassBean bean);						
	/*
	 			sql = "UPDATE class
				       SET tuition=?"
				      "INSERT INTO bank (bank_number, class_no, bank_name_no, group)
				       		VALUES 	  (?,?,SELECT no FROM bank_name where name=? ,?);
				
				Session.setAttribute("class_no");
				bank에 class_no값이 있으면, 그룹 확인해서
				업로드 된걸로 간주하고 List에서 뿌려주게. bank에 class_no값이 없으면, upload안할걸로하고
				List에 안뿌려주게 . 즉, 끝까지 다하면 업로드.

	*/
	ClassBean ModifyClass(ClassBean bean);		
	/*
				클래스 정보 수정눌렀을때 get방식으로 classNo 값넘겨주고, ClassBean객체에 같이 저장시켜서 dao에 넘겨야함
				sql = "SELECT * FROM class where no=?";
	*/
	CurriculumBean ModifyCurriculum(Curriculum bean);	
	/*
				클래스 수정후 다음단계 눌렀을때..
				sql = "UPDATE class
						"SET no=?,cover_img,title,detail_~ category_no = (SELECT no FROM category where name=?);"
						"SELECT * FROM curriculum where class_no=?";
	*/
	void delClass(ClassBean bean);				
	/*
				Class table에 저장되어 있는 No값을 삭제해버림. 고유 No삭제하면, 자동으로 하위항목까지 모두 삭제되는지 확인까지 필수.
				ClassBean 삭제하면 클래스 하위 항목들 삭제될 수있게.
				sql = "DELETE FROM class WHERE no=?";
	
	 */
	
	//메인페이지 TOP5 페이지
	List top5Info(BuyerBean bean);				
	/*								
				sql = "SELECT c.cover_img, c.category, c.title, count(b.class_no) AS 'count'
						 FROM class c inner join buyer b
				     GROUP BY c.cover_img,c.category,c.title
						ORDER BY count LIMIT 5;"
	*/
	
	//카테고리별로 들어갔을때..							
	List<ClassBean> getCategoryClass(ClassBean bean);	
	/*
				sql = "SELECT c.cover_img,cr.name,c.title
						 FROM class c JOIN category ct
						 WHERE cr.name=?"
	*/
	
	//클래스 상세보기 페이지
	ClassInfoBean classInfo(ClassInfoBean bean); 		
	/*
	 			메인 content영역 + 우측 nav바 영역
				여기서 내페이지도 수강신청 가능한지 회의해보기.아니면 select 한번 더해야함.
				sql = "SELECT c.cover_img, c.detail_info, c.material_image, c.material_content,u.url,u.nickname
					  	 FROM class c JOIN user u
					 	   ON c.cre_id = u.id";
	*/
	List<ReplyBean> getClassReply(ReplyBean bean);	
	/*
				메인 content 영역 하위 클래스 답글 영역
				sql = "SELECT * FROM reply
						 WHERE classNo=? AND group =1 ORDER BY date;"
	*/
	List<CategoryBean> categoryInfo(CategoryBean bean);		
	/*
			비슷한 카테고리 
			sql = "SELECT c.comver_img, c.title 
					 FROM class c JOIN category ct
			       	   ON c.category_no = ct.no
				    WHERE ct.name=? ORDER BY LIMIT 4;"
	*/
	
	//클래스 댓글
	void addClassReply(ClassReplyBean bean); 	
	/*
			답글 작성후, 추가 버튼 클릭했을때...
			sql = " INSERT INTO reply (content,reply_id,class_no,group,date)
					  VALUES (?,?,?,1,sysdate);"
	*/
	int delClassReply(ClassReplyBean bean,String id);	
	/*
			답글 삭제버튼클릭시,	그 클래스 아이디와 로그인한  아이디 값이 일치하면 삭제가능, 또한 자신이 작성한 답글이면 삭제가능하게.
			sql = "SELECT c.id ,p.user_id FROM class c JOIN reply p ON p.class_no = c.no;"
					 WHERE p.user_id=?;"
		 		rs.getString("c.id"); 
				if(id == c.id || id == p.user_id ){ 
					"DELETE FROM reply where no=?";}		
	*/											
	
	//내 쪽지함
	void sendMessage(MessageBean bean,String id);	
	/*
			Message보내기. MessageBean객체를 넘김
			sql = "INSERT INTO message (send_id,receiver_id,content,send_time,read_yn);
			 			"VALUES (id,?,?,sysdate,0);
	*/
	
	int countReadMessage(String id);			
	/*
			들고와서, return해주기.
			sql = "SELECT COUNT(read_yn) FROM message WHERE read_yn = 0;";
	*/
	
	List<MessageBean> getMessage(MessageBean bean,String id);	
	/*
			받은 메세지함 전체 보기.
			sql = "SELECT * FROM message where receiver_id= ?";
	*/
	
	MeesageBean getMessageInfo(int MessageNo);		
	/*
			메세지 상세보기 
			메세지 번호값을 넘겨주고, select해서 넘겨준 값에 해당하는 메세지 정보출력,
			update시켜서 read_yn값 1증가시킴. 읽음/안읽음 표시를 위해
			sql = "SELECT * FROM message WHERE no=?;
			 if(rs.getInt("read_yn") ==1) "UPDATE message SET read_yn=1";
	*/
	
	void delMessage(int no);
	/*
			sql="DELETE FROM message where no=?;"
	*/
	
	//커뮤니티 댓글
	void addCommunityReply(CommunityReplyBean bean,String id); 	
	/*
			답글 작성후, 추가 버튼 클릭했을때...
			sql = " INSERT INTO reply (content,reply_id,class_no,group,date)
					     VALUES (?,id,?,1,sysdate);"
	*/
	
	int delCommunityReply(CommunityReplyBean bean,String id);		
	/*
			답글 삭제버튼클릭시,	그 클래스 아이디와 로그인한  아이디 값이 일치하면 삭제가능, 또한 자신이 작성한 답글이면 삭제가능하게.
			sql = "SELECT c.id ,p.reply_id FROM class c JOIN reply p ON p.class_no = c.no;"
					WHERE p.reply_id=? OR c.id=?;"
					
			 rs.getString("c.id"); 
			 if(id == c.id || id == p.user_id ){ 
				"DELETE FROM reply where no=?";}
	*/											
	
	//쿠폰함 페이지
	CouponBean myCouponInfo(String id);
	/*
			내 쿠폰함 눌렀을때...
			sql = "SELECT * FROM coupon WHERE user_id=?";
	*/
	
	
	//클래스 결제 페이지
	int buyClass(int classNo);					
	/*
			결제 신청 눌렀을때..
			sql = "SELECT tuition FROM class where no = ?"
			
	*/	
	
	CouponBean CouponClass(String id);		
	/*
			쿠폰 적용 눌렀을때..
			sql = "SELECT * FROM coupon WHERE user_id=?";
			없으면 없다고 띄우고 있으면 사용할수있게함.
	*/
	
		void addBuy(BuyerBean bean,String id,int classNo);	
	/*
	 		
			결제하기 버튼눌렀을때..
			
			session영역에저장.
	*/
		
		
	//찜목록 페이지
	JjimBean getJjim(String id);
	/*
	 	내 찜목록 눌렀을때...
	 	SELECT cover_img, title,
	 */	

	//동영상 시청 페이지
	List<ReplyBean> getClassReply(ReplyBean bean);		
	/*
			동영상 시청부분 클래스 댓글 눌렀을때. 또는 그냥 보여줄때.
			sql = "SELECT * FROM reply
					WHERE classNo=? AND group =0" ORDER BY date;
	 */
	
	List<CurriculumBean> getCurriculum(CurriCulumBean bean);
	/*
			커리큘럼 눌렀을때...
			sql = "SELECT * FROM curriculum
					WHERE classNo=?"
	*/
	
	CurriCulumBean getVideo(CurriCulumBean bean,int subjectNo);		
	/*
			중간에 다른 커리큘럼의 소주제를 눌렀을때..
			sql = "SELECT video FROM subject WHERE 
			
			!!!!!!!!!!!이부분 고민다시.
	*/
															
}
