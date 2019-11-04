create table member(
	id varchar(20) primary key, 
	pass varchar(20), 
	NAME VARCHAR(20),
	gender int(1),
	tel varchar(50),
	email VARCHAR(100), 
	picture varchar(200)
)
DROP TABLE member;
SELECT *FROM member;
INSERT INTO member(id, pass, NAME, gender, tel) VALUES ('admin', '1234', '°ü¸®ÀÚ', 1, '1234');

ALTER TABLE member ADD email VARCHAR(100);
