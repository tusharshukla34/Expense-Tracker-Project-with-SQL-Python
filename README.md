# Expenses-Tracker-Project-with-SQL-Python

# Expense Tracker 🧾💸

A simple, lightweight Expense Tracker built with **Python** and **SQL**.  
Track expenses, organize them by category, view monthly summaries and top spending categories. Designed for learning, small personal use, and as a starter project to extend.

## 🔍 Project overview
This project stores expense records in an SQL database and provides a small Python CLI/utility to add, edit, delete and query expenses. It shows examples of:
- SQL schema design for expenses and categories
- Basic CRUD operations (Create, Read, Update, Delete)
- Useful SQL reports (monthly totals, category breakdowns)
- Python integration (using `sqlite3` or `SQLAlchemy`)

## ⭐ Features
- Add / edit / delete expenses
- Categorize expenses (Food, Transport, Rent, etc.)
- Monthly totals and monthly-by-category reports
- Top N categories by total spending
- Export summaries to CSV (example)
- Easy to extend to a web UI (Flask/FastAPI) or GUI

## 🧱 Tech stack
- Python 3.8+
- MySQL (default, zero config) — easily switchable to PostgreSQL/SQLite
- `Mysql.connector` and `SQLAlchemy` (example included)
- `Pandas` and `Matplotlib` (example included) (for CSV/export/reporting/visualization)

