class ProductionsController < ApplicationController
    def index
        @productions = Production.all
    end

    def show
        @production = Production.find(params[:id])
    end


    def new 
        @production = Production.new
    end

    def create
        @production = Production.new(production_params)
        # extract inventory_id from @
        id = params[:production][:inventory_id]
        @inventory = Inventory.find(id)
        # @inventory = Inventory.find(params[:inventory_id])
        
        # Subtract the quantity used from the inventory quantity if we have enough
        if @inventory.quantity >= @production.quantity_used
          @inventory.quantity -= @production.quantity_used
        end
        if @production.save && @inventory.save
          # redirect_to view_productions_path, notice: 'Production was successfully created.'
          redirect_to productions_path, notice: 'Production was successfully created.'
        else
          render :new
        end
      end

    def delete
        @production = Production.find(params[:id])

        if @production.destroy  
            redirect_to productions_path, notice: 'Production was successfully deleted.'
        else  
            redirect_to productions_path, notice: 'Production was not deleted.'
        end
    end


  private

    def production_params
      params.require(:production).permit(:inventory_id, :quantity_used, :production_date, :production_notes)
    end
      
end
