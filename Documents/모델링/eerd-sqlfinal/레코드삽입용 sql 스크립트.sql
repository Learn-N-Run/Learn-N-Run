show databases;
use learnrun;
show tables;

DROP database learnrun;

SELECT * FROM user_group;
SELECT * FROM class;










-- ---------------------INSERT record list-------------------------

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- -----------------------------------------------------
-- Data for table `learnrun`.`user_group`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`user_group` (`no`, `name`) VALUES (01, '크리에이터');
INSERT INTO `learnrun`.`user_group` (`no`, `name`) VALUES (02, '일반회원');

COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`user` (`id`, `pass`, `name`, `email`, `creator_url`, `profile_img`, `nickname`, `number`, `joinDate`, `user_group_no`) VALUES ('creatertest01', '1234', '크리에이터', 'create@test.com', 'test.com', '이미지없음', '크리', 01011111111, '2019-01-02', 01);

COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`category` (`no`, `name`) VALUES (101, '원예');
INSERT INTO `learnrun`.`category` (`no`, `name`) VALUES (102, '목공');

COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`class`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`class` (`no`, `cre_id`, `cover_img`, `title`, `detail_category`, `content`, `material_img`, `material_content`, `expiration`, `tuition`, `category_no`) VALUES (1, 'creatertest01', '이미지없음', '여기가 타이틀', '디테일카테고리', '콘텐츠부분', '이미지가 또있네?', '이미지콘텐츠?', 111111, 22222222, 101);

COMMIT;


-- -----------------------------------------------------
-- Data for table `learnrun`.`jjim`
-- -----------------------------------------------------
START TRANSACTION;
USE `learnrun`;
INSERT INTO `learnrun`.`jjim` (`no`, `user_id`, `class_no`) VALUES (1, 'creatertest01', 1);

COMMIT;

