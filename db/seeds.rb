puts "🌱 Seeding data..."

# Define how many instances of Movie, Critic, and Review to create
movie_amt = 5
critic_amt = 5
review_amt = 10

puts "🌱 Seeding movies..."
movie_amt.times do
  Movie.create(
    title: Faker::Movie.title
  )
end

puts "🌱 Seeding critics..."
critic_amt.times do
  Critic.create(
    name: Faker::Name.first_name
  )
end

puts "🌱 Seeding reviews..."
review_amt.times do
  Review.create(
    rating: rand(1..10),
    movie_id: rand(1..movie_amt),
    critic_id: rand(1..critic_amt)
  )
end

puts "✅ Done seeding!"