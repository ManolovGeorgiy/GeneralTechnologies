table video_hosting{
Name  YouTube
}

Table users {
  user_id INT [pk, increment]
  username VARCHAR(50)
  email VARCHAR(100)

}

Table videos {
  video_id INT [pk, increment]
  user_id INT
  title VARCHAR(100)
  description TEXT
  upload_date DATETIME
  reaction_type ENUM('like','dislike')

}

Table reactions {
  user_id INT
  video_id INT
  reaction_id INT [pk, increment]
  reaction_type ENUM('like', 'dislike')
}

Table comments {
  comment_id INT [pk, increment]
  user_id INT
  video_id INT
  comment_text TEXT
  comment_date DATETIME

}

Table playlists {
  playlist_id INT [pk, increment]
  user_id INT
   video_id INT
  title VARCHAR(100)
  description TEXT

}



Ref: "comments"."video_id" < "videos"."video_id"

Ref: "videos"."user_id" < "users"."user_id"

Ref: "playlists"."description" < "videos"."description"

Ref: "reactions"."reaction_type" < "videos"."reaction_type"

Ref: "playlists"."user_id" < "users"."user_id"

Ref: "playlists"."video_id" < "videos"."video_id"