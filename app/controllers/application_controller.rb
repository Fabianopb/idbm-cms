class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_page_title
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:warning] = exception.message
    redirect_to root_path
  end

  def show_flash_error(object)
    flash.now[:danger] = object.errors.full_messages
  end
  
  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
    
    helper_method :current_user_session, :current_user

    def confirm_logged_in
      unless current_user
        redirect_to sign_in_path
      end
    end
    
    def find_refund_claim
      if params[:refund_claim_id]
        @refund_claim = RefundClaim.find(params[:refund_claim_id])
      end
    end

    def validate_refund_claim_status
      if @refund_claim.status == 'sent for approval' || @refund_claim.status == 'approved'
        flash[:warning] =  "You are not authorized to access this page."
        redirect_to :controller => 'refund_claims', :action => 'index'
      end
    end

    def account_missing?
      if current_user.account.nil? && current_user.student? && (can? :create, Account)
        flash.now[:warning] =  "Payment information missing!"
      end
    end
  
end
