class FaQsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :set_faq, only: [:edit, :update, :delete]
  
  def index
    @faqs = Faq.sorted
  end
  
  def new
    @faq = Faq.new
  end
  
  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      redirect_to :action => 'index'
    else
      render 'new'
    end
  end
  
  def update
    if @faq.update_attributes(faq_params)
      redirect_to :action => 'index'
    else
      render 'edit'
    end
  end

  def destroy
    Faq.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
  
  private
  
    def set_faq
      @faq = Faq.find(params[:id])
    end
    
    def faq_params
      params.require(:faq).permit(:question, :answer, :position)
    end
    
end
