# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

100.times do
  title = Faker::Movie.title
  rating = Faker::Movie.rand_in_range(1, 5)
  Topic::Movie.create!(title:, rating:)
end

100.times do
  title = Faker::Food.dish
  rating = Faker::Food.rand_in_range(1, 5)
  Topic::Food.create!(title:, rating:)
end

100.times do
  title = Faker::Book.title
  rating = Faker::Book.rand_in_range(1, 5)
  Topic::Book.create!(title:, rating:)
end
