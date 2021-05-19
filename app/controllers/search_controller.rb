class SearchController < ApplicationController
    before_action :set_categories
    def create
        codigo = params[:keyword]

        @pedidos = Buy.where("code = ?", codigo)

        respond_to do |format|
            format.html{render :show}
        end
    end

    def index
        
    end

    def show
        @pedidos = Buy.where("code = ?", codigo)
    end

    def quotes
        @quote = Quote.new        
    end

    def set_categories
        @categories = Category.all
    end
    
    
    
    
    
    
end
