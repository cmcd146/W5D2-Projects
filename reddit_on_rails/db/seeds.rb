# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

steve = User.create(username: "Steve", password: "123456")

cat_sub = Sub.create(title: "Cats", description: "Lots of Cats", moderator_id: steve.id)

cat_post = Post.create(title: "Kittens", url: "", content: "", author_id: steve.id, sub_ids: [cat_sub.id])