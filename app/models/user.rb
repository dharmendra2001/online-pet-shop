class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable
  
  has_one :petshop

  ROLES = %w{admin owner client }

  ROLES.each do |i|
    define_method "#{i}?" do
      role == i
    end
  end

  def change_user_to_paid
    update(membership: 1)
  end
end
