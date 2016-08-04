class AccountsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  
  load_and_authorize_resource
  
  def new
    @account = Account.new({:user_id => current_user.id})
  end
  
  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = "Payment information created!"
      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
    else
      show_flash_error(@account)
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      flash[:success] = "Payment information updated"
      redirect_to :controller => 'users', :action => 'show', :id => @account.user_id
    else
      show_flash_error(@account)
      current_user = @account.user
      render 'edit'
    end
  end
  
  private
  
  def account_params
    params.require(:account).permit(:user_id, :social_security, :phone_number, :iban, :swift, :address, :postal_code, :city, :project)
  end
  
end
