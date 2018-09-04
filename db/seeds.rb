# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Movie.create(title: "The Last Samurai", release_year: 2003)
Movie.create(title: "Mrs. Doubtfire", release_year: 1999)
Movie.create(title: "Blues Brothers", release_year: 1988)
Movie.create(title: "Jurassic Park", release_year: 1997)
Movie.create(title: "Star Wars", release_year: 1977)

User.create(name: "Cory", password: "password1", admin: true)
User.create(name: "Jerb Spikles", password: "password2")

Review.create(title: "The Last Samurai Sucks", content: "I really hated it", rating: 1, user_id: 1, movie_id: 1)
Review.create(title: "Mrs. Doubtfire is the best!", content: "I love it so much", rating: 5, user_id: 2, movie_id: 2)
Review.create(title: "The Last Samurai is ok", content: "I thought it was pretty good", rating: 3, user_id: 2, movie_id: 1)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?