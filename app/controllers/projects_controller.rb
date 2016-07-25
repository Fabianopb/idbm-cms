class ProjectsController < ApplicationController

	before_action :confirm_logged_in
	before_action :set_project, only: [:edit, :update, :delete]

	# load_and_authorize_resource

	def index
		@projects = Project.sorted
	end

	def new
		@project = Project.new
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

	def update
		if @project.update_attributes(project_params)
      flash[:success] = "Project updated!"
      redirect_to :action => 'index'
    else
      render 'edit'
    end
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
			params.require(:project).permit(:project_name)
		end

end
