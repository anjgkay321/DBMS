select u.userid ,name,birthyear,addr,prodname,groupname,price
from userTbl u
join buytbl b on u.userid = b.userid;

--ȸ���� �� ���� �ݾ�
SELECT u.userID, u.name, SUM(b.price * b.amount) AS �ѱ��űݾ�
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY u.userID, u.name;

-- ��ǰ�� ���� ���� ������ ȸ��
select rownum as RN,name,�Ѽ���  from
(
SELECT u.name, SUM(b.amount) AS �Ѽ���
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
GROUP BY u.name
ORDER BY �Ѽ��� DESC
)
where rownum =1;

--Ư�� ��ǰ ������ ȸ�� ��ȸ ? ��: ��å�� ������
SELECT DISTINCT u.name
FROM userTbl u
JOIN buyTbl b ON u.userID = b.userID
WHERE b.prodName = 'å';

-- ����:
-- ��� ȸ���� �̸��� ���� ����(���� ��� NULL) ��ȸ
SELECT *
FROM userTbl u
left JOIN buyTbl b 
ON u.userID = b.userID;

-- ���Ű� ���� ȸ�� ã�� (LEFT JOIN + WHERE NULL)
SELECT *
FROM userTbl u
LEFT JOIN buyTbl b ON u.userID = b.userID
WHERE b.userID IS NULL;

-- �л� ���̺�
CREATE TABLE studentTbl (
  studentID CHAR(5) PRIMARY KEY,
  name VARCHAR2(20)
);

-- ���� ���� ���̺�
CREATE TABLE examTbl (
  examID CHAR(5) PRIMARY KEY,
  studentID CHAR(5),
  subject VARCHAR2(20),
  score NUMBER
);

-- �л� ������ ����
INSERT INTO studentTbl VALUES ('S001', 'ȫ�浿');
INSERT INTO studentTbl VALUES ('S002', '��ö��');
INSERT INTO studentTbl VALUES ('S003', '�̿���');
INSERT INTO studentTbl VALUES ('S004', '������');

-- ���� ���� ������ ����
INSERT INTO examTbl VALUES ('E101', 'S001', '����', 85);
INSERT INTO examTbl VALUES ('E102', 'S002', '����', 90);
INSERT INTO examTbl VALUES ('E103', 'S005', '����', 88); -- �������� �ʴ� �л�




select * from studenttbl;

select * from examtbl;

select *
from studenttbl s
full outer join examtbl e
on s.studentid = e.studentid;