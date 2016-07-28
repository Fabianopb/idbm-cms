class ProjectsController < ApplicationController

	before_action :confirm_logged_in
	before_action :set_project, only: [:edit, :update, :delete]

	load_and_authorize_resource

	def index
		@projects = Project.sorted
		@unallocated_users = []
		User.where("role = ?", "Student").each do |user|
			@unallocated_users.push([user.first_name, user.last_name]) if user.project_ids.empty?
		end
	end

	def new
		@project = Project.new
		users_array
	end

	def create
		@project = Project.new(project_params)
		if @project.save
      flash[:success] = "Project created!"
      redirect_to :action => 'index'
    else
      render 'new'
    end
	end

	def edit
		users_array
	end

	def update
		if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to :action => 'index'
	    else
	      render 'edit'
	    end
	end

	def delete
	end

	def destroy
		Project.find(params[:id]).destroy
    flash[:success] = "Project destroyed!"
    redirect_to :action => 'index'
	end

	private

		def set_project
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(:project_name, :user_ids => [])
		end

		def users_array
			@users = []
			User.where("role = ?", "Student").each do |user|
				@users.push(user) if (user.project_ids.include?(@project.id) || user.project_ids.empty?)
			end
		end

end
