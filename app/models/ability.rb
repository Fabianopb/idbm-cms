class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    if user.role == "Admin"
      can :show, Account
      can :manage, User
      can [:read, :update], [RefundClaim, TravelPlan] {|demand| demand.status != "not submitted"}
      can :manage, Faq
      can :manage, Project
    else
      can :manage, [Account, RefundClaim, Receipt, DailyAllowance, KmAllowance], :user_id => user.id
      can :manage, [TravelPlan] {|travel_plan| travel_plan.users.pluck(:id).include?(user.id)}
      can :create, TravelPlan # create only for team members (creator is mandatory)
      can [:show, :update], User, :id => user.id
      can :read, Faq
    end
    
  end
end
