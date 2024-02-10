// 1. Вывести незаблокированных юзеров из Germany и USA

db.getCollection("users").find({country: 'Germany' },
{ country: 'USA' },
    { is_blocked: { $ne: true }})


// 2. Вывести названия треков продолжительностью от 5 до 15 мин

db.tracks.find(
    {},
    { title: 1,duration_secs: 1, _id: 0 },
    {duration_secs: { $gte: 5 * 60, $lte: 15 * 60 } }
)

// 3. Разблокировать юзеров не из Germany

db.users.updateMany(
    { country: 'Germany' },
    {
        $set: {
            is_blocked: {$ne: true}
        }
    }
)

// 4. Увеличить баланс назаблокированных юзеров не из Germany на 150 EUR

db.users.updateMany(
    { country:  { $ne: 'Germany'} },
    {
        $inc: {
            balance: 150
        }
    }
)

// 5. Опишите схему БД "соц/сеть" (юзеры, публикации, друзья, чаты)

Table "users":
user_id (User identifier, primary key)
username (Username)
email (Email)
password (Password hash)
full_name (Full name)
birthdate (Date of birth)
Other necessary fields for user profiles

Table "posts":
post_id (Post identifier, primary key)
user_id (User identifier, foreign key referencing users.user_id)
content (Post content)
created_at (Date and time of post creation)
Other necessary fields for post content

Table "friends":
friendship_id (Friendship identifier, primary key)
user_id (User identifier, foreign key referencing users.user_id)
friend_id (Identifier of the other user, foreign key referencing users.user_id)
status (Friendship status, e.g., "confirmed" or "pending")

Table "chats":
chat_id (Chat identifier, primary key)
chat_name (Chat name, optional)
Other necessary fields for describing the chat

Table "messages":
message_id (Message identifier, primary key)
chat_id (Chat identifier, foreign key referencing chats.chat_id)
user_id (User identifier, foreign key referencing users.user_id)
content (Message content)
created_at (Date and time of message creation)