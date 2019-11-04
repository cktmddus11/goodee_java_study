create table board(
	num INT PRIMARY KEY,
	NAME VARCHAR(30),
	pass VARCHAR(20),
	subject VARCHAR(100),
	content VARCHAR(4000),
	FILE1 VARCHAR(100),
	regdate DATETIME,
	readcnt INT(10),
	grp INT,
	grplevel INT(3),
	grpstep INT(5)
)


SELECT *FROM board;
SELECT ifNull(MAX(num), 0) FROM board

delete from board;
commit