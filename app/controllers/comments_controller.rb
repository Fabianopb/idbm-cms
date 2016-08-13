class CommentsController < ApplicationController
  
  before_action :confirm_logged_in
  
  def index
  end

  def edit
  end

  def delete
  end

  private

  def set_page_title
    @page_title = "Comments"
  end

end
