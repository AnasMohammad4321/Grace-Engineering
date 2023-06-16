require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index method' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'renders the new method' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      # Test that the controller creates a new inventory
      it 'creates a new inventory' do
        expect {
          post :create, params: { inventory: { name: 'New Inventory', description: 'New Description', quantity: 10 } }
        }.to change(Inventory, :count).by(1)
      end

      # Test that the controller redirects to the created inventory
      it 'redirects to the created inventory' do
        post :create, params: { inventory: { name: 'New Inventory', description: 'New Description', quantity: 10 } }

        expect(response).to redirect_to(Inventory.last)
        expect(flash[:notice]).to eq('Inventory item was successfully created.')
      end
    end

    # Test that the controller does not create a new inventory
    context 'with invalid params' do
      # Test that the controller does not create a new inventory
      it 'does not create a new inventory' do
        expect {
          post :create, params: { inventory: { name: nil, description: 'New Description', quantity: 10 } }
        }.not_to change(Inventory, :count)
      end

      # Test that the controller renders the new template
      it 'renders the new template' do
        post :create, params: { inventory: { name: nil, description: 'New Description', quantity: 10 } }

        expect(response).to render_template(:new)
      end
    end
  end

  # Test that the controller destroys an inventory
  describe 'DELETE #destroy' do
    let!(:inventory) { Inventory.create(name: 'Inventory 1', description: 'Description 1', quantity: 10) }

    # Test that the controller destroys an inventory
    it 'destroys the requested inventory' do
      expect {
        delete :destroy, params: { id: inventory.id }
      }.to change(Inventory, :count).by(-1)
    end

    # Test that the controller redirects to the inventories index
    it 'redirects to the inventories index' do
      delete :destroy, params: { id: inventory.id }

      expect(response).to redirect_to(inventories_url)
      expect(flash[:notice]).to eq('Inventory item was successfully deleted.')
    end
  end

end
