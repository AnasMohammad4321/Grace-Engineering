require 'csv' 

class InventoriesController < ApplicationController
  http_basic_authenticate_with name: "Anas", password: "1234", except: [:index, :show]
    def index
      @inventories = Inventory.all
    end
  
    def new
      @inventory = Inventory.new
    end
  
    def create
      http_basic_authenticate_with name: "Anas", password: "1234"
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
      debugger
      @inventory = Inventory.find(params[:inventory_id])
      @inventory.quantity += params[:quantity].to_f
      if @inventory.save
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
  
    def download_csv
      inventories = Inventory.all
      csv_data = CSV.generate do |csv|
        csv << ["ID", "Name", "Description", "Quantity", "Created At", "Updated At"]
        inventories.each do |inventory|
          csv << [inventory.id, inventory.name, inventory.description, inventory.quantity, inventory.created_at, inventory.updated_at]
        end
      end
  
      send_data csv_data, filename: "inventory_data.csv"
    end
    
    def add_existing
    end
  
    private
  
    def inventory_params
      params.require(:inventory).permit(:name, :quantity)
    end

    def authenticate
      unless action_name == 'index' || action_name == 'show'
        authenticate_or_request_with_http_basic do |username, password|
          username == "Anas" && password == "1234"
        end
      end
    end

  end
  