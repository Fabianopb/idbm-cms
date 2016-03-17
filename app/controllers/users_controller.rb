class UsersController < ApplicationController
  
  # before action verify user permissions through role
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.sorted
  end

  def show
    @user = User.find(params[:id])
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
      params.require(:user).permit(:first_name, :last_name, :username, :e_mail, :password_digest, :role)
    end
    
    def find_travel_plans
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end
end
