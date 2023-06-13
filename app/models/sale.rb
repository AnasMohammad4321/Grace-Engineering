class Sale < ApplicationRecord
  belongs_to :inventory
  belongs_to :order
end
