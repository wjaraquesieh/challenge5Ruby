class Category < ApplicationRecord
  # foreign key from products
  has_many :products

end
