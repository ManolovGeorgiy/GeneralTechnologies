
1. Вывести юзеров из France

    db.users.find({"country": "France"})


2. Добавить несколько треков (tracks)

    db.tracks.insertMany([
    { title: 'Track 1' },
    { title: 'Track 2' },
    { title: 'Track 3' }
    ])


3. Приведите десять типовых бизнес-процессов для интернет-магазина и их соответствие методам MongoDB

    a. Регистрация юзера    -   insertOne()
    b. Поиск товаров    -   find()
    c. Просмотр карточки товара     -   findOne()
    d. Добавить заказ   -   insertOne()
    e. Оплатить заказ   -   updateOne()     is_paid
    f. Заблокировать юзера  -   updateOne()
    g. Удалить старые записи тел/разг   -   deleteMany()
    h. Положить товар в корзину     -   insertOne()
    i. Авторизация юзера на сайте   -   findOne()
                                    -   countDocuments()
    j. Удаление юзера   -   deleteOne()



4. Коротко приведите явные ошибки, допущенные при проектировании, в этой схеме БД
https://dbdiagram.io/d/appwitherrors-65b740f2ac844320aee99837

Table users {
  id int
  username varchar
  created_at timestamp
  age int
  email varchar
  password varchar
  is_blocked bool
}

Table tracks {
  id int
  created_at timestamp
  title varchar
  duration_secs int
  author_id int
  reaction_id int
}

Table reactions {
  id int
  created_at timestamp
  value int
  author_id int
}



Ref: "reactions"."author_id" < "users"."id"

Ref: "users"."id" < "tracks"."id"


a. Хранение паролей: Хранение паролей в открытом виде в таблице users представляет собой риск безопасности. Рекомендуется использовать безопасный алгоритм хеширования (например, bcrypt) для хранения хешированных паролей

пример : 'password_hash varchar'

b.