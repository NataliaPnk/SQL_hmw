-- TASK 1
-- В рамках БД "песочница: интернет-магазин":
-- Вывести товары, добавив поле цена со наценкой Price_up в случае, если:
-- цена от 200 EUR — наценка 0.5%
-- цена от 20 EUR — наценка 1.5%

SELECT *,
	CASE
    	WHEN Price >= 200 THEN Price * 1.005
      WHEN Price >= 20 THEN Price * 1.015
      ELSE Price
  END AS price_up
FROM Products

-- TASK 2
-- Дополнительно (повторение материала) напишите след/запросы 
-- при работе в MySQL Workbench:
-- Создать новую базу данных webstore
-- Создать таблицу products (поля - на ваше усмотрение)


create database if not exists webstore

-- ================================================

create table products (
	id int primary key auto_increment,
	created_at timestamp default current_timestamp,
	
	product_name varchar(128) not null,
	price float not null,
	product_id int not null
)

-- ================================================
INSERT INTO products (product_name, price, product_id)
VALUES
		('product 1', 21,35, 1),
    ('product 2', 30, 4),
    ('product 3', 28, 2),
    ('product 4', 88, 3),
    ('product 5', 44, 4)