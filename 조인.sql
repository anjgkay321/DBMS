select u.userid ,name,birthyear,addr,prodname,groupname,price
from userTbl u
join buytbl b on u.userid = b.userid;

--회원별 총 구매 금액
SELECT u.userID, u.name, SUM(b.price * b.amount) AS 총구매금액
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY u.userID, u.name;

-- 상품을 가장 많이 구매한 회원
select rownum as RN,name,총수량  from
(
SELECT u.name, SUM(b.amount) AS 총수량
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY u.name
ORDER BY 총수량 DESC
)
where rownum =1;

--특정 물품 구매한 회원 조회 ? 예: “책” 구매자
SELECT DISTINCT u.name
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
WHERE b.prodName = '책';

-- 예제:
-- 모든 회원의 이름과 구매 내역(없는 경우 NULL) 조회
SELECT *
FROM userTbl u
left JOIN buyTbl b 
ON u.userID = b.userID;

-- 구매가 없는 회원 찾기 (LEFT JOIN + WHERE NULL)
SELECT *
FROM userTbl u
LEFT JOIN buyTbl b ON u.userID = b.userID
WHERE b.userID IS NULL;

-- 학생 테이블
CREATE TABLE studentTbl (
  studentID CHAR(5) PRIMARY KEY,
  name VARCHAR2(20)
);

-- 시험 응시 테이블
CREATE TABLE examTbl (
  examID CHAR(5) PRIMARY KEY,
  studentID CHAR(5),
  subject VARCHAR2(20),
  score NUMBER
);

-- 학생 데이터 삽입
INSERT INTO studentTbl VALUES ('S001', '홍길동');
INSERT INTO studentTbl VALUES ('S002', '김철수');
INSERT INTO studentTbl VALUES ('S003', '이영희');
INSERT INTO studentTbl VALUES ('S004', '박지민');

-- 시험 응시 데이터 삽입
INSERT INTO examTbl VALUES ('E101', 'S001', '수학', 85);
INSERT INTO examTbl VALUES ('E102', 'S002', '영어', 90);
INSERT INTO examTbl VALUES ('E103', 'S005', '국어', 88); -- 존재하지 않는 학생




select * from studenttbl;

select * from examtbl;

select *
from studenttbl s
full outer join examtbl e
on s.studentid = e.studentid;