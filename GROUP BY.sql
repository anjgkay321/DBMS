-- 사용자별 구매 총액 계산
select userid,sum(price*amount) as 구매총액
from buytbl
group by userid;

-- 사용자별 구매 횟수 계산
select userid,count(*) as 구매횟수
from buytbl
group by userid;

--지역별 사용자 수 계산
select addr,count(*) as 사용자수
from usertbl
group by addr;

-- 제품 그룹별 판매 금액 합계(!)
select groupName,sum(price*amount) as 판매액
from buytbl
where groupname is not null
group by groupname;
-- 출생년도 기준 사용자수 
select birthyear,count(*) as 인원수
from usertbl
GROUP BY birthyear
ORDER BY birthyear;

--  ORDER BY (오름차순) 기본이 오름차순이라 asc 안붙여도됨
SELECT Name , mDate FROM userTbl ORDER BY mDate;

-- 내림차순 desc;
SELECT Name , mDate FROM userTbl ORDER BY mDate desc;

-- 오름 + 내림
SELECT Name, height FROM userTbl ORDER BY height DESC, name ASC;

--서버쿼리
select * from
(select rownum as RN, usertbl.* from usertbl) where rn = 2 ;

select * from 
(select rownum as RN, usertbl.* from usertbl) where RN>=2 and RN<=4;

-- 문제
-- 1 userTbl에서 지역(addr)별 사용자 수를 구하는 SQL문을 작성하시오.
select * from usertbl;
select addr,count(*) as from usertbl group by addr;

--2 buyTbl에서 사용자(userID)별 총 구매액을 구하는 SQL문을 작성하시오. 
-- 총 구매액은 가격(price)과 수량(amount)의 곱의 합으로 계산하시오.
select * from buytbl;
select userid,sum(price*amount) as 구매총액
from buytbl
group by userid;
--3 buyTbl에서 제품 그룹(groupName)별 판매 수량의 합계를 구하는 SQL문을 작성하시오. 
-- NULL 값은 '미분류'로 표시하시오.
select groupname,sum(price*amount) as 판매수량
from buytbl where groupname is not null
GROUP by groupname;
-- 4 userTbl에서 출생년도(birthYear)별 평균 키(height)를 구하는 SQL문을 작성하시오.
SELECT * FROM usertbl;
SELECT birthYear, AVG(height) AS 평균키
FROM userTbl
GROUP BY birthYear
ORDER BY birthYear;

--5 buyTbl에서 제품명(prodName)별 구매 횟수와 총 구매액을 구하는 SQL문을 작성하시오. 
-- 결과는 구매 횟수가 많은 순으로 정렬하시오.
SELECT prodName, COUNT(*) AS "구매 횟수", SUM(price * amount) AS 총구매액
FROM buyTbl
GROUP BY prodName
ORDER BY 구매횟수 DESC;

-- 6 userTbl에서 mobile1(통신사)별 가입자 수를 구하되, NULL 값은 '미입력'으로 표시하는 SQL문을 작성하시오.
SELECT COALESCE(mobile1, '미입력') as 통신사,count(*) as 가입자수 
from usertbl
GROUP by mobile1;
--7 userTbl과 buyTbl을 조인하여 지역(addr)별 총 구매액을 구하는 SQL문을 작성하시오.
select u.addr,sum(b.price*b.amount) as 총구매액
from usertbl u join buytbl b on u.userid=b.userid
GROUP by u.addr;
-- 8 buyTbl에서 사용자별 구매한 제품의 종류 수를 구하는 SQL문을 작성하시오.
select userid,count(distinct prodname) as 제품종류수
from buytbl
GROUP by userid;
--9 userTbl에서 가입 연도별(mDate의 연도 부분) 가입자 수를 구하는 SQL문을 작성하시오
select SUBSTR(mDate,1,2),count(*) from usertbl GROUP by SUBSTR(mDate,1,2);

SELECT EXTRACT(YEAR FROM mDate) AS 가입연도, COUNT(*) AS 가입자수
FROM userTbl
GROUP BY EXTRACT(YEAR FROM mDate)
ORDER BY 가입연도;
-- 10 buyTbl과 userTbl을 조인하여 연령대별(10대, 20대, ...) 구매 총액을 계산하는 SQL문을 작성하시오. 
-- 연령은 2023년 기준으로 계산하시오.
SELECT FLOOR((2025 - u.birthYear) / 10) * 10 AS 연령대, 
       SUM(b.price * b.amount) AS 구매총액
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY FLOOR((2025 - u.birthYear) / 10) * 10
ORDER BY 연령대;
