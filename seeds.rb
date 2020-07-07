User.destroy_all
Song.destroy_all
UserSong.destroy_all

u1 = User.create(name: "u1")
u2 = User.create(name: "u2")
u3 = User.create(name: "u3")

s1 = Song.create(name: "s1")
s2 = Song.create(name: "s2")
s3 = Song.create(name: "s3")

us1_1 = UserSong.create(user: u1, song: s1)
us2_2 = UserSong.create(user: u2, song: s2)
us3_3 = UserSong.create(user: u3, song: s3)
us1_2 = UserSong.create(user: u1, song: s2)
us3_2 = UserSong.create(user: u3, song: s2)