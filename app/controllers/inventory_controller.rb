class InventoryController < ApplicationController
    def index
      @inventories = Inventory.all
    end
end