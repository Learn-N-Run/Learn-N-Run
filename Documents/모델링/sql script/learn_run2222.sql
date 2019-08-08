use learnrun;
drop database learnrun;

show tables;

SELECT * FROM user;

desc class;

SELECT cl.title class, ca.name category 
FROM category ca JOIN class cl
ON ca.no = cl.category_no
WHERE cl.title LIKE "%요%"
OR ca.name LIKE "%요%";
