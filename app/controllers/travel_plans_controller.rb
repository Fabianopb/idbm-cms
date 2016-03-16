class TravelPlansController < ApplicationController
  before_action :set_travel_plan, only: [:show, :edit, :update, :destroy]

  # GET /travel_plans
  def index
    @travel_plans = TravelPlan.all
  end

  # GET /travel_plans/1
  def show
  end

  # GET /travel_plans/new
  def new
    @travel_plan = TravelPlan.new
  end

  # GET /travel_plans/1/edit
  def edit
  end

  # POST /travel_plans
  def create
    @travel_plan = TravelPlan.new(travel_plan_params)

    if @travel_plan.save
      redirect_to @travel_plan, notice: 'Travel plan was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /travel_plans/1
  def update
    if @travel_plan.update(travel_plan_params)
      redirect_to @travel_plan, notice: 'Travel plan was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /travel_plans/1
  def destroy
    @travel_plan.destroy
    redirect_to travel_plans_url, notice: 'Travel plan was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def travel_plan_params
      params[:travel_plan]
    end
end
