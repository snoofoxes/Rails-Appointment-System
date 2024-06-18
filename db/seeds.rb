# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Dentist.create!(
  firstname: "Feihl",
  middlename: "D",
  lastname: "Suazo",
  birthdate: Date.new(1999, 1, 1),
  phone_number: 1234567890,
  email: "feihl@gmail.com",
  username: "feihl",
  password: "password" # Note: This should be securely hashed in a real application
)
