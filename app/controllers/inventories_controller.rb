class InventoriesController < ApplicationController
    def index
      @inventories = Inventory.all
    end
  
    def new
      @inventory = Inventory.new
    end
  
    def create
      @inventory = Inventory.new(inventory_params)
      if @inventory.save
        redirect_to @inventory, notice: 'Inventory item was successfully created.'
      else
        render :new
      end
    end
  
    def show
      @inventory = Inventory.find(params[:id])
    end
  
    def edit
      @inventory = Inventory.find(params[:id])
    end
  
    def update
      @inventory = Inventory.find(params[:id])
      if @inventory.update(inventory_params)
        redirect_to @inventory, notice: 'Inventory item was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @inventory = Inventory.find(params[:id])
      @inventory.destroy
      redirect_to inventories_url, notice: 'Inventory item was successfully deleted.'
    end
  
    # def download_csv
    #   inventories = Inventory.all
    #   csv_data = CSV.generate do |csv|
    #     csv << ['ID', 'Name', 'Description', 'Quantity', 'Created At', 'Updated At']
    #     inventories.each do |inventory|
    #       csv << [inventory.id, inventory.name, inventory.description, inventory.quantity, inventory.created_at, inventory.updated_at]
    #     end
    #   end
    
    #   if params[:id] == 'download_csv'
    #     send_data csv_data, filename: 'inventory.csv', type: 'text/csv'
    #   else
    #     redirect_to inventories_path, notice: 'Invalid request'
    #   end
    # end
    
    # def existing
    #   @inventory = Inventory.new
    # end
  
    # def update_existing
    #   @inventory = Inventory.find(params[:inventory_id])
    #   quantity = params[:quantity].to_i
    #   @inventory.quantity += quantity
    #   if @inventory.save
    #     redirect_to inventories_path, notice: 'Inventory updated successfully.'
    #   else
    #     flash.now[:error] = 'Failed to update inventory.'
    #     render :existing
    #   end
    # end

    def add_existing
      byebug
      @inventory = Inventory.find(params[:inventory_id])
      quantity = params[:quantity].to_i
      @inventory.quantity += quantity
      if @inventory.save
        redirect_to inventories_path, notice: 'Inventory updated successfully.'
      else
        flash.now[:error] = 'Failed to update inventory.'
        render :existing
      end
    end
  
    private
  
    def inventory_params
      params.require(:inventory).permit(:name, :description, :quantity)
    end
  end
  