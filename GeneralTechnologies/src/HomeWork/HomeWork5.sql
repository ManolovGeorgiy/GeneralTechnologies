-- Видео-хостинг

-- Базовые сущности

  -- `юзеры`
  -- `видео-ролики`
  -- `реакции (на видео)`
  -- `комментарии (к видео)`
  -- `плейлисты`


Table users {
  id int
  username varchar
  created_at timestamp
  email varchar
  password varchar
}

Table videos {
  id int
  created_at timestamp
  title varchar
  duration_secs int
  author_id int
}

Table video_reactions {
  id int
  created_at timestamp
  video_id int
  value int
  author_id int
}

Table video_comments {
  id int
  created_at timestamp
  video_id int
  content varchar
  author_id int
}


Table playlists {
  id int
  created_at timestamp
  author_id int
  title varchar
}

Table playlist_videos {
  id int
  created_at timestamp
  video_id int
  playlist_id int
}

Ref: "users"."id" < "video_comments"."author_id"

Ref: "users"."id" < "playlists"."author_id"

Ref: "users"."id" < "videos"."author_id"

Ref: "users"."id" < "video_reactions"."author_id"

Ref: "videos"."id" < "video_comments"."video_id"

Ref: "videos"."id" < "playlist_videos"."video_id"

Ref: "playlists"."id" < "playlist_videos"."playlist_id"

Ref: "videos"."id" < "video_reactions"."video_id"