class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    
    if user.role == "Admin"
      
      can :show, Account
      
      can [:index, :show, :new, :create], User
      can [:edit, :update, :change_pass, :update_pass], User, :id => user.id
      can [:delete, :destroy], [User] { |user| !user.admin? }

      can [:index], [RefundClaim, TravelPlan]
      can [:show, :change_status, :update_status], [RefundClaim, TravelPlan] { |request| request.status != "not submitted" }
      
      can :manage, [Faq, Project]
    
    else
      
      can [:show, :edit, :update, :change_pass, :update_pass], User, :id => user.id

      can :manage, [Account, RefundClaim, Receipt, DailyAllowance, KmAllowance], :user_id => user.id
      can [:new, :create], DailyAllowance

      can [:index, :show, :edit, :update, :delete, :destroy], TravelPlan, :id => user.travel_plans.pluck(:id)
      can [:new, :create], TravelPlan
      
      can [:index, :show], Faq

    end
    
  end
end
