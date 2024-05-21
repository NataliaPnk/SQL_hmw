В рамках БД "песочница" напишите след/запросы:


1. Вывести заказы со стоимостью от 5000 и более EUR (проекция: номер_заказа, стоимость_заказа)

SELECT 
OrderDetails.OrderID,
SUM(Products.Price * OrderDetails.Quantity) AS sum_of_orders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY OrderDetails.OrderID
HAVING sum_of_orders >= 500


2. Вывести страны, в которые было отправлено 3 и более заказов

SELECT 
Customers.Country,
COUNT(Orders.OrderID) AS countries_by_amount_of_orders
FROM Orders 
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.Country
HAVING countries_by_amount_of_orders >= 3


3. Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)

SELECT 
Products.ProductName,
SUM(OrderDetails.Quantity) AS top10_products_sold
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductID
ORDER BY top10_products_sold DESC
LIMIT 10


4. Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)

SELECT 
SUM(Products.Price * OrderDetails.Quantity) AS total_salaries
FROM Employees
JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Orders.OrderID
HAVING total_salaries * 0.05
