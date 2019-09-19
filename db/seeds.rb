# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 以下追記
AdminUser.create!(
  [
    {
      email: 'yuuki0421ktu@gmail.com',
      password: 'kattakatao',
    },
    {
      email: 'xxx@xxx',
      password: 'xxxxxx',
    },
        {
      email: 'yyy@yyy',
      password: 'yyyyyy',
    },
    {
      email: 'zzz@zzz',
      password: 'zzzzzz',
    }
  ]
)



# AdminUser.create(email: "yuuki0421ktu@gmail.com",password:"kattakatao")
# AdminUser.create(email: "xxx@xxx",password:"xxxxxx")
# AdminUser.create(email: "yyy@yyy",password:"yyyyyy")
# AdminUser.create(email: "zzz@zzz",password:"zzzzzz")