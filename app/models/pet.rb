class Pet < ApplicationRecord
  belongs_to :petshop 
  has_one_attached :image 
  has_many :buys
end
