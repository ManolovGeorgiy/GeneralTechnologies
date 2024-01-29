-- 1. Вывести заказы со стоимостью от 5000 EUR (проекция: номер_заказа, стоимость_заказа)

SELECT
    OrderDetails.OrderID,
    SUM(Price * Quantity) AS Order_Price
FROM OrderDetails

JOIN Products ON OrderDetails.ProductID = Products.ProductID

GROUP BY OrderDetails.OrderID
HAVING Order_Price >= 5000

ORDER BY Order_Price ASC

-- 2. Вывести страны, в которые было отправлено 3 и более заказов

-- 1.решение
SELECT DISTINCT Country
FROM Customers
JOIN Orders  ON Customers.CustomerID = Orders.CustomerID
GROUP BY Country
HAVING COUNT(OrderID) >= 3;

-- 2. решение
SELECT
    Customers.Country,
    COUNT(*) AS Count_Of_Orders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Country
HAVING
    Count_Of_Orders >= 3
ORDER BY Count_Of_Orders DESC

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


-- 5. Дополните схему БД "онлайн-шахматы" функционалом групповых чатов

link: https://dbdiagram.io/d/65b26bd5ac844320aeb821b1


Table players {
  id int
  created_at timestamp
  email varchar
  password varchar
  is_blocked bool
  username varchar
}

Table game_sessions {
  id int
  created_at timestamp
  black_side_player_id int
  white_side_player_id int
  started_at timestamp
  finished_at timestamp
  winner_id int
}

Table moves {
  id int
  created_at timestamp
  player_id int
  game_session_id int
  figure_id int
  from_cell int
  to_cell int
}

Table chats {
  id int
  created_at timestamp
  game_session_id int
}

Table messages {
  id int
  created_at timestamp
  chat_id int
  content varchar
  author_id int
}

Table friendships {
  id int
  created_at timestamp
  player1_id int
  player2_id int
}

Table groups_chat {
  id int
  created_at timestamp
  game_session_id int
}

table members_chat{
member_id int
user_id int
group_id int

}

Table messages_chat {
message_id int
group_id int
user_id int
message_text timestamp
}



Ref: "players"."id" < "moves"."player_id"

Ref: "players"."id" < "messages"."author_id"

Ref: "players"."id" < "game_sessions"."black_side_player_id"

Ref: "players"."id" < "game_sessions"."white_side_player_id"

Ref: "players"."id" < "game_sessions"."winner_id"

Ref: "game_sessions"."id" - "chats"."game_session_id"

Ref: "chats"."id" < "messages"."chat_id"

Ref: "game_sessions"."id" < "moves"."game_session_id"

Ref: "players"."id" < "friendships"."player1_id"

Ref: "players"."id" < "friendships"."player2_id"

Ref: "groups_chat"."game_session_id" < "game_sessions"."id"

Ref: "players"."id" < "members_chat"."member_id"

Ref: "members_chat"."group_id" < "players"."id"

Ref: "messages_chat"."group_id" < "players"."id"