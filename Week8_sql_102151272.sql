IF OBJECT_ID('STAFF_ALLOCATION') IS NOT NULL
DROP TABLE STAFF_ALLOCATION;
IF OBJECT_ID('ATTENDANCE') IS NOT NULL
DROP TABLE ATTENDANCE;
IF OBJECT_ID('STUDENT') IS NOT NULL
DROP TABLE STUDENT;
IF OBJECT_ID('STAFF') IS NOT NULL
DROP TABLE STAFF;
IF OBJECT_ID('SEMINAR') IS NOT NULL
DROP TABLE SEMINAR;

GO

CREATE TABLE STUDENT(
STUID INT
, FULLNAME NVARCHAR(50)
, GENDER NVARCHAR(1)
, PRIMARY KEY (STUID)
);
CREATE TABLE STAFF(
STFID INT
, FULLNAME NVARCHAR(50)
, GENDER NVARCHAR(1)
, PRIMARY KEY (STFID)
);
CREATE TABLE SEMINAR(
SEMID INT
, TITLE NVARCHAR(50)
, SDATE DATETIME
, PRIMARY KEY (SEMID)
);
CREATE TABLE STAFF_ALLOCATION( 
  SEMID INT
, STFID INT
, PRIMARY KEY (SEMID, STFID)
, FOREIGN KEY (SEMID) REFERENCES SEMINAR
, FOREIGN KEY (STFID) REFERENCES STAFF  
);

CREATE TABLE ATTENDANCE(
  SEMID INT
, STUID INT
, SCORE INT
, PRIMARY KEY (STUID, SEMID)
, FOREIGN KEY (STUID) REFERENCES STUDENT  
, FOREIGN KEY (SEMID) REFERENCES SEMINAR
);
GO

INSERT INTO STUDENT (STUID, FULLNAME, GENDER) VALUES
(2719000, 'Emma Jay', 'F'),
(9091431, 'Dave Smith', 'M'),
(9198122, 'Jane Jones', 'F'),
(8184399, 'Mike Toll', 'M');
INSERT INTO STAFF (STFID, FULLNAME, GENDER) VALUES
(131, 'Karen Lovell', 'F'),
(232, 'Denise Randle', 'F'),
(455, 'Sean Mellerick', 'F'),
(217, 'Anna Langely', 'F');
INSERT INTO SEMINAR (SEMID, TITLE, SDATE) VALUES
(401, 'Database Security', '13-JAN-2020'),
(402, 'Agile Programming', '14-JAN-2020'),
(406, 'Business Intelligence', '13-JAN-2020'),
(409, 'Social Media Analytics', '14-JAN-2020');
INSERT INTO STAFF_ALLOCATION (SEMID, STFID) VALUES
(401, 131),
(401, 455),
(402, 131),
(402, 217),
(406, 455);
INSERT INTO ATTENDANCE(SEMID, STUID, SCORE) VALUES
(401, 9091431, 8),
(401, 9198122, 5),
(401, 8184399, 7),
(402, 9198122, 6),
(402, 9091431, 7),
(406, 9198122, 4);

