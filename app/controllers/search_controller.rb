class SearchController < ApplicationController

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
    
    
    
    
end
