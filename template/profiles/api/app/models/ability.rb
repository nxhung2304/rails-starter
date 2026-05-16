class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here.
    # For an API, this often involves checking tokens or roles.
    return unless user

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, :all
    end
  end
end
