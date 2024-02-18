1. Завершить с помощью инструмента онлайн-проектирования создание схемы БД "платежная система" (юзеры, счета, транзакции)

payment system

https://dbdiagram.io/d/65d200e6ac844320ae66c4dc

Table Users {
user_id int
username varchar
email varchar
password varchar
fullname varchar
lastname varchar
birthdate date
location varchar

}
Table Accounts {
account_id int
user_id int
account_number varchar
balance int
}

Table Transactions {
transaction_id int
sender_account_id int
receiver_account_id int
transaction timestamp
}

Table Locks {
lock_id int
user_id int
account_id int
lock timestamp
}

Ref: "Transactions"."transaction_id" < "Users"."user_id"

Ref: "Users"."user_id" < "Accounts"."account_id"

Ref: "Accounts"."account_id" < "Locks"."lock_id"

Ref: "Accounts"."account_id" < "Transactions"."transaction_id"


2. Используя метод aggregate(), в рамках БД music вывести названия трех самых продолжительных треков

db.tracks.aggregate([
    { $sort: { duration_secs: -1 } },
    { $limit: 3 }, //
    { $project: { _id: 0, title: 1, duration_secs: 1 } }
])

3. Используя метод aggregate(), в рамках БД music вывести имя одного случайного юзера не из USA

db.users.aggregate([
    { $match: { country: { $ne: "USA" } } },
    { $sample: { size: 1 } },
    { $project: { _id: 1, name: 1 } }
])

