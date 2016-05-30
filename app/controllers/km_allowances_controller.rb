class KmAllowancesController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :find_refund_claim
  before_action :set_km_allowance, only: [:edit, :update, :delete]
  
  load_and_authorize_resource
  
  def new
    @km_allowance = KmAllowance.new
  end
  
  def create
    @km_allowance = KmAllowance.new(km_allowance_params)
    if @km_allowance.save
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      render 'new'
    end
  end
  
  def update
    if @km_allowance.update_attributes(km_allowance_params)
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      render 'edit'
    end
  end

  def destroy
    KmAllowance.find(params[:id]).destroy
    redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
  end
  
  private
  
    def set_km_allowance
      @km_allowance = KmAllowance.find(params[:id])
    end
    
    def km_allowance_params
      params.require(:km_allowance).permit(:refund_claim_id, :date, :route, :kms, :description, :user_id)
    end
  
end