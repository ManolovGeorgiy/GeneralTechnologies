-- 1. Вывести сред/стоимость товаров из категорий 1, 2, 5, у которых название начинается с буквы t

SELECT
    AVG(Products.Price) AS average_price
FROM
    Products
WHERE
    Products.CategoryID IN (1, 2, 5)
    AND UPPER(SUBSTRING(Products.ProductName FROM 1 FOR 1)) = 't';


-- 2. Посчитать стоимость заказа 10248

SELECT
    OrderID,
    SUM(Quantity * Price) AS TotalOrderCost
FROM
    OrderDetails
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE
    OrderID = 10248
GROUP BY
    OrderID;


-- 3. Вывести ко-во товаров с ценой от 10 до 250 EUR

SELECT
    COUNT(*) AS product_count
FROM
    Products
WHERE
    Price >= 10
    AND Price <= 250


-- 4. Вывести сумму, на которую было отправлено товаров клиентам в Germany

SELECT
    SUM(OrderDetails.Quantity * Products.Price) AS total_amount_sent
FROM
    Orders
JOIN
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products  ON OrderDetails.ProductID = Products.productID
JOIN
    Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
    Customers.Country = 'Germany';


-- 5. С помощью инструмента онлайн-проектирования опишите схему БД "онлайн-шахматы" (базовые сущности и характеристики)

 link - 'https://dbdiagram.io/d/65a6a110ac844320ae0a98de'


table online_game{
  chess int
}


table player {
  id int
  first_name varchar
  last_name varchar
  login varchar
  password varchar
  rating int
}

table game {
  id int
  white_player_id int
  black_player_id int
  start_time timestamp
  end_time timestamp
  result varchar
}

table move {
  id int
  game_id int
  move_num int
  white_move int
  black_move int
}

table chatMessage {
  id int
  game_id int
  player_id int
  text varchar
}

Ref: "game"."white_player_id" < "player"."id"

Ref: "game"."black_player_id" < "player"."id"

Ref: "move"."game_id" < "game"."id"

Ref: "chatMessage"."game_id" < "move"."game_id"

Ref: "chatMessage"."player_id" < "player"."id"