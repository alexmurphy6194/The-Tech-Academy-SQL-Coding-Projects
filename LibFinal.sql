create database Library
use Library


create table LIBRARY_BRANCH (
BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
BranchName varchar(50) NOT NULL,
LibAddress varchar(100) NOT NULL
);
create table PUBLISHER (
PublisherName varchar(50) PRIMARY KEY NOT NULL,
PublisherAddress varchar(50) NOT NULL,
PublisherPhone varchar(50) NOT NULL
);
create table BOOKS (
BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
Title varchar(50) NOT NULL,
PublisherName varchar(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);


create table BOOK_AUTHORS (
BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName varchar(50) NOT NULL
);

create table BORROWER (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
BorrowerName varchar(50) NOT NULL,
BorrowerAddress varchar(50) NOT NULL,
BorrowerPhone varchar(50) NOT NULL
);

create table BOOK_LOANS (
LoanBookID INT NOT NULL CONSTRAINT fk_LoanBookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
LoanBranchID INT NOT NULL CONSTRAINT fk_LoanBranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
LoanCardNo INT NOT NULL CONSTRAINT fk_LoanCardNo FOREIGN KEY REFERENCES BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut varchar(50) NOT NULL,
DateDue varchar(50) NOT NULL
);

create table BOOK_COPIES (
CopiesBookID INT NOT NULL CONSTRAINT fk_CopiesBookID FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
LoanBranchID INT NOT NULL CONSTRAINT fk_CopiesBranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
NumberOfCopies INT NOT NULL
);

/*Insert Statements*/

insert into LIBRARY_BRANCH
(BranchName, LibAddress)
VALUES
('Sharpstown', '79 NE. Cypress St.'),
('Central', '81 Prairie Rd.'),
('East Side', '8114 Laurel Drive'),
('West Side', '630 High Noon St.')
;

insert into PUBLISHER
(PublisherName, PublisherAddress, PublisherPhone)
VALUES
('Random House Books', '3192 Oakmound Road', '772-979-4058'),
('Penguin Books', '3022 Bartlett Avenue', '248-608-5822'),
('Big Boy Publishing Co', '1731 Benedum Drive', '845-267-5361')
;

insert into BOOKS
(Title, PublisherName)
VALUES
('The Pirates President', 'Random House Books'),
('Rainbow in the Dust', 'Random House Books'),
('The Lost Tribe', 'Random House Books'),
('Candidates Wager', 'Random House Books'),
('The Land of Jody', 'Random House Books'),
('Brothers Code', 'Random House Books'),
('Foolish Boys', 'Random House Books'),
('The Lady in Human', 'Penguin Books'),
('Fragment in the Underworld', 'Penguin Books'),
('Brother Maiden', 'Penguin Books'),
('Tarzan the Stick', 'Penguin Books'),
('The Cheating Menagerie', 'Penguin Books'),
('Brotherhood of Cthulhu', 'Penguin Books'),
('Objects of Intrigue', 'Penguin Books'),
('Baby Nurses', 'Big Boy Publishing Co'),
('A Dance in Spain', 'Big Boy Publishing Co'),
('Southern Mansions', 'Big Boy Publishing Co'),
('The Ruby in the Clock', 'Big Boy Publishing Co'),
('Dreamers Perfume', 'Big Boy Publishing Co'),
('Orion and the Godfather', 'Big Boy Publishing Co'),
('A Creature of Day', 'Big Boy Publishing Co')
;

INSERT INTO BOOK_AUTHORS
(BookID, AuthorName)
VALUES
(100, 'Julia Miller'),
(101, 'Josh	George'),
(102, 'Stephen King'),
(103, 'Herbert Rodriquez'),
(104, 'Agnes Mack'),
(105, 'Susie Curry'),
(106, 'Alexis Wallace'),
(107, 'Chester Bradley'),
(108, 'Jacob Bennett'),
(109, 'Jorge Fox'),
(110, 'Carolyn Henry'),
(111, 'Else	Farrar'),
(112, 'Stephen King'),
(113, 'Maryanna	Garrison'),
(114, 'Johanne Alderman'),
(115, 'Dorethea Silver'),
(116, 'Donny Mcelroy'),
(117, 'Zoila Kitchens'),
(118, 'Kitty Conroy'),
(119, 'Cheyenne Hanes'),
(120, 'Earleen Kimble')
;

insert into BORROWER 
(BorrowerName,BorrowerAddress, BorrowerPhone)
VALUES
('Melissa	Clark', '2247 Timber Ridge Road', '916-767-0727'),
('Kathryn	Watson', '3326 Lamberts Branch Road', '786-553-9493'),
('Kathleen Reed', '2130 Ritter Avenue', '586-755-1493'),
('Joyce Lee', '3791 Shadowmar Drive', '504-728-0471'),
('Donald Jenkins', '4283 Blue Spruce Lane', '410-333-0018'),
('Gloria Campbell', '4506 Fantages Way', '207-763-3023'),
('Christine Bryant', '2082 Clay Lick Road', '720-849-6172'),
('Eugene Johnson', '3896 Lawman Avenue', '703-310-7978'),
('Murph Diggity', '1000 Thousand St.', '135-574-4302')
;

insert into BOOK_LOANS
(LoanBookID, LoanBranchID, LoanCardNo, DateOut, DateDue)
VALUES
(100 ,1,2001,'01/18/2018' ,'05/18/2018'),
(100 ,1,2003,'02/08/2018' ,'05/22/2018'),
(100 ,2,2005,'03/11/2018' ,'05/12/2018'),
(100 ,3,2006,'03/16/2018' ,'04/30/2018'),
(100 ,4,2000,'01/28/2018' ,'06/07/2018'),
(101 ,1,2001,'02/05/2018' ,'05/21/2018'),
(101 ,1,2005,'01/26/2018' ,'06/01/2018'),
(101 ,2,2004,'01/07/2018' ,'06/04/2018'),
(101 ,2,2007,'01/10/2018' ,'07/09/2018'),
(101 ,3,2000,'03/10/2018' ,'04/25/2018'),
(101 ,4,2002,'01/12/2018' ,'04/21/2018'),
(102 ,1,2001,'03/10/2018' ,'04/19/2018'),
(102 ,2,2003,'03/18/2018' ,'06/08/2018'),
(102 ,2,2006,'01/21/2018' ,'05/12/2018'),
(102 ,3,2005,'02/02/2018' ,'04/03/2018'),
(102 ,4,2000,'02/26/2018' ,'07/01/2018'),
(103 ,1,2001,'01/25/2018' ,'05/12/2018'),
(103 ,2,2002,'02/14/2018' ,'05/05/2018'),
(103 ,3,2007,'03/13/2018' ,'06/04/2018'),
(104 ,4,2001,'03/07/2018' ,'07/01/2018'),
(104 ,4,2005,'02/09/2018' ,'06/07/2018'),
(104 ,3,2006,'03/09/2018' ,'05/12/2018'),
(104 ,2,2000,'03/05/2018' ,'05/13/2018'),
(105 ,1,2001,'01/13/2018' ,'05/05/2018'),
(105 ,2,2003,'03/04/2018' ,'04/21/2018'),
(106 ,3,2002,'01/04/2018' ,'07/10/2018'),
(107 ,4,2004,'01/03/2018' ,'05/12/2018'),
(107 ,1,2006,'02/10/2018' ,'04/25/2018'),
(107 ,2,2002,'01/12/2018' ,'07/18/2018'),
(108 ,3,2005,'02/04/2018' ,'07/09/2018'),
(108 ,4,2007,'02/14/2018' ,'04/21/2018'),
(109 ,3,2001,'02/26/2018' ,'05/21/2018'),
(109 ,2,2005,'02/16/2018' ,'04/30/2018'),
(109 ,1,2003,'02/19/2018' ,'06/07/2018'),
(110 ,1,2000,'01/26/2018' ,'09/20/2018'),
(110 ,2,2004,'03/06/2018' ,'04/27/2018'),
(111 ,3,2006,'01/23/2018' ,'04/21/2018'),
(111 ,4,2007,'02/22/2018' ,'06/05/2018'),
(112 ,2,2002,'01/29/2018' ,'05/12/2018'),
(113 ,1,2004,'02/10/2018' ,'05/30/2018'),
(113 ,2,2005,'01/29/2018' ,'04/25/2018'),
(114 ,3,2002,'03/17/2018' ,'07/01/2018'),
(114 ,4,2007,'02/27/2018' ,'05/17/2018'),
(115 ,3,2004,'01/29/2018' ,'06/05/2018'),
(116 ,4,2000,'02/10/2018' ,'07/01/2018'),
(117 ,2,2004,'02/27/2018' ,'07/09/2018'),
(118 ,1,2001,'02/06/2018' ,'05/05/2018'),
(118 ,2,2000,'01/29/2018' ,'04/21/2018'),
(119 ,3,2002,'02/10/2018' ,'06/04/2018'),
(120 ,4,2006,'03/17/2018' ,'05/05/2018'),
(120 ,1,2007,'02/27/2018' ,'06/08/2018')
;

insert into BOOK_COPIES 
(CopiesBookID, LoanBranchID, NumberOfCopies)
VALUES
(100, 1, 3),
(102, 1, 3),
(104, 1, 5),
(107, 1, 7),
(109, 1, 6),
(111, 1, 5),
(112, 1, 2),
(114, 1, 4),
(116, 1, 3),
(118, 1, 8),
(120, 1, 3),
(102, 2, 2),
(103, 2, 4),
(105, 2, 5),
(106, 2, 6),
(108, 2, 7),
(109, 2, 8),
(112, 2, 9),
(117, 2, 3),
(118, 2, 4),
(119, 2, 5),
(100, 3, 7),
(105, 3, 6),
(106, 3, 5),
(107, 3, 4),
(109, 3, 3),
(110, 3, 2),
(111, 3, 2),
(113, 3, 2),
(114, 3, 3),
(117, 3, 3),
(102, 4, 3),
(104, 4, 4),
(105, 4, 9),
(106, 4, 8),
(108, 4, 7),
(109, 4, 7),
(110, 4, 6),
(115, 4, 5),
(116, 4, 5),
(117, 4, 4)
;

/*Queries*/
go
create proc sharpsTribe
as
select NumberOfCopies from BOOK_COPIES
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.BranchID = BOOK_COPIES.LoanBranchID
inner join BOOKS on BOOKS.BookID = BOOK_COPIES.CopiesBookID
where Title = 'The Lost Tribe' and BranchName = 'Sharpstown'

go
create proc allTribe
as
select LIBRARY_BRANCH.BranchName,NumberOfCopies from BOOK_COPIES
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.BranchID = BOOK_COPIES.LoanBranchID
inner join BOOKS on BOOKS.BookID = BOOK_COPIES.CopiesBookID
where Title = 'The Lost Tribe'

go
create proc noLoans
as
select BorrowerName from BORROWER
left join BOOK_LOANS ON BOOK_LOANS.LoanCardNo = BORROWER.CardNo
where LoanCardNo IS NULL;

go
create proc sharpstownToday
as
select BOOKS.Title, BORROWER.BorrowerName, BORROWER.BorrowerAddress from BOOKS
inner join BOOK_LOANS ON BOOK_LOANS.LoanBookID = BOOKS.BookID
inner join BORROWER ON BORROWER.CardNo = BOOK_LOANS.LoanCardNo
where BOOK_LOANS.LoanBranchID = 1 and BOOK_LOANS.DateDue = '09/20/2018'

go
create proc countBranchLoans
as
select COUNT(*) as 'Loans',LIBRARY_BRANCH.BranchName from BOOK_LOANS
inner join LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.LoanBranchID
GROUP BY LIBRARY_BRANCH.BranchName

go
create proc moreThanFive
as
select BORROWER.BorrowerName, BORROWER.BorrowerAddress, count(BOOK_LOANS.LoanCardNo) as 'Number of Books on Loan' from BORROWER
inner join BOOK_LOANS ON BOOK_LOANS.LoanCardNo = BORROWER.CardNo
GROUP BY BORROWER.BorrowerName, BORROWER.BorrowerAddress
HAVING COUNT(BOOK_LOANS.LoanCardNo) >= 5;

go
create proc booksByStephenAtCentral
as
select BOOKS.Title, BOOK_COPIES.NumberOfCopies from BOOKS
inner join BOOK_COPIES on BOOK_COPIES.CopiesBookID = BOOKS.BookID
inner join LIBRARY_BRANCH on LIBRARY_BRANCH.BranchID = BOOK_COPIES.LoanBranchID
inner join BOOK_AUTHORS on BOOK_AUTHORS.BookID = BOOKS.BookID
where LIBRARY_BRANCH.BranchName = 'Central' and BOOK_AUTHORS.AuthorName = 'Stephen King'

exec sharpsTribe
exec allTribe
exec noLoans
exec sharpstownToday
exec countBranchLoans
exec moreThanFive
exec booksByStephenAtCentral







