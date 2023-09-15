class Produto < ApplicationRecord
  
  belongs_to :department, dependent: :destroy

  validates :price, :name, :quantity, :department, presence: true
  validates :name, length: {minimum: 4}
  validates :quantity, numericality: { only_integer: true }
  validates :description, length:{in: 5..200}
  
end
