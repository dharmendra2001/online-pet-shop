# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)  
      if user.role.upcase == "ADMIN" || user.role.upcase == "OWNER"
        can :manage, :all
      else
        can :read, User, id: user.id
      end
     
  end
end
