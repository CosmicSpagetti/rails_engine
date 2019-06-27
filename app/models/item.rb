class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoices 
  has_many :invoice_items

  validates_presence_of :name, :description, :unit_price 
  default_scope -> { order(id: :asc ) }
end
