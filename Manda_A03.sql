-- Assignment 02
-- Raja Manda
--1
CREATE TABLE LAB(
lab_id int PRIMARY KEY,
building varchar(33),
room varchar(35),
num_seats int);

CREATE TABLE OS(
os_id int PRIMARY KEY,
os_name varchar(25),
os_ver float);

CREATE TABLE COMPUTER(
asset_tag int PRIMARY KEY,
os_id int,
lab_id int,
purchase_date date,
FOREIGN KEY(os_id) REFERENCES OS(os_id),
FOREIGN KEY(lab_id) REFERENCES LAB(lab_id));

CREATE TABLE SITE_LICENSE(
lab_id int,
software_name varchar(20)PRIMARY KEY,
expiration_date date,
FOREIGN KEY(lab_id) REFERENCES LAB(lab_id));

--2
INSERT INTO LAB VALUES(101,'CHEMISTRY','CH100',30);
INSERT INTO LAB VALUES(202,'PHYSICS','PS100',35);
INSERT INTO LAB VALUES(303,'BIOLOGY','BG100',20);
INSERT INTO LAB VALUES(404,'MINING','MN200',25);

INSERT INTO OS VALUES(502,'UNIX',10.5);
INSERT INTO OS VALUES(602,'MACOS',16.4);
INSERT INTO OS VALUES(702,'WINDOWS',20.3);

INSERT INTO SITE_LICENSE VALUES(101,'CHROME',TO_DATE('12/12/2025','DD/MM/YYYY'));
INSERT INTO SITE_LICENSE VALUES(202,'OPERAMINI',TO_DATE('23/12/2025','DD/MM/YYYY'));
INSERT INTO SITE_LICENSE VALUES(303,'BING',TO_DATE('02/12/2025','DD/MM/YYYY'));

INSERT INTO COMPUTER VALUES(91,502,101,TO_DATE('09/03/2011','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(82,602,202,TO_DATE('20/06/2011','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(64,702,202,TO_DATE('23/10/2012','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(51,602,101,TO_DATE('17/06/2013','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(45,502,303,TO_DATE('11/11/2011','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(39,502,404,TO_DATE('14/11/2015','DD/MM/YYYY'));
INSERT INTO COMPUTER VALUES(28,702,404,TO_DATE('01/05/2011','DD/MM/YYYY'));

--3

INSERT INTO SITE_LICENSE VALUES(101,'ONE DRIVE',TO_DATE('25/06/2013','DD/MM/YYYY'));

SELECT * FROM SITE_LICENSE WHERE software_name='ONE DRIVE';
DELETE  FROM SITE_LICENSE WHERE  software_name='ONE DRIVE';

SELECT * FROM SITE_LICENSE;

--4
ALTER TABLE LAB
MODIFY building varchar(20);

--5
UPDATE OS
SET os_name='Ubuntu',os_ver=20.04
WHERE os_id=602;

--6

SELECT building,room,COUNT(asset_tag)
FROM LAB,COMPUTER WHERE LAB.lab_id=COMPUTER.lab_id
GROUP BY building,room;

--7
select * from os 
where os_name like '%MAC%';

--8
SELECT * FROM COMPUTER WHERE purchase_date BETWEEN '01/JANUARY/2000' AND '31/December/2021';
--9
commit;
--10
SELECT * FROM LAB;

SELECT * FROM OS;

SELECT * FROM COMPUTER;

SELECT * FROM SITE_LICENSE;
--11
DROP TABLE LAB;
DROP TABLE OS;
DROP TABLE COMPUTER;
DROP TABLE SITE_LICENSE;
--12
rollback;

--13
SELECT * FROM LAB;
SELECT * FROM OS;
SELECT * FROM COMPUTER;
SELECT * FROM SITE_LICENSE;



/*in the 11th step we drop the tables and next rollback the changes to get the tables*/

--14
/*
Delete is used to delete one or more records from table.
Drop is used to clear the table.
Truncate is used to remove all the rows and colomns won't drop.*/
--15
/*
max():       Prints max value from data
min():       Prints the min value from data
sum():       Add all the values 
count();     It counts the number of records
*/














 