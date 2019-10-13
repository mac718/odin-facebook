User.create!([
  {email: "stan@bar.com", encrypted_password: "$2a$11$VO1GiOFSvGPfHkfAwJXQB.1SNx15Dmg8ClhAvA8ELwTHUggkzM3UC", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-06-07 01:41:03", last_sign_in_at: "2018-06-07 01:41:03", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "token@bar.com", encrypted_password: "$2a$11$rgcaMjvjPdEiNGoDqeBXmOgB0d3Wb148XP7.Cvz9v/gt1FLuM7i8y", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-06-07 02:05:01", last_sign_in_at: "2018-06-07 02:05:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "kyle@bar.com", encrypted_password: "$2a$11$p.d2ci7/jMsOTxWd9uYXlOClopGZmCMkrOAjp4BMlNmx.4mcLpMK.", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-06-07 02:08:18", last_sign_in_at: "2018-06-07 02:08:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "mike@bar.com", encrypted_password: "$2a$11$rqUL/xUdtm20TlJuCA6Y1eN5pcco6GcfJdApEW1upiWwwlmudTh4O", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 11, current_sign_in_at: "2018-08-19 22:09:38", last_sign_in_at: "2018-06-28 01:50:29", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "cartman@bar.com", encrypted_password: "$2a$11$WDQ5IZDCzm43BSOiXHl48OtlfQnbfsH/czURRWz68qFFOpQ7Y8ypK", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 5, current_sign_in_at: "2019-08-25 22:38:22", last_sign_in_at: "2018-06-07 01:36:30", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "mac@bar.com", encrypted_password: "$2a$11$roieXe7XJ8GFbCwXWRU3zO3vY0Pb4bS7IF/xVhxPX/4aDDmvRlLxa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2019-09-18 02:03:58", last_sign_in_at: "2019-09-18 02:03:58", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil},
  {email: "guilds300a@aol.com", encrypted_password: "$2a$11$gkq7Rm1vjG6m.eBC6IUdH.y2KcLaLzZcRT7Qihu3hDF5juZ6y/p4y", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2019-09-30 05:16:38", last_sign_in_at: "2019-09-30 05:11:18", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", provider: "facebook", uid: "10216455327914465", oauth_token: nil, oauth_expires_at: nil, first_name: nil, last_name: nil, avatar: nil}
])
Comment.create!([
  {user_id: 1, content: "sup", commentable_id: 2, commentable_type: "Post"},
  {user_id: 2, content: "sup!", commentable_id: 3, commentable_type: "Post"}
])
Friendship.create!([
  {user_id: 1, friend_id: 2},
  {user_id: 4, friend_id: 1},
  {user_id: 6, friend_id: 1},
  {user_id: 5, friend_id: 1}
])
Like.create!([
  {liker_id: 1, likeable_id: 2, likeable_type: "Post"},
  {liker_id: 2, likeable_id: 1, likeable_type: "Comment"},
  {liker_id: 1, likeable_id: 9, likeable_type: "Photo"},
  {liker_id: 1, likeable_id: 10, likeable_type: "Photo"},
  {liker_id: 1, likeable_id: 1, likeable_type: "Comment"},
  {liker_id: 2, likeable_id: 3, likeable_type: "Post"}
])
Photo.create!([
  {user_id: 1, image: "profile_pic.jpg"},
  {user_id: 1, image: "Maui.jpg"},
  {user_id: 1, image: "Maui.jpg"},
  {user_id: nil, image: "photo.jpg"},
  {user_id: 1, image: "photo.jpg"},
  {user_id: nil, image: "Maui.jpg"},
  {user_id: nil, image: "photo.jpg"},
  {user_id: nil, image: "Maui.jpg"},
  {user_id: 1, image: "Maui.jpg"},
  {user_id: nil, image: "photo.jpg"},
  {user_id: 1, image: "Maui.jpg"}
])
Post.create!([
  {user_id: 3, content: "Yo"},
  {user_id: 1, content: "yo"},
  {user_id: 1, content: "hey"}
])
Profile.create!([
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: nil, cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: nil, cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "http://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: nil},
  {user_id: 2, first_name: "Eric", last_name: "Cartman", birthday: "1988-10-10", gender: "male", occupation: nil, bio: nil, avatar: "beefcake.jpg", pic: nil, cover_photo: "Mike_s_Natural_Soaps_Revise.jpg"},
  {user_id: 4, first_name: "Stan", last_name: "Marsh", birthday: "1988-10-10", gender: "male", occupation: nil, bio: nil, avatar: "Mike_s_Natural_Soaps_Revise.jpg", pic: nil, cover_photo: nil},
  {user_id: 6, first_name: "Token", last_name: "Black", birthday: "1988-10-10", gender: "male", occupation: nil, bio: nil, avatar: "Mike_s_Natural_Soaps_Revise.jpg", pic: nil, cover_photo: nil},
  {user_id: 5, first_name: "Kyle", last_name: "Broflofsky", birthday: "1988-10-01", gender: "male", occupation: nil, bio: nil, avatar: "Mike_s_Natural_Soaps_Revise__1_.jpg", pic: nil, cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "http://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: "Maui.jpg"},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "http://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "http://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: "Mike_s_Natural_Soaps_Revise__1_.jpg"},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "https://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: "Mike_s_Natural_Soaps_Revise__1_.jpg"},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: "https://graph.facebook.com/v2.10/10216455327914465/picture", cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: nil, cover_photo: nil},
  {user_id: nil, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: nil, pic: nil, cover_photo: nil},
  {user_id: 3, first_name: "Michael", last_name: "Coon", birthday: nil, gender: nil, occupation: nil, bio: nil, avatar: "profilepic.jpeg", pic: nil, cover_photo: "Mike_s_Natural_Soaps_Revise__1_.jpg"},
  {user_id: 1, first_name: "Mike", last_name: "Coon", birthday: "1980-10-21", gender: "male", occupation: nil, bio: nil, avatar: "Maui.jpg", pic: nil, cover_photo: "photo.jpg"},
  {user_id: 7, first_name: "Mac", last_name: "Daddy", birthday: "1980-10-21", gender: "male", occupation: nil, bio: nil, avatar: "photo.jpg", pic: nil, cover_photo: nil}
])
