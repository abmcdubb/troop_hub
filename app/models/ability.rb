class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :to => :cru

      user ||= User.new # guest user (not logged in)

      if user.admin?
        can :cru, Troop
        can :cru, Event
        can :cru, User
        can :cru, TroopEvent
        can :cru, TroopBlog
        can :cru, Newsletter
      # elsif params[:troop_user] && user.troop_ids.include?(params[:troop_user])
      #   can :read, TroopUser
      end
    
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities
  end
end
