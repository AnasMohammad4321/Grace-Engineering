class Production < ApplicationRecord
  belongs_to :inventory

    # Custom validation to check quantity_used against inventory quantity
    validate :validate_quantity_used

    private
  
    def validate_quantity_used
      if quantity_used && inventory && quantity_used > inventory.quantity
        errors.add(:quantity_used, "cannot be greater than inventory quantity")
      end
    end
end
