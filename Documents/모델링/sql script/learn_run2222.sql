use learnrun;
drop database learnrun;

show tables;

SELECT * FROM user;

desc class;

SELECT cl.title class, ca.name category, cl.no classno
FROM category ca JOIN class cl
ON ca.no = cl.category_no
WHERE cl.title LIKE "%한식%"
OR ca.name LIKE "%한식%" LIMIT 5;

SELECT cl.title title, cl.no classno, cr.major_topic topic, s.subject subject, s.url url, cl.cover_img coverimg
FROM curriculum cr
JOIN subject s
JOIN class cl
ON cr.no = s.curriculum_no
AND cr.class_no = cl.no;

