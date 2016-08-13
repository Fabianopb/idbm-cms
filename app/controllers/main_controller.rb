class MainController < ApplicationController
  
  layout 'application'
  before_action :confirm_logged_in
  
  def index
    
  end

  private

  def set_page_title
    @page_title = "Home"
  end
  
end
