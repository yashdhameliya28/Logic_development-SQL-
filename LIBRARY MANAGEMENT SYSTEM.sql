--1. Display all members who joined in the year 2024.
SELECT FULLNAME
FROM MEMBERS
WHERE YEAR(JOINDATE) = 2024

--2. Show all books written by a specific author (e.g., "J.K. Rowling").
SELECT	TITLE AS BOOKNAME,
		AUTHOR AS BOOKAUTHOR
FROM BOOKS 

--3. List all books that have zero available copies.
SELECT	TITLE AS BOOKNAME
FROM BOOKS
WHERE AVAILABLECOPIES = 0

--4. Find all borrow records where the book has not been returned yet (ReturnDate ISNULL).
SELECT	B.TITLE AS BOOKNAME
FROM BOOKS B
JOIN BORROWRECORDS BR
ON B.BOOKID = BR.BOOKID
WHERE BR.RETURNDATE IS NULL

--5. Show all members who have borrowed at least one book.
SELECT	M.FULLNAME AS MEMBERNAME
FROM MEMBERS M
JOIN BORROWRECORDS BR
ON M.MEMBERID = BR.MEMBERID
GROUP BY M.FULLNAME
HAVING COUNT(BR.BORROWID) > 0

--6. List all books borrowed by a specific member (using MemberID).
SELECT FULLNAME
FROM MEMBERS
WHERE MEMBERID IN (SELECT MEMBERID FROM BORROWRECORDS)

--7. Count how many books are available in each genre.
SELECT	GENRE AS BOOK_GENRE,
		COUNT(BOOKID) AS NO_OF_BOOKS
FROM BOOKS
GROUP BY GENRE

--8. Show the total number of books borrowed (all records count).
SELECT	COUNT(BORROWID)
FROM BORROWRECORDS

--9. Display members who have unpaid fines.
SELECT	M.FULLNAME AS MEMBERNAME
FROM BORROWRECORDS BR
JOIN MEMBERS M
ON BR.MEMBERID = M.MEMBERID
JOIN FINES F
ON F.BORROWID = BR.BORROWID
WHERE F.PAIDSTATUS = 'UNPAID'

--10. Get the total fine amount for each borrow record.
SELECT	BORROWID,
		SUM(FINEAMOUNT) AS TOTAL_AMOUNT
FROM FINES
GROUP BY BORROWID

--11. Show the most recently borrowed book (based on BorrowDate).
SELECT	TOP 1 B.TITLE AS BOOK_NAME,
		MAX(BR.BORROWDATE) AS BORROWED_DATE
FROM BOOKS B
JOIN BORROWRECORDS AS BR
ON B.BOOKID = BR.BOOKID
GROUP BY B.TITLE
ORDER BY MAX(BR.BORROWDATE) DESC

--12. List all members along with the number of books they have borrowed.
SELECT	M.FULLNAME AS MEMBER_NAME,
		COUNT(BR.BORROWID) AS TOTAL_NO_OF_BORROW
FROM MEMBERS M
LEFT JOIN BorrowRecords BR
ON M.MemberID = BR.MemberID
GROUP BY M.FullName

--13. Display books borrowed in the last 30 days.
SELECT	B.TITLE AS BOOK_NAME
FROM BOOKS B
JOIN BorrowRecords BR
ON B.BookID = BR.BookID
WHERE BR.BorrowDate >= DATEADD(DAY, -30, GETDATE())

--14. Show members who have borrowed more than one book.
SELECT	M.FULLNAME AS MEMBER_NAME,
		COUNT(BR.BORROWID) AS TOTAL_NO_OF_BOOK_BORROW
FROM MEMBERS M
JOIN BorrowRecords BR
ON M.MemberID = BR.MemberID
GROUP BY M.FullName
HAVING COUNT(BR.MemberID) > 1

--15. List all books that have never been borrowed.
SELECT	B.TITLE AS BOOK_NAME
FROM BOOKS B
WHERE B.BookID NOT IN (SELECT BookID FROM BorrowRecords)