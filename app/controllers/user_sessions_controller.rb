class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
      flash[:success] = "Welcome #{current_user.name}!"
      redirect_to root_path
    else
      show_flash_error(@user_session)
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "See you!"
    redirect_to root_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:username, :password, :remember_me)
  end

  def set_page_title
    @page_title = "Session"
  end

end