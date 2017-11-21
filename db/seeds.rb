require 'faker'

10.times do
  User.create!(
    email:               Faker::Internet.email,
    password: 'fakepw12'
  )
end
users = User.all

35.times do
  Wiki.create!(
    title: Faker::Lorem.sentences,
    body:  Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
