# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 user = User.create(username:"admin123",email:"admin@gmail.com",password:"12345678",password_confirmation:"12345678",admin: true,confirmed_at: Time.now.utc)
 role1 = Role.create(name:"Admin")
Role.create(name:"User")
Role.create(name:"Creator")
user.user_roles.create(role: role1)