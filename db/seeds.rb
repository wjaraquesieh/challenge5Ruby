# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Clean all the data
Product.destroy_all
Category.destroy_all

# Going through the csv file
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

# Loop to get the information
products.each do |row|
  category = Category.find_or_create_by(name: row['category'])
  Product.create(
    title: row['title'],
    description: row['description'],
    price: row['price'],
    stock_quantity: row['stock_quantity'],
    category: category
  )
end


# 676.times do
#   Product.create(
#     title: Faker::Commerce.product_name,
#     price: Faker::Commerce.price,
#     stock_quantity: Faker::Number.between(from: 1, to: 100)
#   )
# end

