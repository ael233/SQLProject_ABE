
/*
SQL Assignment
Adam Elias
*/

#1
SELECT *
FROM author;

#2
SELECT title, type
FROM book; 

#3
SELECT DISTINCT publisherCode
FROM book;

#4
SELECT title, price, (price * .75) AS discount
FROM book
LIMIT 5;

#5
SELECT title, price
FROM book
WHERE price > 20.00;

#6
SELECT publisherName
FROM publisher
WHERE city = "New York";

#7
SELECT publisherName
FROM publisher
WHERE city != "New York";

#8
SELECT bookCode, onHand 
FROM inventory
WHERE onHand BETWEEN 2 AND 4;

#9
SELECT title, type
FROM book
WHERE type IN ('SFI', 'HOR', 'ART', 'PSY')
ORDER BY type ASC
LIMIT 5;

#10
SELECT title
FROM book
WHERE title LIKE 'The%'
ORDER BY title ASC;

#11
SELECT title
FROM book
WHERE type IS NULL
ORDER BY title ASC;

#12
SELECT *
FROM author
ORDER BY lastName DESC;

#13
SELECT title, type
FROM book
ORDER BY type ASC, title ASC
LIMIT 5;

#14
SELECT COUNT(*) AS MyCount
FROM publisher
WHERE publisherName = 'Penguin USA';

#15
SELECT publisherCode, COUNT(*) AS NumPublished
FROM book
GROUP BY publisherCode
ORDER BY NumPublished DESC
LIMIT 5;

#16
SELECT publisherCode, COUNT(*) AS NumPublished
FROM book
GROUP BY publisherCode
HAVING NumPublished >= 3
ORDER BY publisherCode ASC;

#17
SELECT COUNT(*) AS NumberofBooks
FROM book
WHERE price <= 20;

#18
SELECT title
FROM book
WHERE price = (SELECT MAX(price) FROM book);


#19
SELECT title
FROM book
WHERE price = (SELECT MIN(price) FROM book);

#20
SELECT B.title, P.city
FROM book B
JOIN publisher P ON B.publisherCode = P.publisherCode
WHERE P.publisherCode IN (
	SELECT publisherCode
    FROM publisher
    WHERE city != 'New York')
ORDER BY P.city ASC;

#21
SELECT bookCode, title, b.publisherCode, type, price, paperback, p.publisherCode, publisherName, city
FROM book b, publisher p
WHERE b.publisherCode = p.publisherCode;

#22
SELECT *
FROM book B
JOIN publisher P ON B.publisherCode = P.publisherCode;

#23
SELECT B.title, P.city
FROM book B
JOIN publisher P ON  B.publisherCode = P.publisherCode
ORDER BY title ASC;

#24
SELECT B.title, A.lastName
FROM book B
JOIN wrote W ON B.bookCode = W.bookCode
JOIN author A ON W.authorNum = A.authorNum
ORDER by B.title ASC;

#25
SELECT title, I.branchNum, I.onHand
FROM book B
JOIN inventory I ON B.bookCode = I.bookCode
ORDER BY title ASC;

#26
SELECT title, BR.branchName, I.onHand
FROM book B
JOIN inventory I ON B.bookCode = I.bookCode
JOIN branch BR ON I.branchNum = BR.branchNum
ORDER BY title ASC;

#27
SELECT title, SUM(I.onHand) as Inventory
FROM book B
JOIN inventory I ON B.bookCode = I.bookCode
GROUP BY title
ORDER BY Inventory DESC;

SELECT paperback
FROM book;

#28
SELECT A.firstName, A.lastName, B.title
FROM book B
JOIN wrote W ON B.bookCode = W.bookCode
JOIN author A ON W.authorNum = A.authorNum
WHERE B.paperback = 'Y'
GROUP BY A.firstName, A.lastName, B.title
ORDER BY A.lastName, B.title;

#29
INSERT INTO branch 
VALUES (5, 'Henry Lexington Green', '127 South Road', 7);

SELECT *
FROM branch;

#30
UPDATE branch
SET branchLocation = "184 St. John's Way"
WHERE branchNum = 1;

SELECT * 
FROM branch;