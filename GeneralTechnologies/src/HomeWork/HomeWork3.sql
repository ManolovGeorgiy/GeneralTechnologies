
-- 1. Вывести данные о товарах (название товара, ценасоскидкой_0.5%)

SELECT
    productName,
    Price * 0.995 AS discounted_price
FROM
    Products;

-- 2. Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)

SELECT
    Orders.OrderID,
    Customers.CustomerName,
    Country
FROM
Orders
JOIN Customers
WHERE
Country <> 'France'

-- 3. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT
    ProductName,
    Price AS Price_usd
FROM
Products
ORDER BY Price DESC
LIMIT 1;

-- 4. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT
    Suppliers.Country
FROM
    Suppliers
JOIN
    Products  ON Suppliers.SupplierID = Products.SupplierID
WHERE
    Products.CategoryID = 1;

-- 5. Вывести два самых дорогих товара из категории Beverages из USA

SELECT
    ProductName,
    Price
FROM
Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE
Categories.CategoryName = 'Beverages' AND Suppliers.Country = 'USA'
ORDER BY Price DESC
LIMIT 2;
