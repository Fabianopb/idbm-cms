class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  def confirm_logged_in
    unless session[:user_id]
      #flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
    else
      return true
    end
  end
  
  def find_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    end
  end
  
  def find_refund_claim
    if params[:refund_claim_id]
      @refund_claim = RefundClaim.find(params[:refund_claim_id])
    end
  end
  
end
