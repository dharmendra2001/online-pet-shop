class Petshop < ApplicationRecord
  belongs_to :user
  has_many :pets, dependent: :destroy
  validates :shopname, presence: true
end