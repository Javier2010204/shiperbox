# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :manage, Order, user_id: user.id
      if user.admin?
        can :manage, Order
        can :manage, Profile
      end
      
    end
  end
end
