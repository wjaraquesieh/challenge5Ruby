class Product < ApplicationRecord
  # foreign key for categories
  belongs_to :category

  # Validation of the required data for product
  validates :title, presence: true
  validates :price, presence: true
  validates :stock_quantity, presence: true
end
