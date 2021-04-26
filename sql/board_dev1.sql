CREATE USER DEV1_03 IDENTIFIED BY DEV1_03;
GRANT CONNECT, RESOURCE TO DEV1_03;
GRANT ALTER SESSION TO DEV1_03;
CONN DEV1_03/DEV1_03;

CREATE TABLE MEMBER(
	ID VARCHAR2(20),
	PASSWORD VARCHAR2(16) NOT NULL,
	EMAIL VARCHAR2(40) NOT NULL,
	NAME VARCHAR2(50) NOT NULL,
	BIRTHDAY DATE NOT NULL,
	PHONENUMBER1 VARCHAR2(3) NOT NULL,
	PHONENUMBER2 VARCHAR2(4) NOT NULL,
	PHONENUMBER3 VARCHAR2(4) NOT NULL,
	ADRESS1 VARCHAR2(100) NOT NULL,
	ADRESS2 VARCHAR2(100) NOT NULL,
	ZIPCODE VARCHAR2(100) NOT NULL,
	MANAGER CHAR(1) DEFAULT 0 NOT NULL,
	REGDATE DATE NOT NULL,
	PATH VARCHAR2(500) NOT NULL,
	CONSTRAINT MEMBER_PK PRIMARY KEY(ID)
);

CREATE TABLE ARTICLE(
	ARTICLE_NO NUMBER NOT NULL,
	TITLE VARCHAR2(100) NOT NULL,
	WRITER_ID VARCHAR2(20) NOT NULL,
	WRITER_NAME VARCHAR(50) NOT NULL,
	CONTENT CLOB NOT NULL,
	ARTICLE_REGDATE DATE NOT NULL,
	ARTICLE_MODDATE DATE DEFAULT NULL,
	READ_CNT NUMBER DEFAULT 0 NOT NULL,
	REPLY_CNT NUMBER DEFAULT 0 NOT NULL,
	LIKE_CNT NUMBER DEFAULT 0 NOT NULL,
	UNLIKE_CNT NUMBER DEFAULT 0 NOT NULL,
	NOTICE CHAR(1) DEFAULT 0 NOT NULL,
	CONSTRAINT ARTICLE_PK PRIMARY KEY(ARTICLE_NO)
);

CREATE TABLE REPLY(
	REPLY_NO NUMBER NOT NULL,
	ARTICLE_NO NUMBER NOT NULL,
	REPLY_ID VARCHAR2(20) NOT NULL,
	REPLY_NAME VARCHAR2(50) NOT NULL,
	REPLY_CONTENT CLOB NOT NULL,
	REPLY_REGDATE DATE NOT NULL,
	REPLY_LIKE_CNT NUMBER DEFAULT 0 NOT NULL,
	REPLY_UNLIKE_CNT NUMBER DEFAULT 0 NOT NULL,
	CONSTRAINT REPLY_PK PRIMARY KEY(REPLY_NO),
	CONSTRAINT REPLY_FK FOREIGN KEY(ARTICLE_NO) REFERENCES ARTICLE(ARTICLE_NO)
);

CREATE TABLE ARTICLE_LIKE(
	ARTICLE_NO NUMBER NOT NULL,
	ID VARCHAR2(20) NOT NULL,
	ARTICLE_LIKE CHAR(2) DEFAULT 0 NOT NULL,
	CONSTRAINT ARTICLE_LIKE_FK FOREIGN KEY(ARTICLE_NO) REFERENCES ARTICLE(ARTICLE_NO)
);

CREATE TABLE REPLY_LIKE(
	REPLY_NO NUMBER NOT NULL,
	ID VARCHAR2(20) NOT NULL,
	REPLY_LIKE CHAR(2) DEFAULT 0 NOT NULL,
	CONSTRAINT REPLY_LIKE_FK FOREIGN KEY(REPLY_NO) REFERENCES REPLY(REPLY_NO)
);

CREATE SEQUENCE ARTICLE_NO_SEQ INCREMENT BY 1 START WITH 0;
CREATE SEQUENCE REPLY_NO_SEQ INCREMENT BY 1 START WITH 0;

COMMIT;
