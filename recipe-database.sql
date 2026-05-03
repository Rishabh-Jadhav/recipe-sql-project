CREATE DATABASE Recipe_And_Ingredient;
USE Recipe_And_Ingredient;

CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50) UNIQUE
);

INSERT INTO Categories VALUES
(201,'Main Course'),
(202,'Asian'),
(203,'Breakfast'),
(204,'Vegan'),
(205,'Italian'),
(206,'Healthy'),
(207,'Thai'),
(208,'Seafood'),
(209,'North Indian'),
(210,'Indian'),
(211,'Street Food');



CREATE TABLE Recipes (
    Recipe_ID INT PRIMARY KEY,
    Recipe_Name VARCHAR(80),
    Recipe_description TEXT,
    Cooking_Time INT,  
    Category_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

INSERT INTO Recipes VALUES
(1,'Paneer Butter Masala','Creamy tomato-based curry','30',201),
(2,'Veggie Stir-Fry Noodles','Wok-tossed noodles','20',202),
(3,'Aloo Paratha','Stuffed flatbread','25',203),
(4,'Lemon Herb Chicken','Grilled chicken','35',201),
(5,'Chana Masala','Spicy chickpea curry','30',204),
(6,'Mushroom Risotto','Creamy rice dish','40',205),
(7,'Masala Oats','Savory oats','15',206),
(8,'Thai Green Curry','Coconut curry','30',207),
(9,'Egg Bhurji','Scrambled eggs','10',203),
(10,'Garlic Butter Shrimp','Shrimp sauté','15',208);



CREATE TABLE Ingredients (
    Ingredient_ID INT PRIMARY KEY,
    Ingredient_Name VARCHAR(50) UNIQUE
);

INSERT INTO Ingredients VALUES
(101,'Paneer'),
(102,'Tomato'),
(103,'Cream'),
(104,'Butter'),
(105,'Garam Masala'),
(106,'Noodles'),
(107,'Bell Peppers'),
(108,'Soy Sauce'),
(109,'Garlic'),
(110,'Oil'),
(111,'Onion'),
(112,'Chicken'),
(113,'Rice'),
(114,'Chickpeas');


CREATE TABLE Amount (
    Amount_ID INT PRIMARY KEY,
    Amount_Quantity VARCHAR(30)
);

INSERT INTO Amount VALUES
(1,'1 cup'),
(2,'2 tbsp'),
(3,'1 tsp'),
(4,'200g'),
(5,'to taste');







CREATE TABLE Recipe_Ingredients (
    Recipe_ID INT,
    Ingredient_ID INT,
    Amount_ID INT,
    PRIMARY KEY (Recipe_ID, Ingredient_ID),
    FOREIGN KEY (Recipe_ID) REFERENCES Recipes(Recipe_ID),
    FOREIGN KEY (Ingredient_ID) REFERENCES Ingredients(Ingredient_ID),
    FOREIGN KEY (Amount_ID) REFERENCES Amount(Amount_ID)
);




select * from Recipes;
select * from Ingredients;
select * from Categories;                                         
select * from Amount;
select * from Recipes_and_ingredients;


 -- Recipes and Ingredients Project Queries
 
 
 
-- 1) Display the names and descriptions of all recipes.

select Recipe_Name,Recipe_description from Recipes;


 -- 2) Display the recipes that take exactly 30 minutes to Cook.
 
select Recipe_Name,cooking_time from recipes where cooking_time="30 min" ;


 -- 3)Display the recipe names along with their corresponding category names.
 
select recipes.Recipe_name ,categories.category_name from
recipes inner join categories on recipes.category_ID=categories.category_ID;


-- 4)Display the category of the recipe ‘Rajma Chawal’.

select recipes.Recipe_name ,categories.category_name from recipes inner join categories on recipes.category_ID=categories.category_ID where recipe_name="Rajma Chawal";


-- 5) Count the total number of recipes available.

select count(*)from recipes;


-- 6) Display all the distinct categories used in the category table.

select category_name from categories group by category_name;


-- 7) Display the recipes along with their corresponding ingredients.

select r.recipe_name,i.ingredient_name
from recipes r inner join recipes_and_ingredients ri on
r.recipe_id=ri.recipe_id inner join ingredients i on ri.ingredient_id=i.ingredient_id;


-- 8) Count the total number of ingredients used.

select count(*) from ingredients;


-- 9) Display all distinct ingredients used in the database.

select ingredient_name from ingredients group by ingredient_name;


-- 10) Display the recipes that include 'onion' as an ingredient.

select r.recipe_name,i.ingredient_name
from recipes r join recipes_and_ingredients ri
on r.recipe_id=ri.recipe_id join ingredients i
on i.ingredient_id=ri.ingredient_id where ingredient_name="onion";


-- 11) Display the top 3 recipes that take the longest time to cook.

select cooking_time from recipes order by cooking_time desc limit 3;


-- 12) Calculate the total cooking time for all recipes combined.

select sum(cooking_time) from recipes;


-- 13) Display all recipes whose names start with the letter ‘P’.

select * from recipes where recipe_name like 'P%';


-- 14) Display the number of recipes available in each category.

select categories.category_name,count(recipes.recipe_name)
from categories inner join recipes
on recipes.category_id=categories.category_id
group by categories.category_name;


-- 15) Display the recipe name, description, cooking time, and their respective ingredients along with quantities.

select r.Recipe_name,r.Recipe_description,r.cooking_time,
i.ingredient_name,amount_quantity
from recipes r join recipes_and_ingredients ri
on r.recipe_id=ri.recipe_id join ingredients i
on i.ingredient_id=ri.ingredient_id
join amount a on a.amount_id=ri.amount_id;


-- 16) Display the amount and quantity used for each ingredient.

select i.ingredient_name,a.amount_quantity
from ingredients i join recipes_and_ingredients ri
on i.ingredient_id=ri.ingredient_id
join amount a on a.amount_id=ri.amount_id;


-- 17) Display all ingredients that require exactly '1 tsp' in quantity.

select i.ingredient_name,a.amount_quantity
from ingredients i join recipes_and_ingredients ri
on i.ingredient_id=ri.ingredient_id
join amount a on a.amount_id=ri.amount_id where amount_quantity= "1 tsp";


-- 18) Count how many ingredients are associated with each quantity value.

select a.amount_quantity,count(i.ingredient_name) as Number_of_ingredients
from ingredients i join recipes_and_ingredients ri
on i.ingredient_id=ri.ingredient_id join amount a on a.amount_id=ri.amount_id group by a.amount_quantity;


-- 19) Display all quantity values that end with the word ‘cup’.

select amount_quantity from amount where amount_quantity like "%cup";


-- 20) Display all recipe names in alphabetical order.

select recipe_name from recipes order by recipe_name ;


-- 21) Recipes where cooking time is greater than average cooking time
SELECT Recipe_Name FROM Recipes WHERE Cooking_Time > (SELECT AVG(Cooking_Time) FROM Recipes );
