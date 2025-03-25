-- ����ں� ���� �Ѿ� ���
select userid,sum(price*amount) as �����Ѿ�
from buytbl
group by userid;

-- ����ں� ���� Ƚ�� ���
select userid,count(*) as ����Ƚ��
from buytbl
group by userid;

--������ ����� �� ���
select addr,count(*) as ����ڼ�
from usertbl
group by addr;

-- ��ǰ �׷캰 �Ǹ� �ݾ� �հ�(!)
select groupName,sum(price*amount) as �Ǹž�
from buytbl
where groupname is not null
group by groupname;
-- ����⵵ ���� ����ڼ� 
select birthyear,count(*) as �ο���
from usertbl
GROUP BY birthyear
ORDER BY birthyear;

--  ORDER BY (��������) �⺻�� ���������̶� asc �Ⱥٿ�����
SELECT Name , mDate FROM userTbl ORDER BY mDate;

-- �������� desc;
SELECT Name , mDate FROM userTbl ORDER BY mDate desc;

-- ���� + ����
SELECT Name, height FROM userTbl ORDER BY height DESC, name ASC;

--��������
select * from
(select rownum as RN, usertbl.* from usertbl) where rn = 2 ;

select * from 
(select rownum as RN, usertbl.* from usertbl) where RN>=2 and RN<=4;

-- ����
-- 1 userTbl���� ����(addr)�� ����� ���� ���ϴ� SQL���� �ۼ��Ͻÿ�.
select * from usertbl;
select addr,count(*) as from usertbl group by addr;

--2 buyTbl���� �����(userID)�� �� ���ž��� ���ϴ� SQL���� �ۼ��Ͻÿ�. 
-- �� ���ž��� ����(price)�� ����(amount)�� ���� ������ ����Ͻÿ�.
select * from buytbl;
select userid,sum(price*amount) as �����Ѿ�
from buytbl
group by userid;
--3 buyTbl���� ��ǰ �׷�(groupName)�� �Ǹ� ������ �հ踦 ���ϴ� SQL���� �ۼ��Ͻÿ�. 
-- NULL ���� '�̺з�'�� ǥ���Ͻÿ�.
select groupname,sum(price*amount) as �Ǹż���
from buytbl where groupname is not null
GROUP by groupname;
-- 4 userTbl���� ����⵵(birthYear)�� ��� Ű(height)�� ���ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT * FROM usertbl;
SELECT birthYear, AVG(height) AS ���Ű
FROM userTbl
GROUP BY birthYear
ORDER BY birthYear;

--5 buyTbl���� ��ǰ��(prodName)�� ���� Ƚ���� �� ���ž��� ���ϴ� SQL���� �ۼ��Ͻÿ�. 
-- ����� ���� Ƚ���� ���� ������ �����Ͻÿ�.
SELECT prodName, COUNT(*) AS "���� Ƚ��", SUM(price * amount) AS �ѱ��ž�
FROM buyTbl
GROUP BY prodName
ORDER BY ����Ƚ�� DESC;

-- 6 userTbl���� mobile1(��Ż�)�� ������ ���� ���ϵ�, NULL ���� '���Է�'���� ǥ���ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT COALESCE(mobile1, '���Է�') as ��Ż�,count(*) as �����ڼ� 
from usertbl
GROUP by mobile1;
--7 userTbl�� buyTbl�� �����Ͽ� ����(addr)�� �� ���ž��� ���ϴ� SQL���� �ۼ��Ͻÿ�.
select u.addr,sum(b.price*b.amount) as �ѱ��ž�
from usertbl u join buytbl b on u.userid=b.userid
GROUP by u.addr;
-- 8 buyTbl���� ����ں� ������ ��ǰ�� ���� ���� ���ϴ� SQL���� �ۼ��Ͻÿ�.
select userid,count(distinct prodname) as ��ǰ������
from buytbl
GROUP by userid;
--9 userTbl���� ���� ������(mDate�� ���� �κ�) ������ ���� ���ϴ� SQL���� �ۼ��Ͻÿ�
select SUBSTR(mDate,1,2),count(*) from usertbl GROUP by SUBSTR(mDate,1,2);

SELECT EXTRACT(YEAR FROM mDate) AS ���Կ���, COUNT(*) AS �����ڼ�
FROM userTbl
GROUP BY EXTRACT(YEAR FROM mDate)
ORDER BY ���Կ���;
-- 10 buyTbl�� userTbl�� �����Ͽ� ���ɴ뺰(10��, 20��, ...) ���� �Ѿ��� ����ϴ� SQL���� �ۼ��Ͻÿ�. 
-- ������ 2023�� �������� ����Ͻÿ�.
SELECT FLOOR((2025 - u.birthYear) / 10) * 10 AS ���ɴ�, 
       SUM(b.price * b.amount) AS �����Ѿ�
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY FLOOR((2025 - u.birthYear) / 10) * 10
ORDER BY ���ɴ�;
