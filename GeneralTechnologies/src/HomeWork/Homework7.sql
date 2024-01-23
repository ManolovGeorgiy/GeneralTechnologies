-- 1. Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)

-- 2. Вывести страны, в которые было отправлено 3 и более заказов

SELECT DISTINCT Country
FROM Customers
JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
GROUP BY Country
HAVING COUNT(OrderID) >= 3;

-- 3. Вывести ТОП-10 самых продаваемых товаров (проекция: название_товара, ко_во_проданных_единиц)

SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS sold_units
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
GROUP BY Products.ProductID
ORDER BY sold_units DESC
LIMIT 10;

-- 4. Расчитать З/П менеджеров (ставка - 5% от суммы проданных заказов)

-- вариант 1.
SELECT
    Employees.EmployeeID,
    Employees.LastName,
    Employees.FirstName,
    SUM(Orders.EmployeeID * 0.05) AS wage
FROM
    Employees
JOIN
    Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY
    Employees.EmployeeID, Employees.LastName, Employees.FirstName;

-- вариант 2.

SELECT
    Employees.EmployeeID,
    SUM(Orders.EmployeeID * 0.05) AS wage
FROM
    Employees
JOIN
    Orders ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY
    Employees.EmployeeID;

