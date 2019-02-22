# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def generate_random_strings
  return (0...8).map{ (65 + rand(26)).chr }.join  
end

gimei = Gimei.name

50.times do |n|
  name = gimei.kanji
  email = generate_random_strings + "@" + generate_random_strings + ".com" 
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
