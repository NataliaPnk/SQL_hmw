1. Вывести общее ко-во поставщиков не из UK и не из China

SELECT 
COUNT(*) AS amount_of_suppliers
FROM Suppliers
WHERE Country NOT IN ('UK', 'China')


2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT 
AVG(Price) AS avg_price,
MAX(Price) AS max_price,
MIN(Price) AS min_price,
COUNT(*) AS amount_of_products
FROM Products
WHERE CategoryID IN (3, 5)


3. Вывести общую сумму проданных товаров

SELECT 
SUM(OrderID) AS total_amount
FROM OrderDetails


4. Вывести данные о заказах (номер заказа, имя клиента, страна клиента, фамилия менеджера, название компании перевозчика)

SELECT 
Orders.OrderID,
Orders.CustomerID,
Customers.Country,
Employees.LastName,
Shippers.ShipperName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID


5. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT 
SUM(Price) AS total_sum_spent_from_germany
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany'

