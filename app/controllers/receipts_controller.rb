class ReceiptsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :find_refund_claim
  before_action :set_receipt, only: [:edit, :update, :delete]
  
  load_and_authorize_resource
  
  def new
    @receipt = Receipt.new
  end
  
  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      render 'new'
    end
  end
  
  def update
    if @receipt.update_attributes(receipt_params)
      redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      render 'edit'
    end
  end

  def destroy
    Receipt.find(params[:id]).destroy
    redirect_to :controller => 'refund_claims', :action => 'show', :user_id => @user.id, :id => @refund_claim.id
  end
  
  private
  
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end
    
    def receipt_params
      params.require(:receipt).permit(:refund_claim_id, :expense_date, :description, :value, :currency, :user_id)
    end
  
end
