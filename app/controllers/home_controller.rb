class HomeController < ApplicationController
  before_action :authenticate_user!, only:[:index]
  before_action :set_category, only:[:unregistered]

  def index
    @profile = current_user.profile
    @orders = current_user.orders
    @guides = current_user.guides
    @buys = current_user.buys
  end
  
  def unregistered
    @quote = Quote.new
  end

  def search
    @palabra = params[:keyword]
    raise @palabra.to_yaml
  end

  private
    def set_category
      @categories = Category.all.order(:name)
    end
    
      
    
end
