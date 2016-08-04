class RefundClaimsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :set_refund_claim, only: [:show, :edit, :update, :delete]
  
  load_and_authorize_resource
  
  def index
    if current_user.admin?
      @refund_claims = RefundClaim.newest_first
    else
      @refund_claims = current_user.refund_claims.newest_first
      account_missing?
    end
  end
  
  def show
    @receipts = @refund_claim.receipts.newest_first
    @daily_allowances = @refund_claim.daily_allowances.sort_by_arrival
    @km_allowances = @refund_claim.km_allowances.sort_by_date
  end

  def new
    @refund_claim = RefundClaim.new
  end

  def create
    @refund_claim = RefundClaim.new(refund_claim_params)
    if @refund_claim.save
      flash[:success] = "Refund claim created!"
      redirect_to :action => 'index'
    else
      show_flash_error(@refund_claim)
      render 'new'
    end
  end
 
  def update
    if @refund_claim.update_attributes(refund_claim_params)
      flash[:success] = "Refund claim updated!"
      redirect_to :action => 'show', :id => @refund_claim.id
    else
      show_flash_error(@refund_claim)
      render 'edit'
    end
  end

  def destroy
    RefundClaim.find(params[:id]).destroy
    flash[:success] = "Refund claim destroyed!"
    redirect_to :action => 'index'
  end

  private
    def set_refund_claim
      @refund_claim = RefundClaim.find(params[:id])
    end
   
    def refund_claim_params
      params.require(:refund_claim).permit(:user_id, :description, :status, :departure, :return_date)
    end
end
