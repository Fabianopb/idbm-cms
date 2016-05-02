class MainController < ApplicationController
  
  layout 'application'
  before_action :confirm_logged_in
  
  def index
    
  end
  
end
