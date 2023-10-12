# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "seeding admin user . . ."
user = User.new(
    kind: "admin",
    email: "admin@example.com",
    password: "admin",
    password_confirmation: "admin"
)
if user.save
    puts "admin user created"
    puts "email: admin@example.com"
    puts "password: admin"
else
    puts "failed to seed admin user"
    puts user.errors.to_hash
end
