class MainController < ApplicationController
  
  layout 'application'
  before_action :confirm_logged_in
  
  def index
    if current_user.student?
    	@user = current_user
    	@refund_claims = @user.refund_claims
    	@travel_plans = @user.travel_plans
    	@projects = @user.projects
    else
    	@user = User.all
    	@refund_claims = RefundClaim.all
    	@travel_plans = TravelPlan.all
    	@projects = Project.all
    end
  end

  private

  def set_page_title
    @page_title = "Home"
  end
  
end
