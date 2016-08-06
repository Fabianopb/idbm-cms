class KmAllowancesController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_refund_claim
  before_action :set_km_allowance, only: [:edit, :update, :delete]
  
  load_and_authorize_resource
  
  def new
    @km_allowance = KmAllowance.new
  end
  
  def create
    @km_allowance = KmAllowance.new(km_allowance_params)
    if @km_allowance.save
      flash[:success] = "km allowance created!"
      redirect_to :controller => 'refund_claims', :action => 'show', :id => @km_allowance.refund_claim.id
    else
      show_flash_error(@km_allowance)
      render 'new'
    end
  end
  
  def update
    if @km_allowance.update_attributes(km_allowance_params)
      flash[:success] = "km allowance updated!"
      redirect_to :controller => 'refund_claims', :action => 'show', :id => @km_allowance.refund_claim.id
    else
      show_flash_error(@km_allowance)
      render 'edit'
    end
  end

  def destroy
    KmAllowance.find(params[:id]).destroy
    flash[:success] = "km allowance destroyed!"
    redirect_to :controller => 'refund_claims', :action => 'show', :id => @km_allowance.refund_claim.id
  end
  
  private
  
    def set_km_allowance
      @km_allowance = KmAllowance.find(params[:id])
    end
    
    def km_allowance_params
      params.require(:km_allowance).permit(:refund_claim_id, :date, :route, :kms, :description, :user_id)
    end
  
end