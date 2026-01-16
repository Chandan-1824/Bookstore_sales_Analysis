# 📚 Bookstore Sales Analysis – SQL Project

## 📌 Project Overview

This project focuses on managing and analyzing **bookstore data** using **SQL**. It covers **Books, Customers, and Orders**, providing insights into sales, stock, customer behavior, and revenue generation.

The project demonstrates practical SQL skills such as **table creation, data import, joins, aggregations, filtering, and advanced queries**, making it suitable for beginner to intermediate Data Analyst learning projects.

---

## 🗂️ Database & Table Structure

### Tables

1. `Books` – Information about books available in the store
2. `Customers` – Customer details
3. `Orders` – Orders placed by customers

### Table Schemas

**Books**

| Column Name    | Data Type     | Description     |
| -------------- | ------------- | --------------- |
| Book_ID        | SERIAL (PK)   | Unique book ID  |
| Title          | VARCHAR(100)  | Book title      |
| Author         | VARCHAR(100)  | Author name     |
| Genre          | VARCHAR(100)  | Book genre      |
| Published_Year | INT           | Year published  |
| Price          | NUMERIC(10,2) | Book price      |
| Stock          | INT           | Stock available |

**Customers**

| Column Name | Data Type    | Description        |
| ----------- | ------------ | ------------------ |
| Customer_ID | SERIAL (PK)  | Unique customer ID |
| Name        | VARCHAR(100) | Customer name      |
| Email       | VARCHAR(100) | Customer email     |
| Phone       | VARCHAR(15)  | Customer phone     |
| City        | VARCHAR(100) | City               |
| Country     | VARCHAR(100) | Country            |

**Orders**

| Column Name  | Data Type     | Description                |
| ------------ | ------------- | -------------------------- |
| Order_ID     | SERIAL (PK)   | Unique order ID            |
| Customer_ID  | INT (FK)      | Customer placing the order |
| Book_ID      | INT (FK)      | Book being ordered         |
| Order_Date   | DATE          | Date of order              |
| Quantity     | INT           | Number of books ordered    |
| Total_Amount | NUMERIC(10,2) | Total price for the order  |

---

## 🧹 Data Import Steps

* Imported CSV files into each table using `\copy` command in PostgreSQL
* Verified data by selecting first 20 rows from each table

```sql
\copy Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) FROM 'Books.csv' CSV HEADER;
\copy Customers(Customer_ID, Name, Email, Phone, City, Country) FROM 'Customers.csv' CSV HEADER;
\copy Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) FROM 'Orders.csv' CSV HEADER;
```

---

## 📊 Key SQL Analysis Performed

### 1️⃣ Books & Stock Analysis

* Retrieve all books of 'Fiction' genre
* Find books published after 1950
* Total stock available
* Most expensive 5 books
* Lowest stock book
* Average price for 'Fantasy' genre
* Remaining stock after fulfilling orders

### 2️⃣ Customer Analysis

* List all customers from Canada
* Customers who have placed at least 2 orders
* Customers who spent most on orders
* Cities of customers who spent over $30

### 3️⃣ Orders & Sales Analysis

* Orders placed in November 2023
* Orders where quantity > 1
* Orders exceeding $200
* Total revenue generated
* Total number of books sold per genre
* Most frequently ordered books
* Top 3 most expensive books in Fantasy genre
* Total quantity of books sold by each author

---

## 🧠 Advanced SQL Concepts Used

* `JOIN`s between tables for combined analysis
* Aggregations with `SUM`, `COUNT`, `AVG`
* Filtering with `WHERE` and `HAVING`
* Ordering with `ORDER BY` and `LIMIT`
* Handling NULL values with `COALESCE`
* Grouping data by genre, author, or customer

---

## 🛠️ Tools & Technologies

* **Database:** PostgreSQL
* **Language:** SQL
* **Environment:** pgAdmin / PostgreSQL command line
* **Tools For Data Cleaning:** Excel
* **Data Files:** CSV

---

## 🎯 Key Learnings

* Hands-on experience with **bookstore transactional data**
* Learned to **import CSV data** into SQL tables
* Improved **querying skills** including joins, aggregates, and filtering
* Understood **business insights extraction** from multiple tables
* Learned **advanced SQL concepts** like `COALESCE` and `HAVING`

---

## 🚀 Future Improvements

* Add views for reusable queries
* Include profit/loss calculation per book
* Create dashboards using Power BI / Tableau
* Implement user-defined functions for recurring calculations

---

## 👤 Author

**Chandan Mistry**
CSE Student | Aspiring Data Analyst

📧 Contact: *chandanmistry844@gmail.com*

---

⭐ *If you like this project, feel free to fork, star, or suggest improvements!*
