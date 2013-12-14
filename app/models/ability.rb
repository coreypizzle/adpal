class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, Ad
    else
      can [:read, :create], Ad
      can [:update, :destroy], Ad, :user_id => user.id
  end
  end
end
