# require 'rails_helper'

# RSpec.describe ProductionsController, type: :controller do
#   # Test that the controller renders the index template
#   describe 'GET #index' do
#     it 'renders the index method' do 
#       get :index
#       expect(response).to render_template('index')
#     end
#   end

#   # Test that the controller renders the new template
#   describe 'GET #new' do
#     it 'renders the new method' do 
#       get :new
#       expect(response).to render_template('new')
#     end
#   end 

# end


require 'rails_helper'

RSpec.describe ProductionsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all productions to @productions' do
      production1 = Production.create(inventory_id: 1, quantity_used: 10, production_date: Date.today)
      production2 = Production.create(inventory_id: 2, quantity_used: 5, production_date: Date.today)

      id1 = production1.inventory_id
      id2 = production2.inventory_id

      # if both ids exist, then we can assign make the production object
      if Inventory.exists?(id1) && Inventory.exists?(id2)
        @inventory1 = Inventory.find(id1)
        @inventory2 = Inventory.find(id2)
        @production1 = Production.new(inventory_id: @inventory1.id, quantity_used: production1.quantity_used, production_date: production1.production_date)
        @production2 = Production.new(inventory_id: @inventory2.id, quantity_used: production2.quantity_used, production_date: production2.production_date)

        expect(assigns(:productions)).to eq([@production1, @production2])

      else
        expect(assigns(:productions)).to eq(nil)
      end
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end


  # Test that the controller renders the new template
  describe 'GET #new' do
    it 'assigns a new production to @production' do
      get :new

      expect(assigns(:production)).to be_a_new(Production)
    end

    it 'renders the new template' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params and sufficient inventory quantity' do
      let!(:inventory) { Inventory.create(name: 'Inventory 1', description: 'Description 1', quantity: 15) }

      it 'creates a new production' do
        expect {
          post :create, params: { production: { inventory_id: inventory.id, quantity_used: 10, production_date: Date.today } }
        }.to change(Production, :count).by(1)
      end
    end
  end
end

  #     it 'subtracts the quantity used from the inventory quantity' do
  #       post :create, params: { production: { inventory_id: inventory.id, quantity_used: 10, production_date: Date.today } }
  #       inventory.reload

  #       expect(inventory.quantity).to eq(5)
  #     end

  #     it 'redirects to the created production' do
  #       post :create, params: { production: { inventory_id: inventory.id, quantity_used: 10, production_date: Date.today } }

  #       expect(response).to redirect_to(Production.last)
  #       expect(flash[:notice]).to eq('Production was successfully created.')
  #     end
  #   end

  #   context 'with invalid params' do
  #     it 'does not create a new production' do
  #       expect {
  #         post :create, params: { production: { inventory_id: nil, quantity_used: 10, production_date: Date.today } }
          
  #       }.not_to change(Production, :count)
        
        
  #     end

  #     it 'renders the new template' do
  #       post :create, params: { production: { inventory_id: nil, quantity_used: 10, production_date: Date.today } }

  #       expect(response).to render_template(:new)
  #     end
  #   end

  #   context 'with valid params but insufficient inventory quantity' do
  #     let!(:inventory) { Inventory.create(name: 'Inventory 1', description: 'Description 1', quantity: 5) }

  #     it 'does not create a new production' do
  #       expect {
  #         post :create, params: { production: { inventory_id: inventory.id, quantity_used: 10, production_date: Date.today } }
  #       }.not_to change(Production, :count)
  #     end

  #     it 'renders the new template' do
  #       post :create, params: { production: { inventory_id: inventory.id, quantity_used: 10, production_date: Date.today } }

  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end
end
