# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
#

require 'faker'

# Créer 10 villes
10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# Créer 10 utilisateurs
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(18..60),
  )
end

# Créer 20 gossips
20.times do
  Gossip.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 5),
    user: User.all.sample
  )
end

# Créer 10 tags
10.times do
  Tag.create(
    title: "##{Faker::Lorem.word}"
  )
end

# Associer des tags à des gossips
Gossip.all.each do |gossip|
  gossip.tags << Tag.all.sample(rand(1..3))
end
