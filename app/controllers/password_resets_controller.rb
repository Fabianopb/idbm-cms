class PasswordResetsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:success] = "Instructions to reset your password have been emailed to you."
      redirect_to root_path
    else
      flash[:danger] = "No user was found with that email address"
      render :new
    end
  end

  def edit
    @user = User.find_by(perishable_token: params[:id])
  end

  def update
    @user = User.find_by(perishable_token: params[:id])
    if @user.update_attributes(password_reset_params)
      flash[:success] = "Password successfully reset!"
      redirect_to root_path
    else
      show_flash_error(@user)
      render :edit
    end
  end

  private

    def password_reset_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def set_page_title
      @page_title = "Reset password"
    end
    
end