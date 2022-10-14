class Pet < ApplicationRecord
  belongs_to :petshop 
  has_one_attached :image 
  has_one_attached :medical
  has_many :buys
  validates :petname, :food, :pet_type, :weight, :height, :description, :precaution, :image, :medical, :price, presence: true 
end
