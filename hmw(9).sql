-- В рамках БД "интернет-магазин (песочница)" напишите след/запросы:

-- 1. Вывести страны, в которых ко-во клиентов от 10 до 20 (вкл.)
SELECT Customers.Country, COUNT(Customers.CustomerID) AS amountOfCustomers
FROM Customers
GROUP BY
    Customers.Country
HAVING
    amountOfCustomers BETWEEN 10 AND 20



-- 2. Вывести ТОП-3 стран по ко-ву клиентов
SELECT Customers.Country, COUNT(Customers.CustomerID) AS topThreeCustomers
FROM Cusomers
GROUP BY
    Customers.Country
ORDER BY topThreeCustomers DESC
LIMIT 3




-- 3. Вывести имена клиентов, у которых два и более заказов
SELECT Customers.CustomerName, COUNT(Orders.OrderID) AS customers_with_two_orders

FROM Customers
    JOIN Orders ON Customers.CustomerID = Orders.CustomerID

GROUP BY Customers.CustomerName HAVING customers_with_two_orders > 2