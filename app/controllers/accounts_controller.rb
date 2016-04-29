class AccountsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :find_user
  
  def new
    @account = Account.new({:user_id => @user.id})
  end
  
  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:notice] = "Account successfuly created"
      redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      flash[:notice] = "Account was successfully updated"
      redirect_to :controller => 'users', :action => 'show', :id => @account.user_id
    else
      render 'edit'
    end
  end
  
  private
  
  def account_params
    params.require(:account).permit(:user_id, :social_security, :phone_number, :iban, :swift, :address, :postal_code, :city, :project)
  end
  
end
