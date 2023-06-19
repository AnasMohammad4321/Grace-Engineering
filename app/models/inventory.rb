class Inventory < ApplicationRecord
    validates :name, presence: true
    validates :descriptio, presence: false
    validates :quantity, presence: true
    validates :quantity, numericality: { only_float: true }
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end