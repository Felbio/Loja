class Produto < ApplicationRecord
  
  validates :price, :name, :quantity, presence: true
  validates :name, length: {minimum: 4}
  validates :quantity, numericality: { only_integer: true }
  validates :description, length:{in: 5..200}
end