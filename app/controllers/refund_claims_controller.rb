class RefundClaimsController < ApplicationController
  before_action :set_refund_claim, only: [:show, :edit, :update, :destroy]
  
  before_action :confirm_logged_in

  # GET /refund_claims
  def index
    @refund_claims = RefundClaim.all
  end

  # GET /refund_claims/1
  def show
  end

  # GET /refund_claims/new
  def new
    @refund_claim = RefundClaim.new
  end

  # GET /refund_claims/1/edit
  def edit
  end

  # POST /refund_claims
  def create
    @refund_claim = RefundClaim.new(refund_claim_params)

    if @refund_claim.save
      redirect_to @refund_claim, notice: 'Refund claim was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /refund_claims/1
  def update
    if @refund_claim.update(refund_claim_params)
      redirect_to @refund_claim, notice: 'Refund claim was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /refund_claims/1
  def destroy
    @refund_claim.destroy
    redirect_to refund_claims_url, notice: 'Refund claim was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refund_claim
      @refund_claim = RefundClaim.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def refund_claim_params
      params[:refund_claim]
    end
end
