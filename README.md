# 🍲 Recipe & Ingredient Database Project (SQL)

A structured **SQL relational database project** that manages recipes, categories, ingredients, and their quantities. This project demonstrates real-world database design using normalization and relationships between multiple tables.

---

## 📌 Project Overview

This project simulates a **Recipe Management System** where:
- Recipes belong to different categories
- Each recipe contains multiple ingredients
- Each ingredient has a specific quantity
- Relationships are handled using foreign keys and mapping tables

---

## 🛠️ Technologies Used

- SQL (MySQL / PostgreSQL compatible)
- Relational Database Design
- Joins & Subqueries
- Aggregation Functions

---

## 🗂️ Database Structure

### 1. Categories Table
Stores recipe categories.

| Column | Description |
|--------|-------------|
| Category_ID | Primary Key |
| Category_Name | Name of category |

---

### 2. Recipes Table
Stores recipe details.

| Column | Description |
|--------|-------------|
| Recipe_ID | Primary Key |
| Recipe_Name | Name of recipe |
| Recipe_description | Description |
| Cooking_Time | Time required (minutes) |
| Category_ID | Foreign Key |

---

### 3. Ingredients Table
Stores ingredient names.

| Column | Description |
|--------|-------------|
| Ingredient_ID | Primary Key |
| Ingredient_Name | Ingredient name |

---

### 4. Amount Table
Stores quantity values.

| Column | Description |
|--------|-------------|
| Amount_ID | Primary Key |
| Amount_Quantity | Quantity (e.g., 1 cup, 2 tbsp) |

---

### 5. Recipe_Ingredients Table
Mapping table connecting recipes and ingredients.

| Column | Description |
|--------|-------------|
| Recipe_ID | Foreign Key |
| Ingredient_ID | Foreign Key |
| Amount_ID | Foreign Key |
| Composite Key | (Recipe_ID, Ingredient_ID) |

---

## 🔗 Database Relationships

- One Category → Many Recipes  
- Many Recipes ↔ Many Ingredients (via Recipe_Ingredients)  
- Each ingredient has a defined quantity  

---


##📸 Screenshots
![Er Diagram](images/er-diagram.png)
![Create Query](images/create-query.png)
![select query](images/select-query.png)
![select query result](images/select-query-result.png)
![table recipr](images/table-recipr.png)






#
# 📊 Features Implemented

✔ Inserted sample dataset for recipes  
✔ Normalized relational database structure  
✔ Many-to-many relationship handling  
✔ Foreign key constraints  
✔ Real-world SQL queries  
✔ Data aggregation and filtering  

---

## 🧠 SQL Concepts Used

- CREATE DATABASE / TABLE
- PRIMARY & FOREIGN KEYS
- INNER JOIN
- GROUP BY
- COUNT / SUM / AVG
- ORDER BY
- LIKE operator
- Subqueries

---

## 📌 Sample Queries

### 🔹 Get all recipes with categories
```sql


SELECT r.Recipe_name, c.Category_name
FROM Recipes r
JOIN Categories c ON r.Category_ID = c.Category_ID;


