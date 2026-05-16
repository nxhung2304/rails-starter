class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, :dashboard
    end
  end
end
