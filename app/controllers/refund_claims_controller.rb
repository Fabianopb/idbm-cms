class RefundClaimsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  before_action :set_refund_claim, only: [:show, :edit, :update, :delete]
  
  load_and_authorize_resource
  
  def index
    if current_user.admin?
      @refund_claims = RefundClaim.newest_first
    else
      @refund_claims = @user.refund_claims.newest_first
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
      redirect_to :action => 'index', :user_id => @user.id
    else
      render 'new'
    end
  end
 
  def update
    if @refund_claim.update_attributes(refund_claim_params)
      redirect_to :action => 'show', :user_id => @user.id, :id => @refund_claim.id
    else
      render 'edit'
    end
  end

  def destroy
    RefundClaim.find(params[:id]).destroy
    redirect_to :action => 'index', :user_id => @user.id
  end

  private
    def set_refund_claim
      @refund_claim = RefundClaim.find(params[:id])
    end
   
    def refund_claim_params
      params.require(:refund_claim).permit(:user_id, :description, :status, :departure, :return_date)
    end
end
