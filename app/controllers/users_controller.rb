class UsersController < ApplicationController
  
  # before action verify user permissions through role to not allow students creating users
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  before_action :confirm_logged_in
  
  load_and_authorize_resource

  def index
    # @users = User.all_except(current_user).sorted
    @users = User.sorted
  end

  def show
    @user = User.find(params[:id])
    @account = @user.account
    account_missing?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      ApplicationMailer.welcome_email(@user).deliver_now
      flash[:success] = "User created!"
      redirect_to :action => 'index'
    else
      show_flash_error(@user)
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User updated!"
      redirect_to :action => 'show', :id => @user.id
    else
      show_flash_error(@user)
      render 'edit'
    end
  end

  def change_pass
    @user = User.find(params[:id])
  end

  def update_pass
    @user = User.find(params[:id])
    if @user.valid_password?(params[:current_password])
      @user.enable_strict_validation = true
      if @user.update_attributes(user_params)
        flash[:success] = "Password updated!"
        redirect_to :action => 'show', :id => @user.id
      else
        show_flash_error(@user)
        render 'change_pass'
      end
    else
      @user.errors.add(:current_password, "is not valid!")
      show_flash_error(@user)
      render 'change_pass'
    end
  end
  
  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed!"
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
    
end
