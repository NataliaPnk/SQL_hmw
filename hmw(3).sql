(1) Вывести данные о товарах 
(проекция: названиетовара, цена, названиекатегории, 
названиекомпаниипоставщика)

SELECT Products.ProductName,
Products.Price,
Suppliers.SupplierName,
Categories.CategoryName
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID


(2) Вывести список стран, которые поставляют морепродукты

SELECT 
Suppliers.Country
FROM Categories
JOIN Products ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Categories.CategoryName = 'Seafood'


(3) Вывести два самых дорогих товара 
из категории Beverages из USA

SELECT
Categories.CategoryName,
Products.Price,
Suppliers.Country
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE Country = 'USA'
ORDER BY Price DESC 
LIMIT 2


(4) Вывести название и стоимость в USD 
одного самого дорогого проданного товара


SELECT 
ProductName,
Price * 1.08 AS Price_usd
FROM Orders
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
ORDER BY Price DESC 
LIMIT 1
