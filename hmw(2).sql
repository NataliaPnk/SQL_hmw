1. Вывести данные о товарах (проекция: название, ценасоскидкой0.5процента) по убыванию цены.

SELECT ProductName,
Price * .995 AS Price_down
FROM Products
ORDER BY Price DESC


2. Вывести товары в диапазоне цены от 50 до 200 EUR (проекция: название, ценаснаценкой30процентов) по возрастанию цены.

SELECT ProductName,
Price * 1.3 AS Price_up
FROM Products
ORDER BY Price ASC,
Price BETWEEN 50 AND 200

3. Вывести всех клиентов, кроме тех, что из USA и UK.

SELECT * 
FROM Customers
WHERE NOT Country IN ('USA', 'UK')

4. Вывести товары из категорий 2 и 5 (проекция: всеимеющиесяполя, ценавдолларах)

SELECT *,
Price * 1.08 AS Price_usd
FROM Categories
WHERE CategoryID = 2 OR CategoryID = 5