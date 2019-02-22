# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
  require 'i18n'
  I18n.locale = :ja
  Faker::Config.locale = 'ja'
  puts Faker::Config.locale
50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  user = User.new(
            name: name,
            email: email,
            password: password,
            password_confirmation: password,
            )
  user.profile_image = open "#{Rails.root}/app/assets/images/404.png"
  user.save
end

#   User.create!(name: name,
#               email: email,
#               password: password,
#               password_confirmation: password,
#               profile_image: open "#{Rails.root}/app/assets/images/404.png",
#               )
