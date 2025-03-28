-- select * from usertbl;
SELECT * FROm usertbl;
-- ----------------------------
-- 조건절 + 관계연산자
-- -----------------------------

select * from usertbl where birthyear >=1970 and height>=182;
select * from usertbl where birthyear >=1970 or height>=182;

-- ----------------------------
-- between
-- -----------------------------
select * from usertbl where birthyear >=1970 and birthyear <= 1980;
select * from usertbl where birthyear between 1970 and  1980;

-- ----------------------------
-- IN
-- -----------------------------

select Name,height from userTbl where addr in('경남','전남','경북');
select * from usertbl where mobile1 in('010','011');


-- ----------------------------
-- LIKE %(모든문자,길이제한x) , _(모든문자,_만큼의 길이)
-- -----------------------------

select Name,height from usertbl where name like '김%';
select Name,height from usertbl where name like '_재범';

-- ----------------------------
-- NULL CHECK
-- -----------------------------

select * from usertbl where mobile1 is Null;
select * from usertbl where mobile1 is not Null;

-- ----------------------------
-- DISTINCT row 중 중복row 제거
-- -----------------------------

select addr from usertbl;
select DISTINCT addr from usertbl;


-- ----------------------------
-- Alias 별칭
-- -----------------------------

select name,addr,mobile1 || mobile2 as phone from usertbl;
