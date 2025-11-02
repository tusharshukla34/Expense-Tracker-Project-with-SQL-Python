create database expense_tracker;
use expense_tracker;

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE expenses (
    expense_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    amount DECIMAL(10,2),
    expense_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


INSERT INTO categories (category_id, name) VALUES
(1, 'Food'),
(2, 'Transport'),
(3, 'Shopping'),
(4, 'Healthcare'),
(5, 'Entertainment'),
(6, 'Bills'),
(7, 'Travel'),
(8, 'Education'),
(9, 'Groceries'),
(10, 'Miscellaneous');

INSERT INTO expenses (category_id, amount, expense_date, description) VALUES
-- July
(1, 450.00, '2025-07-05', 'Lunch with friends'),
(2, 320.00, '2025-07-10', 'Auto fare'),
(9, 980.00, '2025-07-15', 'Monthly groceries'),
(5, 600.00, '2025-07-20', 'Movie night'),
(6, 1200.00, '2025-07-25', 'Electricity bill'),

-- August
(1, 700.00, '2025-08-03', 'Dinner at restaurant'),
(3, 2500.00, '2025-08-09', 'New shoes'),
(4, 800.00, '2025-08-12', 'Doctor visit'),
(9, 1020.00, '2025-08-20', 'Monthly groceries'),
(2, 400.00, '2025-08-27', 'Cab ride'),

-- September
(7, 5000.00, '2025-09-05', 'Trip to Goa'),
(1, 560.00, '2025-09-08', 'Office lunch'),
(8, 2500.00, '2025-09-12', 'Online course'),
(9, 950.00, '2025-09-15', 'Groceries'),
(10, 300.00, '2025-09-25', 'Stationery'),

-- October
(6, 1350.00, '2025-10-02', 'Internet + Electricity'),
(5, 900.00, '2025-10-08', 'Netflix + Party'),
(2, 700.00, '2025-10-10', 'Fuel refill'),
(9, 1050.00, '2025-10-20', 'Monthly groceries'),
(3, 2100.00, '2025-10-28', 'Clothes shopping'),

-- November
(7, 8500.00, '2025-11-02', 'Himachal Trip'),
(1, 800.00, '2025-11-05', 'Dinner'),
(4, 600.00, '2025-11-15', 'Medicines'),
(9, 990.00, '2025-11-20', 'Groceries'),
(10, 400.00, '2025-11-25', 'Donations'),

-- December
(3, 3200.00, '2025-12-03', 'Winter clothes'),
(5, 1100.00, '2025-12-10', 'Christmas party'),
(2, 500.00, '2025-12-15', 'Bus tickets'),
(9, 970.00, '2025-12-20', 'Groceries'),
(6, 1800.00, '2025-12-25', 'Utility bills');



select * from categories;

select * from expenses;

-- total spent by category

select c.name as category, sum(amount) from categories c join expenses e on c.category_id = e.category_id group by c.name;  


-- Q total expense per month 

select date_format(expense_date, '%y-%m') as month, sum(amount) as total_amount from expenses group by month order by month;


-- Q top 5 most expensive items


select * from expenses;
select * from categories;

select c.name,sum(e.amount) as amount from categories c join expenses e on c.category_id = e.category_id group by c.name order by amount desc limit 5;


-- Q Avg expenses per category

select c.name as category, avg(e.amount) from categories c join expenses e on c.category_id = e.category_id group by category; 

-- Q what are expense distribution in nov month

select * from categories c join expenses e on c.category_id = e.category_id where expense_date between '2025-11-01' and '2025-11-30';


-- Q compare travel expenses month-over-month

select c.name as category,date_format(e.expense_date, '%y-%m') as Month , lead(e.amount)  over (partition by c.name order by e.expense_date)  amount from categories c 
join expenses e on c.category_id = e.category_id;


SELECT 
    DATE_FORMAT(expense_date, '%Y-%m') AS month,
    SUM(e.amount) AS total_travel_expense
FROM expenses e JOIN categories c  ON e.category_id = c.category_id WHERE  c.name = 'Travel' GROUP BY month ORDER BY month;

