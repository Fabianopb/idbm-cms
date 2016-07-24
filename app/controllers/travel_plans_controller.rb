class TravelPlansController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :set_travel_plan, only: [:show, :edit, :update, :delete]
  
  load_and_authorize_resource

  def index
    if current_user.admin?
      @travel_plans = TravelPlan.newest_first
    else
      @travel_plans = @user.travel_plans.newest_first
      account_missing?
    end
  end

  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = TravelPlan.new(travel_plan_params)
    if @travel_plan.save
      redirect_to :action => 'index', :user_id => @user.id
    else
      render 'new'
    end
  end
 
  def update
    if @travel_plan.update_attributes(travel_plan_params)
      redirect_to :action => 'show', :user_id => @user.id, :id => @travel_plan.id
    else
      render 'edit'
    end
  end
 
  def destroy
    TravelPlan.find(params[:id]).destroy
    redirect_to :action => 'index', :user_id => @user.id
  end

  private
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end
   
    def travel_plan_params
      params.require(:travel_plan).permit(:destination, :departure_date, :return_date, :trip_description, :tickets_description, :tickets_cost, :paid_days, :daily_allowance, :accommodation_costs, :accommodation_aalto_paid, :events_costs, :events_aalto_paid, :other_description, :other_costs, :status, :transport_ids => [], :user_ids => [])
    end
end
