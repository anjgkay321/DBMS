-- select * from usertbl;
SELECT * FROm usertbl;
-- ----------------------------
-- ������ + ���迬����
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

select Name,height from userTbl where addr in('�泲','����','���');
select * from usertbl where mobile1 in('010','011');


-- ----------------------------
-- LIKE %(��繮��,��������x) , _(��繮��,_��ŭ�� ����)
-- -----------------------------

select Name,height from usertbl where name like '��%';
select Name,height from usertbl where name like '_���';

-- ----------------------------
-- NULL CHECK
-- -----------------------------

select * from usertbl where mobile1 is Null;
select * from usertbl where mobile1 is not Null;

-- ----------------------------
-- DISTINCT row �� �ߺ�row ����
-- -----------------------------

select addr from usertbl;
select DISTINCT addr from usertbl;


-- ----------------------------
-- Alias ��Ī
-- -----------------------------

select name,addr,mobile1 || mobile2 as phone from usertbl;
