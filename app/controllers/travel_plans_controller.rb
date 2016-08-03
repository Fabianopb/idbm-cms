class TravelPlansController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :set_travel_plan, only: [:show, :edit, :update, :delete]
  
  load_and_authorize_resource

  def index
    if current_user.admin?
      @travel_plans = TravelPlan.newest_first
    else
      @travel_plans = current_user.travel_plans.newest_first
      account_missing?
    end
  end

  def new
    @travel_plan = TravelPlan.new
    team_array
  end

  def create
    @travel_plan = TravelPlan.new(travel_plan_params)
    if @travel_plan.save
      flash[:success] = "Travel plan created!"
      redirect_to :action => 'index', :user_id => current_user.id
    else
      team_array
      show_flash_error(@travel_plan)
      render 'new'
    end
  end

  def edit
    team_array
  end
 
  def update
    if @travel_plan.update_attributes(travel_plan_params)
      flash[:success] = "Travel plan updated!"
      redirect_to :action => 'show', :user_id => current_user.id, :id => @travel_plan.id
    else
      team_array
      show_flash_error(@travel_plan)
      render 'edit'
    end
  end
 
  def destroy
    TravelPlan.find(params[:id]).destroy
    flash[:success] = "Travel plan destroyed!"
    redirect_to :action => 'index', :user_id => current_user.id
  end

  private
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end
   
    def travel_plan_params
      params.require(:travel_plan).permit(:destination, :departure_date, :return_date, :trip_description, :tickets_description, :tickets_cost, :paid_days, :daily_allowance, :accommodation_costs, :accommodation_aalto_paid, :events_costs, :events_aalto_paid, :other_description, :other_costs, :status, :transport_ids => [], :user_ids => [])
    end

    def team_array
      @team = [current_user]
      @disabled = []
      User.where("role = ?", "Student").each do |user|
        if user.project == current_user.project && current_user.id != user.id
          @team.push(user)
          @disabled.push(user.id) if user.account.nil?
        end
      end
    end
end
