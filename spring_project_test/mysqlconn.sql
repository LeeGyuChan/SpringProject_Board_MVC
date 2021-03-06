CREATE TABLE BOARD(
	BOARD_NUM INT,
	BOARD_NAME VARCHAR(20) NOT NULL,
	BOARD_PASS VARCHAR(15) NOT NULL,
	BOARD_SUBJECT VARCHAR(50) NOT NULL,
	BOARD_CONTENT VARCHAR(2000) NOT NULL,
	BOARD_FILE VARCHAR(50) NOT NULL,
	BOARD_RE_REF INT NOT NULL,
	BOARD_RE_LEV INT NOT NULL,
	BOARD_RE_SEQ INT NOT NULL,
	BOARD_READCOUNT INT DEFAULT 0,
	BOARD_DATE DATE,
	PRIMARY KEY(BOARD_NUM)
);
select max(board_num) from tboard;
select * from tboard;
delete from tboard where BOARD_NUM =1;
select count(*) from tboard
CREATE TABLE MEMBER(
	MEMBER_ID VARCHAR(15) PRIMARY KEY,
	MEMBER_PW VARCHAR(13),
	MEMBER_NAME VARCHAR(15),
	MEMBER_AGE INT(3),
	MEMBER_GENDER VARCHAR(5),
	MEMBER_EMAIL VARCHAR(30)
);
select * from member;
SELECT MEMBER_ID FROM MEMBER WHERE MEMBER_ID="ckeel" AND MEMBER_PW="1234";
select max(board_num)+1 from tboard;
CREATE TABLE SBOARD(
	BOARD_NUM INT,
	BOARD_NAME VARCHAR(20) NOT NULL,
	BOARD_PASS VARCHAR(15) NOT NULL,
	BOARD_SUBJECT VARCHAR(50) NOT NULL,
	BOARD_CONTENT VARCHAR(2000) NOT NULL,
	BOARD_RE_REF INT NOT NULL,
	BOARD_RE_LEV INT NOT NULL,
	BOARD_RE_SEQ INT NOT NULL,
	BOARD_READCOUNT INT DEFAULT 0,
	BOARD_DATE DATE,
	PRIMARY KEY(BOARD_NUM)
);
CREATE TABLE TBOARD(
	BOARD_NUM INT,
	BOARD_NAME VARCHAR(20) NOT NULL,
	BOARD_PASS VARCHAR(15) NOT NULL,
	BOARD_SUBJECT VARCHAR(50) NOT NULL,
	BOARD_CONTENT VARCHAR(2000) NOT NULL,
	BOARD_FILE VARCHAR(50) NOT NULL,
	BOARD_RE_REF INT NOT NULL,
	BOARD_RE_LEV INT NOT NULL,
	BOARD_RE_SEQ INT NOT NULL,
	BOARD_READCOUNT INT DEFAULT 0,
	BOARD_DATE DATE,
	PRIMARY KEY(BOARD_NUM)
);
insert into tboard values(1,"ckeel","1234","테스트입니다.","테스트입니다.",)


select max(board_num) from tboard;

create table reply(
	RE_NUM int not null auto_increment,
	BOARD_NUM int not null default 0,
	REPLYCONTENT varchar(1000) not null,
	REPLYER varchar(50) not null,
	RE_DATE TIMESTAMP not null default now(),
	PRIMARY KEY(RE_NUM)
);
desc reply;
alter table reply add constraint fk_BOARD_NUM
foreign key(BOARD_NUM) references tboard(BOARD_NUM);
select * from reply;
delete  from reply;

select * from reply where BOARD_NUM =25 order by RE_NUM desc limit 1, 10;

CREATE TABLE PBOARD(
	BOARD_NUM INT,
	BOARD_NAME VARCHAR(20) NOT NULL,
	BOARD_PASS VARCHAR(15) NOT NULL,
	BOARD_SUBJECT VARCHAR(50) NOT NULL,
	BOARD_CONTENT VARCHAR(2000) NOT NULL,
	BOARD_RE_REF INT NOT NULL,
	BOARD_RE_LEV INT NOT NULL,
	BOARD_RE_SEQ INT NOT NULL,
	BOARD_READCOUNT INT DEFAULT 0,
	BOARD_DATE DATE,
	PRIMARY KEY(BOARD_NUM)
);
insert into pboard values(1,"관리자테스트","1234","페이지 테스트입니다.","테스트입니다.",1,0,0,0,now(),0);
select max(board_num)+1 from pboard;
select * from pboard;
select now();


create table p_reply(
	RE_NUM int not null auto_increment,
	BOARD_NUM int not null default 0,
	REPLYCONTENT varchar(1000) not null,
	REPLYER varchar(50) not null,
	RE_DATE TIMESTAMP not null default now(),
	PRIMARY KEY(RE_NUM)
);
drop table p_reply;
desc p_reply;

alter table p_reply add constraint fk_PBOARD_NUM
foreign key(BOARD_NUM) references pboard(BOARD_NUM);

alter table pboard add BOARD_REPLY_COUNT int default 0 not null;

delete from pboard;
delete from p_reply;