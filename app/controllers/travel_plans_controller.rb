class TravelPlansController < ApplicationController
  # before_action :set_travel_plan, only: [:show, :edit, :update, :destroy]
  
  before_action :confirm_logged_in
  before_action :find_user

  def index
    @travel_plans = @user.travel_plans.newest_first
  end

  def show
    @travel_plan = TravelPlan.find(params[:id])
  end

  def new
    @travel_plan = TravelPlan.new
  end

  def create
    @travel_plan = TravelPlan.new(travel_plan_params)
    if @travel_plan.save
      redirect_to :action => 'show', :user_id => @user.id
    else
      render 'new'
    end
  end
  
  def edit
    @travel_plan = TravelPlan.find(params[:id])
  end

  def update
    @travel_plan = TravelPlan.find(params[:id])
    if @travel_plan.update_attributes(travel_plan_params)
      redirect_to :action => 'show', :user_id => @user.id
    else
      render 'edit'
    end
  end
  
  def delete
    @travel_plan = TravelPlan.find(params[:id])
  end

  def destroy
    TravelPlan.find(params[:id]).destroy
    redirect_to :action => 'index', :user_id => @user.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end

    def travel_plan_params
      params.require(:travel_plan).permit!
    end
end
