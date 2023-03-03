puts "🌱 Seeding spices..."

# Seed your database here
50.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end

50.times do
  pets = Pet.create(
      name: Faker::Creature::Animal.name,
      description: Faker::Lorem.sentence,
      breeds: Faker::Creature::Animal.name,
      contact: ('+254 706 817 694'),
      photos: Faker::LoremFlickr.image,
      status: ["Adopted", "NotAdopted"].sample
  )
end

puts "✅ Done seeding!"