# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

bob = User.create!(
  email: 'bob@driller.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)

10.times do
  Item.create!(
    title: Faker::Commerce.product_name,
    category: "Home Equip",
    price: Faker::Number.within(range: 10.0..99.0),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    condition: ["almost new", "used", "bad condition"].sample,
    delivery: Faker::Boolean.boolean,
    long_rental: Faker::Boolean.boolean,
    availability: Faker::Boolean.boolean,
    user_id: bob.id
  )
end
