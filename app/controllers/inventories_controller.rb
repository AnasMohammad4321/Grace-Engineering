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
  
    private
  
    def inventory_params
      params.require(:inventory).permit(:name, :description, :quantity)
    end
  end
  