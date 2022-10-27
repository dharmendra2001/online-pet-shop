class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  
  has_one :petshop, dependent: :destroy
  has_many :buys
  validates :name,presence: true

  def change_user_to_paid
    update(membership: 1)
  end
end
