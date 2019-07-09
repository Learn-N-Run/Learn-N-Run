/*데이터베이스 생성*/
CREATE database learnrun;

/*유저 생성+권한 설정*/
CREATE USER 'learnrun'@'localhost' IDENTIFIED BY '1234'; /*유저 생성 id = learnrun, pwd = 1234*/
grant all privileges on learnrun.* to 'learnrun'@'localhost'; /*learnrun유저에게 learnrun데이터베이스의 모든 테이블의 권한 부여*/
flush privileges;	/*마무으리*/
/********************************************************************************************************/


show databases;		/*데이터베이스 조회*/
use learnrun;		/*데이터베이스 사용*/
show tables;		/*테이블 조회*/


