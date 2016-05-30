class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    if user.role == "Admin"
      can :show, Account
      can :manage, User
      can [:read, :update], [RefundClaim, TravelPlan] {|demand| demand.status != "not submitted"}
      can :manage, Faq
    else
      can :manage, [Account, RefundClaim, Receipt, DailyAllowance, KmAllowance, TravelPlan], :user_id => user.id
      can [:show, :update], User, :id => user.id
      can :read, Faq
    end
    
  end
end
