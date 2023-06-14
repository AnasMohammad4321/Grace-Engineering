class ProductionsController < ApplicationController
    def index
        @productions = Production.all
    end

    def new 
        @production = Production.new
    end

    def create
        @production = Production.new(production_params)
        byebug
        # Find the corresponding inventory
        @inventory = Inventory.find(params[:inventory_id])
        
        # Subtract the quantity used from the inventory quantity
        @inventory.quantity -= @production.quantity_used
        
        if @production.save && @inventory.save
          redirect_to @production, notice: 'Production was successfully created.'
        else
          render :new
        end
      end
      
end
