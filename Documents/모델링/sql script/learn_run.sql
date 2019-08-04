show databases;
use learnrun;
show tables;

select * from user;
SELECT * FROM user_group;
SELECT * FROM class;
SELECT * FROM buyer;
select * from category;
select * from user_group;
select * from user;
select * from receiver_info;
desc receiver_info;
desc category;
DELETE FROM user;
		SELECT c.no, d.topclasscount, c.cre_id, c.cover_img, c.title, c.detail_category,
				c.content, c.material_img, c.material_content, c.expiration, c.tuition, c.category_no
		FROM class c join (SELECT class_no, COUNT(*) 'topclasscount'
							FROM buyer
							group by class_no
							ORDER BY classpop DESC LIMIT 5) d
		ON d.class_no = c.no
		GROUP BY c.no;

			SELECT * FROM category;


SELECT * FROM jjim;
SELECT * FROM buyer;
SELECT * FROM class;
SELECT * FROM category;


-- buyer count TopClassDTO ---
SELECT cl.no 'classNo',cl.cre_id 'creator',cl.cover_img 'coverImg',cl.title 'title',ca.no 'categoryNo', ca.name 'categoryName', 
		count(*) 'TopRankCount' FROM class cl join category ca join buyer buy
ON cl.category_no=ca.no
-- AND cl.no = buy.class_no
GROUP BY cl.no LIMIT 5;

-- jjim count InterestedClassDTO ---
SELECT cl.no 'classNo',cl.cre_id 'creator',cl.cover_img 'coverImg',cl.title 'title',ca.no 'categoryNo', ca.name 'categoryName', 
		count(*) 'interestCount' FROM class cl join category ca join jjim jj
ON cl.category_no=ca.no
	AND cl.no = jj.class_no
WHERE ca.name = '요리'
GROUP BY cl.no
LIMIT 5;

ALTER TABLE category ADD column image varchar(300) not null;

ALTER TABLE reply add `user_id` VARCHAR(20) NULL;
	
ALTER TABLE reply ADD CONSTRAINT fk_reply_user1 FOREIGN KEY(`user_id`)
REFERENCES `learnrun`.`user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;


-- ---------------------INSERT record list-------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `learnrun`.`user_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;


insert into user_group(no,name) values(1,'회원'),(2,'크리에이터'),(3,'관리자') ;


COMMIT;

		SELECT c.cover_img, c.category_no, c.title, count(b.class_no) AS 'count'
		FROM class c join buyer b
		GROUP BY c.cover_img, c.category_no, c.title 
		ORDER BY count DESC LIMIT 5;		

desc class;

c.no,
c.cre_id,
c.cover_img,
c.title,
c.detail_category,
c.content,
c.material_img,
c.material_content,
c.expiration,
c.tuition,
c.category_no
d.count;

SELECT class_no, COUNT(*) 'classpop' FROM buyer
				group by class_no
				ORDER BY classpop DESC LIMIT 5;

		SELECT c.no, d.classpop, c.cre_id, c.cover_img, c.title, c.detail_category,
				c.content, c.material_img, c.material_content, c.expiration, c.tuition, c.category_no
		FROM class c
        join (SELECT class_no, COUNT(*) 'classpop' FROM buyer
				group by class_no
				ORDER BY classpop DESC LIMIT 5) d
		ON d.class_no = c.no
		GROUP BY c.no;
        
        
-- -----------------------------------------------------
-- Data for table `learnrun`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('creatertest01', '1234', '크리에이터', 'create@test.com', 'test.com', '이미지없음', '크리', 01011111111, '2019-01-02', 01);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user2', '1234', '곤잘레스', 'crea23te@test.com', 'tes4t.com', '이미지없음', '크리3', 01011111111, '2019-01-02', 02);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user1', '1234', '알렉산더', 'cre234ate@test.com', 't434est.com', '이미지없음', '크2리', 01011111111, '2019-01-02', 02);
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('user3', '1234', '뽀삐', '2a3te@test.com', 'tes2t.com', '이미지없음', '1크리', 01011111111, '2019-01-02', 02);

COMMIT;

-- -----------------------------------------------------
-- Data for table `learnrun`.`receiver_info`
-- -----------------------------------------------------

INSERT INTO receiver_info(name, number,address1,address2,address3,delievery_msg) VALUES("홍길",01000000000,"주소1","주2소","3주소","딜리버리 메세지");







-- -----------------------------------------------------
-- Data for table `learnrun`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;

insert into category(no,name) values(1,'요리');
insert into category(no,name) values(2,'카메라');
insert into category(no,name) values(3,'공예');
insert into category(no,name) values(4,'코딩');
insert into category(no,name) values(5,'음악');
insert into category(no,name) values(6,'켈리그래피');
insert into category(no,name) values(7,'운동');
insert into category(no,name) values(8,'그림');

COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`class`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (1, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 1);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (2, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 2);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (3, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 2);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (4, 'creatertest01', '이미지없음', '4번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 3);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (5, 'creatertest01', '이미지없음', '5번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 4);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (6, 'creatertest01', '이미지없음', '6버클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (7, 'creatertest01', '이미지없음', '7번클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (8, 'creatertest01', '이미지없음', '8래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 5);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (9, 'creatertest01', '이미지없음', '7번클9래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 6);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (10, 'creatertest01', '이미지없음', '7번10클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 6);
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (11, 'creatertest01', '이미지없음', '7번11클래스', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 1);
COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`jjim`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`jjim` (`no`, `user_id`, `class_no`) VALUES (1, 'creatertest01', 1);
INSERT INTO `learnrun`.`jjim` (`user_id`, `class_no`) VALUES ('creatertest01', 1);
COMMIT;

-- -----------------------------------------------------
-- Data for table `learnrun`.`buyer`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (01,'user3', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (02,'user2', '1234', '2019-01-02', 1,2);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (03,'user1', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (04,'user3', '1234', '2019-01-02', 2,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (05,'user2', '1234', '2019-01-02', 2,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (06,'user1', '1234', '2019-01-02', 1,1);
INSERT INTO `learnrun`.`buyer` (`no`, `user_id`, `last_tuition`, `order_date`, `class_no`,`receiver_info_no`) VALUES (07,'user3', '1234', '2019-01-02', 7,1);

COMMIT;

