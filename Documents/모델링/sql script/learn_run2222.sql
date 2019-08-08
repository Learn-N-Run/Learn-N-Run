drop database learnrun;
use learnrun;


show tables;


SELECT * FROM user_group;
SELECT * FROM class;
SELECT * FROM reply;
DELETE FROM class WHERE no = 1;

SELECT * FROM user;

SELECT ca.name category, cl.title class
FROM category ca JOIN class cl
ON ca.no = cl.category_no
WHERE ca.name LIKE "%요리%"
OR cl.title LIKE "%요리%";
