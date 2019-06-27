class InvoiceItem < ApplicationRecord
  belongs_to :item
  belongs_to :invoice
  validates_presence_of :quantity, :unit_price

  default_scope -> { order(id: :asc ) }
end
