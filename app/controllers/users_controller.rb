class UsersController < ApplicationController
  
  # before action verify user permissions through role to not allow students creating users
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  before_action :confirm_logged_in
  
  load_and_authorize_resource

  def index
    @users = User.all_except(current_user).sorted
  end

  def show
    @user = User.find(params[:id])
    @account = @user.account
    account_missing
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully created."
      redirect_to :action => 'show', :id => @user.id
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "User was successfully updated."
      # redirect_to @user ??
      redirect_to :action => 'show', :id => @user.id
    else
      # render :edit ??
      render 'edit'
    end
  end
  
  def delete
    @user = User.find(params[:id])
  end

  def destroy
    user = User.find(params[:id]).destroy
    flash[:notice] = "User '#{user.first_name} #{user.last_name}' was successfully destroyed."
    redirect_to :action => 'index' #, notice: 'User was successfully destroyed.'
  end

  private
    
    def user_params
      if current_user.role == "Admin"
        params.require(:user).permit(:first_name, :last_name, :username, :e_mail, :password, :password_confirmation, :birth_date, :role)
      else
        params.require(:user).permit(:first_name, :last_name, :username, :e_mail, :password, :password_confirmation, :birth_date)
      end
    end

    def account_missing
      if @account.nil? && !@user.admin? && (can? :create, Account)
        flash.now[:warning] =  "Payment information missing!"
      end
    end
    
end
