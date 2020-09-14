-- MEMBER 테이블
INSERT ALL INTO MEMBER VALUES('이소미', 'somi', '1234', 'gmd@naver.com', '010-2362-5157', 0, SYSDATE)
	 	   INTO MEMBER VALUES('하상오', 'sang12', '1234', 'ha12@naver.com', '010-5629-8888', 1, SYSDATE)
		   INTO MEMBER VALUES('김윤승', 'light', '1234', 'youn1004@naver.com', '010-9999-8282', 0, SYSDATE)
		   SELECT 1 FROM DUAL;
SELECT NAME, USERID, PWD, EMAIL, PHONE, JOINDATE FROM MEMBER WHERE USERID = 'somi';

SELECT * FROM MEMBER;

INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN) VALUES(?,?,?,?,?,?,?);

UPDATE MEMBER SET NAME = ?, USERID = ?, PWD = ?, EMAIL = ?, PHONE = ?, ADMIN = ?, JOINDATE = ? WHERE USERID = ?


DELETE FROM MEMBER WHERE USERID = 'DDD';

INSERT INTO MEMBER(NAME, USERID, PWD, EMAIL, PHONE, ADMIN) VALUES('DDD', 'DDD', '2134', 'DDD@naver.com', '010-2362-5157', 0);

-- TITLE 테이블
INSERT ALL INTO TITLE VALUES(1, '사장')
		   INTO TITLE VALUES(2, '부장')
		   INTO TITLE VALUES(3, '과장')
		   INTO TITLE VALUES(4, '대리')
		   INTO TITLE VALUES(5, '사원')
SELECT 1 FROM DUAL;

-- DEPARTMENT 테이블
INSERT ALL INTO DEPARTMENT VALUES(1, '영업', 7)
		   INTO DEPARTMENT VALUES(2, '기획', 8)
		   INTO DEPARTMENT VALUES(3, '제조', 9)
		   INTO DEPARTMENT VALUES(4, '경영', 10)
SELECT 1 FROM DUAL;

SELECT * FROM DEPARTMENT;

INSERT INTO DEPARTMENT VALUES(2, '기획', 8);

-- EMPLOYEE 테이블
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(4377, '이성래', 1, NULL, 5000000, 2, 'test@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3426, '박영권', 3, 4377, 3000000, 1, 'test1@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3011, '이수민', 2, 4377, 4000000, 3, 'test2@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(3427, '최종철', 5, 3011, 1500000, 3, 'test3@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1003, '조민희', 3, 4377, 3000000, 2, 'test4@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(2106, '김창섭', 4, 1003, 2500000, 2, 'test5@test.co.kr', '1234');
INSERT INTO EMPLOYEE(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, PASSWD) VALUES(1365, '김상원', 5, 3426, 1500000, 1, 'test6@test.co.kr', '1234');

SELECT * FROM VW_EMPLOYEE_JOIN;
-- EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, REGDATE, EMAIL, TEL, PASSWD, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME

UPDATE EMPLOYEE SET TEL = '053-1111-1111';

INSERT INTO VW_EMPLOYEE_JOIN(EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, EMAIL, TEL, PASSWD) VALUES(4444, '이거임', 5, 1365, 1500000, 1, 'test7@test.co.kr', '053-1111-1111', '1234');

SELECT CODE, NAME, PRICE, PICTUREURL, DESCRIPTION FROM PRODUCT ORDER BY CODE;
SELECT CODE, NAME, PRICE, PICTUREURL, DESCRIPTION FROM PRODUCT WHERE CODE = 1;
DELETE FROM PRODUCT;
SELECT * FROM PRODUCT ORDER BY CODE;

INSERT INTO PRODUCT VALUES(NULL, '개념을 콕콕 잡아주는 데이터베이스', 27000, 'DB.JPG', '데이터베이스에 관한 모든 것을 쉽고 재미있게 정리한 교재...');

INSERT INTO PRODUCT(CODE, NAME, PRICE, PICTUREURL, DESCRIPTION) VALUES(PRODUCT_SEQ.NEXTVAL, '웹표준을 위한 HTML5', 25000, 'HTML5.JPG', 'HTML5 가이드북. 홈페이지 제작을 위한 필수 선택 HTML 기본 문법...');
INSERT INTO PRODUCT(CODE, NAME, PRICE, PICTUREURL, DESCRIPTION) VALUES(PRODUCT_SEQ.NEXTVAL, 'DYNAMIC PROGRAMMING BOOK 시리즈-01 오라클 11G + PL/SQL', 25000, 'ORACLE.JPG','DYNAMIC 실무 코칭 프로그래밍 BOOK의 첫번째 책으로, 오라클 11G의 새로운 ...');
INSERT INTO PRODUCT(CODE, NAME, PRICE, PICTUREURL, DESCRIPTION) VALUES(PRODUCT_SEQ.NEXTVAL, 'VISUAL C++ MFC 윈도우 프로그래밍', 26000, 'MFC.JPG', 'VISUAL C++를 처음 시작하는 독자의 눈높이에 맞춘 VISUAL C++...');
INSERT INTO PRODUCT(CODE, NAME, PRICE, PICTUREURL, DESCRIPTION) VALUES(PRODUCT_SEQ.NEXTVAL, 'JQUERY AND JQUERY MOBILE : 이해하기 쉽게 풀어쓴', 25000, 'JQUERY.JPG', '소스 하나로 데스크탑과 모바일까지 HTML5와 함께 사용한다. 초보자들도 ...');

UPDATE PRODUCT SET NAME = 'SS', PRICE = 55000, PICTUREURL = 'WWW.JSP', DESCRIPTION = '인사좀해라' WHERE CODE = 6;

DELETE FROM PRODUCT WHERE CODE BETWEEN 5 AND 100;

----------------------------------------------------------------
INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE) VALUES('1234', '성윤정', 'TEST@TEST.CO.KR', '첫방문', '반갑습니다', 0, '2020-01-14');
INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE) VALUES('1234', '아이유', 'TEST@TEST.CO.KR', '첫방문1', '반갑습니다1', 0, '2020-02-14');
INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE) VALUES('1234', '어른이유', 'TEST@TEST.CO.KR', '첫방문2', '반갑습니다2', 0, '2020-04-14');
INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE) VALUES('1234', '아기유', 'TEST@TEST.CO.KR', '첫방문3', '반갑습니다3', 0, '2020-05-14');

SELECT * FROM BOARD;
