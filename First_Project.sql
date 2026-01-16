
--Book Table creation--
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
    Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(100),
	Genre VARCHAR(100),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

--Customer Table creation--
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(15),
	City VARCHAR(100),
	Country	VARCHAR(100)
);

--Orders Table Creation --
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_ID),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);

---See the table structure---
SELECT * FROM Books ;
SELECT * FROM Customers;
SELECT * FROM Orders;

--IMPORTING THE CSV FILES-----

-- BOOKS TABLE IMPORT--
--USE Your PLSQL Tool and copy and paste like this 1st Books tables path --- 

\copy Books(Book_ID ,Title ,Author ,Genre ,Published_year ,Price ,Stock )
FROM 'C:\Users\PC\Desktop\PostgreSQL LEARNING\Project1\Books.csv'
CSV HEADER;


-- Customers IMPORT---
-- 2nd Customers table path--

\copy Customers(Customer_ID ,Name ,Email ,Phone ,City ,Country )
FROM 'C:\Users\PC\Desktop\PostgreSQL LEARNING\Project1\Customers.csv'
CSV HEADER;

--Orders IMPORT---
-- 3rd Orders table path--

\copy Orders(Order_ID,Customer_ID ,Book_ID ,Order_Date ,Quantity ,Total_Amount )
FROM 'C:\Users\PC\Desktop\PostgreSQL LEARNING\Project1\Orders.csv'
CSV HEADER;

-- To Check Csv Data has been uploaded into tables---
SELECT * FROM Books LIMIT 20;
SELECT * FROM Customers LIMIT 20;
SELECT * FROM Orders LIMIT 20;


------**Queries Starts From Here**-----

--Retrieve all books from "Fiction" Genre--
SELECT Book_id , Title
FROM Books 
WHERE Genre = 'Fiction';

--Find books published after 1950--
SELECT Book_id , Title , Genre, Published_year
FROM Books 
WHERE Published_year > 1950;

--List all the customers from CANADA--
SELECT * 
FROM Customers 
WHERE Country = 'Canada';

--Show all the orders placed in November 2023--
SELECT * 
FROM Orders 
WHERE Order_date >= '2023-11-01'
AND Order_date <  '2023-12-01';

--Retrieve the total stock of books available --
SELECT SUM(Stock) AS Total_Books_Available 
FROM Books;

--Find the details of most expensive 5 books--
SELECT Title, Author, Genre , Price 
FROM Books 
ORDER BY Price DESC LIMIT 5;

---Show all the customers who ordered more than one book--
SELECT Customer_ID , Book_ID , Quantity 
FROM Orders 
WHERE Quantity > 1;

--Retrieve all the orders where order value exceeds 200--
SELECT Customer_ID, Quantity , Total_Amount 
from Orders
WHERE Total_Amount > 200;

--List all the genre's available in the books table--
SELECT DISTINCT Genre From Books;

---Find the book with lowest Stock--
SELECT * FROM Books 
ORDER BY Stock ASC LIMIT 1;

---Calculate All the revenue generated From all the orders--
SELECT SUM(Total_Amount) AS Total_Revenue FROM Orders;

---** ADVANCE Queries**---

--Retrieve the total number of books sold for each Genre--
SELECT b.Genre , SUM( o.Quantity ) AS TOTAL_QUANTITY
FROM Books b 
JOIN Orders o
ON b.Book_ID = o.Book_ID
GROUP BY b.Genre;

--- Find the average book price in "Fantasy" Genre--
Select ROUND(AVG(Price),2) AS AVG_PRICE 
FROM Books 
WHERE Genre = 'Fantasy';

--List the Customers who have placed at least 2 orders--
SELECT c.Customer_ID ,c.Name, COUNT(o.Order_ID) AS ORDER_COUNT
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID, c.Name
HAVING COUNT(o.Order_ID) >=2;

-- Find the most Frequently ORDERED BOOKS--

SELECT o.Book_ID , b.Title , COUNT(o.Book_ID) AS Frequent_Books
FROM Orders o
JOIN Books b
ON o.Book_ID = b.Book_ID
GROUP BY o.Book_ID, b.Title
ORDER BY COUNT(o.Book_ID) DESC LIMIT 10;

--Show the top 3 most expensive books of fantasy genre--

SELECT Title , Author , price 
From Books 
WHERE Genre = 'Fantasy'
ORDER BY Price DESC LIMIT 3;


--REtrieve the total quantity of books sold by each Author--

SELECT b.Author ,b.Genre,  SUM(o.Quantity) AS Total_Sold 
From Books b
JOIN Orders o
ON o.Book_ID = b.Book_ID
GROUP BY b.Author,b.Genre;

--- List the cities where customers who spent over $30 are located--

SELECT c.Name, c.City , o.Total_Amount
FROM Customers c
JOIN Orders o
ON c.Customer_id = o.Customer_ID
WHERE Total_Amount >= 30
ORDER BY Total_Amount DESC;

--- Find the customer who spent most on orders --

SELECT c.Customer_ID, c.Name ,c.Phone,  c.City , SUM(o.Total_Amount) as Amount_Spent
FROM Customers c
JOIN Orders o
ON c.Customer_id = o.Customer_ID
GROUP BY c.Customer_ID, c.Name ,c.Phone,  c.City
ORDER BY SUM(o.Total_Amount) DESC LIMIT 2;

---Calculate the stock remaining after fulfilling all the orders--

SELECT b.Book_id , b.Title , b.Stock , COALESCE(SUM(o.quantity),0) As Order_quantity,
b.Stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity 
FROM Books b
LEFT JOIN orders o 
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock
ORDER BY Book_ID ASC;






