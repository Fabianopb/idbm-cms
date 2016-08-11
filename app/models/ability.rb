class Ability
  include CanCan::Ability

  def initialize(user)
  
    user ||= User.new

    if user.role == "SUDO"

      can :manage, User
      cannot [:delete, :detroy], User, :id => user.id
      cannot [:edit, :update, :change_pass, :update_pass], [User] { |u| u.id != user.id }
      can :show, Account
    
    elsif user.role == "Admin"
      
      can :show, Account
      
      can [:index, :show, :new, :create], User
      can [:edit, :update, :change_pass, :update_pass], User, :id => user.id
      can [:delete, :destroy], [User] { |user| !user.admin? }

      can [:index, :show], [RefundClaim, TravelPlan]
      can [:approve], [RefundClaim, TravelPlan] { |request| request.status == 'sent for approval' }
      can [:require_revision, :edit, :update], [RefundClaim, TravelPlan] { |request| request.status == 'sent for approval' || request.status == 'approved' }
      
      can [:manage], [Faq, Project]
    
    elsif user.role == "Student"
      
      can [:show, :edit, :update, :change_pass, :update_pass], User, :id => user.id

      can [:manage], [Account, RefundClaim, Receipt, DailyAllowance, KmAllowance], :user_id => user.id
      cannot [:edit, :update, :delete, :destroy], [Receipt, DailyAllowance, KmAllowance] { |item| item.refund_claim.status == 'sent for approval' || item.refund_claim.status == 'approved' }
      cannot [:send_for_approval, :edit, :update], [RefundClaim] { |request| request.status == 'sent for approval' || request.status == 'approved' }
      cannot [:require_revision, :approve], RefundClaim

      can [:index, :show, :edit, :update, :delete, :destroy], TravelPlan, :id => user.travel_plans.pluck(:id)
      can [:new, :create], TravelPlan
      can [:send_for_approval], [TravelPlan] { |request| request.status == 'not submitted' || request.status == 'requires revision' }
      
      can [:index, :show], Faq

    end
    
  end
end
