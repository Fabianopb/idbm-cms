class FaqsController < ApplicationController
  
  before_action :confirm_logged_in
  before_action :set_faq, only: [:edit, :update, :delete]
  
  load_and_authorize_resource
  
  def index
    @faqs = Faq.sorted
  end
  
  def new
    @faq = Faq.new
    @faq_count = Faq.count + 1
  end
  
  def create
    @faq = Faq.new(faq_params)
    if @faq.save
      flash[:success] = "Q&A item created!"
      redirect_to :action => 'index'
    else
      @faq_count = Faq.count + 1
      show_flash_error(@faq)
      render 'new'
    end
  end
  
  def edit
    @faq_count = Faq.count
  end
  
  def update
    if @faq.update_attributes(faq_params)
      flash[:success] = "Q&A item updated!"
      redirect_to :action => 'index'
    else
      @faq_count = Faq.count
      show_flash_error(@faq)
      render 'edit'
    end
  end

  def destroy
    Faq.find(params[:id]).destroy
    flash[:success] = "Q&A item destroyed!"
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
