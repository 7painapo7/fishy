# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'fc@armageddon', password: '123456')

User.create!(
  [
    {
    name: 'test1',
   	email: '1@test',
   	password: '111111',
   	},
    {
    name: 'test2',
   	email: '2@test',
   	password: '222222',
   	},
    {
    name: 'test3',
    email: '3@test',
    password: '333333',
   	}
  ]
)