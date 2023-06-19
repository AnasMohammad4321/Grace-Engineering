class ProductionsController < ApplicationController
  http_basic_authenticate_with name: "Anas", password: "1234", except: [:index, :show]
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

    def download_csv
        productions = Production.all
        csv_data = CSV.generate do |csv|
          csv << ["ID", "Inventory ID", "Quantity Used", "Production Date", "Production Notes", "Created At", "Updated At"]
          productions.each do |production|
            csv << [production.id, production.inventory_id, production.quantity_used, production.production_date, production.production_notes, production.created_at, production.updated_at]
          end
        end
        
        send_data csv_data, filename: "production_data.csv"
    end

  private

    def production_params
      params.require(:production).permit(:inventory_id, :quantity_used, :production_date, :production_notes)
    end
      
end
