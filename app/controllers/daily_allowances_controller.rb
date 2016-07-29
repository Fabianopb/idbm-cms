class DailyAllowancesController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :find_refund_claim
  before_action :set_daily_allowance, only: [:edit, :update, :delete]
  
  load_and_authorize_resource
  
  def new
    @daily_allowance = DailyAllowance.new
  end
  
  def create
    @daily_allowance = DailyAllowance.new(daily_allowance_params)
    if @daily_allowance.save
      flash[:success] = "Trip destination created!"
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      show_flash_error(@daily_allowance)
      render 'new'
    end
  end
  
  def update
    if @daily_allowance.update_attributes(daily_allowance_params)
      flash[:success] = "Trip destination updated!"
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      show_flash_error(@daily_allowance)
      render 'edit'
    end
  end

  def destroy
    DailyAllowance.find(params[:id]).destroy
    flash[:success] = "Trip destination destroyed!"
    redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
  end
  
  private
  
    def set_daily_allowance
      @daily_allowance = DailyAllowance.find(params[:id])
    end
    
    def daily_allowance_params
      params.require(:daily_allowance).permit(:refund_claim_id, :arrival, :destination, :user_id)
    end
  
end