require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do
  User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '1q2w3e',
      password_confirmation: '1q2w3e'
    )  
end

2.times do
  Admin.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '1q2w3e',
      password_confirmation: '1q2w3e'
    )  
end

20.times do
  Task.create!(
      subject: Faker::Lorem.word.capitalize,
      description: Faker::Lorem.paragraph,
      type: Task.types.sample,
      status: Task.statuses.values.sample,
      assignee: User.ids.sample,
      created_by: Admin.ids.sample
    )  
end